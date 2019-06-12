package cn.earlymorning.netvideo.controller;

import cn.earlymorning.netvideo.beans.*;
import cn.earlymorning.netvideo.services.CourseLearnService;
import cn.earlymorning.netvideo.services.CourseTypeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author zpf
 * @create 2019-05-21-9:58
 */
@Controller
@RequestMapping("/course")
public class CourseLearnController {

    @Autowired
    private CourseLearnService courseLearnService;

    @Autowired
    private CourseTypeService courseTypeService;


    /**
     *
     * @param page
     * @param request
     * @return
     */
    @RequestMapping(value = "learned")
    public ModelAndView getCourseLearns(@RequestParam(value = "page",required = false) String page, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        //每页个数
        Integer limit = 3;
        Customer customer = (Customer) session.getAttribute("customer");

        Integer curPage = 1;
        if(page!=null&&!page.trim().equals("")){
            curPage = Integer.parseInt(page.trim())>0?Integer.parseInt(page.trim()):1;
        }else{
            curPage = 1;
        }

        Page<Object> page1 = PageHelper.startPage(curPage,limit);
        List<CourseLearn> courseLearns = courseLearnService.getCourseLearns(customer.getId());
        //总页数
        int pages = page1.getPages();
        //获取当前页
        int cur = page1.getPageNum();

        //总个数
        long total = page1.getTotal();
        RowBounds rowBounds = new RowBounds(cur,pages,total,limit);
        List<CourseType> courseTypes = courseTypeService.getAlls();


        mv.setViewName("/course/learned");


        mv.addObject("courseTypes",courseTypes);

        mv.addObject("rowBounds",rowBounds);
        mv.addObject("courseLearns",courseLearns);
        return mv;
    }

    @RequestMapping("/learning")
    public ModelAndView learning(@RequestParam(value = "page",required = false) String page, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        //每页个数
        Integer limit = 3;
        Customer customer = (Customer) session.getAttribute("customer");
        Integer curPage = 1;
        if(page!=null&&!page.trim().equals("")){
            curPage = Integer.parseInt(page.trim())>0?Integer.parseInt(page.trim()):1;
        }

        Page<Object> page1 = PageHelper.startPage(curPage,limit);
        List<CourseLearn> courseLearns = courseLearnService.getCourseLearning(customer.getId());
        //总页数
        int pages = page1.getPages();
        if(curPage>pages){
            curPage = pages;
        }
        //获取当前页
        int cur = page1.getPageNum();
        //总个数
        long total = page1.getTotal();
        RowBounds rowBounds = new RowBounds(cur,pages,total,limit);
        List<CourseType> courseTypes = courseTypeService.getAlls();

        mv.setViewName("/course/learning");
        mv.addObject("courseTypes",courseTypes);
        mv.addObject("courseLearns",courseLearns);
        mv.addObject("rowBounds",rowBounds);

        return mv;
    }

    @RequestMapping("/learning1")
    public ModelAndView learning1(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        Customer customer = (Customer)session.getAttribute("customer");
        List<CourseLearn> courseLearns = courseLearnService.getAlls();
        mv.addObject("courseLearns",courseLearns);
        mv.setViewName("/course/learned");
        return mv;
    }

    @RequestMapping("learn/{courseId}")
    public ModelAndView addCourseLearn(@PathVariable("courseId") Integer courseId, @SessionAttribute("customer") Customer customer){
        ModelAndView mv = new ModelAndView();
        CourseLearn courseLearn = courseLearnService.getCourseLearn(courseId,customer.getId());
        if(courseLearn==null){
            CourseLearn courseLearn1 = new CourseLearn();
            courseLearn1.setCustomer(customer);
            Course course = new Course();
            course.setCourseId(courseId);
            courseLearn1.setCourse(course);
            courseLearnService.addCourseLearn(courseLearn1);

        }
        mv.setViewName("redirect:/course/"+courseId);
        return mv;
    }
}
