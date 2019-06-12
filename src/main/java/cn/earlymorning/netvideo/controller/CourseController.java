package cn.earlymorning.netvideo.controller;

import cn.earlymorning.netvideo.beans.*;
import cn.earlymorning.netvideo.services.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author zpf
 * @create 2019-05-17-19:54
 */
@Controller
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private CourseTypeService courseTypeService;

    @Autowired
    private RoundDiagramService roundDiagramService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private VideoService videoService;

    @Autowired
    private VideoLearnService videoLearnService;

    @Autowired
    private CourseLearnService courseLearnService;

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.addObject("courseTypes", courseTypes);

        List<RoundDiagram> roundDiagrams = roundDiagramService.getAlls();
        mv.addObject("roundDiagrams", roundDiagrams);

        List<Course> courses = courseService.getCourses();
        mv.addObject("courses", courses);


        mv.setViewName("/index");
        return mv;
    }

    @RequestMapping("/courseDisplay/{typeId}")
    public ModelAndView courseDisplay(@PathVariable("typeId") Integer typeId, @RequestParam(value = "page", required = false) String page,
                                      @RequestParam(value = "q", required = false) String q) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/course/courseDisplay");
        CourseType courseType = new CourseType();
        if (typeId == 0) {
            courseType.setTypeName("全部课程");
            courseType.setTypeId(0);
        } else {
            courseType = courseTypeService.getCourseById(typeId);
        }
        Integer limit = 12;

        Integer curPage = 1;
        if (page != null && !page.trim().equals("")) {
            curPage = Integer.parseInt(page.trim()) > 0 ? Integer.parseInt(page.trim()) : 1;
        }
        Page<Object> page1 = PageHelper.startPage(curPage, limit);
        List<Course> courses = courseService.getCoursesByTypeId(typeId);

        //总页数
        int pages = page1.getPages();
        if (curPage > pages) {
            curPage = pages;
        }
        //获取当前页
        int cur = page1.getPageNum();
        //总个数
        long total = page1.getTotal();
        RowBounds rowBounds = new RowBounds(cur, pages, total, limit);
        mv.addObject("courses", courses);
        mv.addObject("rowBounds", rowBounds);
        mv.addObject("courseType", courseType);

        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.addObject("courseTypes", courseTypes);


        return mv;
    }

   /* @RequestMapping("/learning")
    public ModelAndView learning(){
        ModelAndView mv = new ModelAndView();
        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.addObject("courseTypes",courseTypes);
        mv.setViewName("/course/learning");
        return mv;
    }

    @RequestMapping("/learned")
    public ModelAndView learned(){
        ModelAndView mv = new ModelAndView();
        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.addObject("courseTypes",courseTypes);
        mv.setViewName("/course/learned");
        return mv;
    }*/

    /*@RequestMapping("/favorite")
    public ModelAndView favorite(){
        ModelAndView mv = new ModelAndView();
        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.addObject("courseTypes",courseTypes);
        mv.setViewName("/course/favorite");
        return mv;
    }*/

    @RequestMapping("/{courseId}")
    public ModelAndView courseInfo(@PathVariable("courseId") Integer courseId, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Course course = courseService.selectByPrimaryKey(courseId);
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        Favorite favorite1 = new Favorite(customer, course);
        Favorite favorite = favoriteService.getFavoriteByPrimaryId(favorite1);
        List<Video> videos = videoService.getVideosByCourseId(courseId);
        List<CourseType> courseTypes = courseTypeService.getAlls();
        List<VideoLearn> videoLearns = videoLearnService.getVideoLearns(courseId, customer.getId());

        for (int i = 0; i < videoLearns.size(); i++) {
            for (int j = 0; j < videos.size(); j++) {
                if (videoLearns.get(i).getVideoId().equals(videos.get(j).getVideoId())) {
                    videos.get(j).setIsWatched("1");
                }
            }

        }
        CourseLearn courseLearn = courseLearnService.getCourseLearn(courseId,customer.getId());
        mv.addObject("courseLearn", courseLearn);
        mv.addObject("videoLearns", videoLearns);
        mv.addObject("courseTypes", courseTypes);
        mv.addObject("videos", videos);
        mv.addObject("favorite", favorite);
        mv.addObject("course", course);
        mv.setViewName("course/courseInfo");
        return mv;
    }

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam("q") String q, @RequestParam(value = "page", required = false) String page) {
        ModelAndView mv = new ModelAndView();
        Integer limit = 12;

        Integer curPage = 1;
        if (page != null && !page.trim().equals("")) {
            curPage = Integer.parseInt(page.trim()) > 0 ? Integer.parseInt(page.trim()) : 1;
        }
        Page<Object> page1 = PageHelper.startPage(curPage, limit);
        List<Course> courses = courseService.search(q);
        //总页数
        int pages = page1.getPages();
        if (curPage > pages) {
            curPage = pages;
        }
        //获取当前页
        int cur = page1.getPageNum();
        //总个数
        long total = page1.getTotal();
        RowBounds rowBounds = new RowBounds(cur, pages, total, limit);
        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.addObject("courseTypes",courseTypes);
        mv.addObject("courses", courses);
        mv.addObject("rowBounds", rowBounds);
        mv.addObject("q", q);
        mv.setViewName("/course/search");

        return mv;
    }

    @RequestMapping("/list")
    public ModelAndView courseList(@RequestParam(value = "page", required = false) String page){
        ModelAndView mv = new ModelAndView();
        Integer limit = 9;

        Integer curPage = 1;
        if (page != null && !page.trim().equals("")) {
            curPage = Integer.parseInt(page.trim()) > 0 ? Integer.parseInt(page.trim()) : 1;
        }
        Page<Object> page1 = PageHelper.startPage(curPage, limit);
        List<Course> courses = courseService.getCourses();

        //总页数
        int pages = page1.getPages();
        if (curPage > pages) {
            curPage = pages;
        }
        //获取当前页
        int cur = page1.getPageNum();
        //总个数
        long total = page1.getTotal();
        RowBounds rowBounds = new RowBounds(cur, pages, total, limit);
        mv.setViewName("/course/course_list");
        mv.addObject("courses",courses);
        mv.addObject("rowBounds",rowBounds);
        return mv;
    }


}
