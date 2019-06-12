package cn.earlymorning.netvideo.controller;

import cn.earlymorning.netvideo.beans.*;
import cn.earlymorning.netvideo.dao.VideoMapper;
import cn.earlymorning.netvideo.services.CourseLearnService;
import cn.earlymorning.netvideo.services.CourseTypeService;
import cn.earlymorning.netvideo.services.VideoLearnService;
import cn.earlymorning.netvideo.services.VideoService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author zpf
 * @create 2019-05-20-17:49
 */
@Controller
@RequestMapping("/video")
public class VideoController {

    @Autowired
    private VideoService videoService;

    @Autowired
    private CourseTypeService courseTypeService;

    @Autowired
    private VideoLearnService videoLearnService;

    @Autowired
    private CourseLearnService courseLearnService;

    @RequestMapping("/{videoId}")
    public ModelAndView videoPlayer(@PathVariable Integer videoId, HttpSession session){
        ModelAndView mv = new ModelAndView();
        Customer customer = (Customer) session.getAttribute("customer");
        Video video = videoService.getVideoByPrimaryId(videoId);
        mv.addObject("video",video);
        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.addObject("courseTypes",courseTypes);
        VideoLearn videoLearn = new VideoLearn();
        videoLearn.setCustomerId(customer.getId());
        videoLearn.setVideoId(videoId);
        videoLearn.setIsWatched("1");
        videoLearn.setCourseId(video.getCourseId());
        if(videoLearnService.getVideoLearn(videoLearn)==null){
            videoLearnService.insert(videoLearn);
            CourseLearn courseLearn = courseLearnService.getCourseLearn(video.getCourseId(),customer.getId());
            if(courseLearn==null){
                CourseLearn courseLearn1 = new CourseLearn();
                courseLearn1.setCustomer(customer);
                Course course = new Course();
                course.setCourseId(video.getCourseId());
                courseLearn1.setCourse(course);
                courseLearnService.addCourseLearn(courseLearn1);

            }
            courseLearn = courseLearnService.getCourseLearn(video.getCourseId(),customer.getId());
            courseLearnService.updCoursePlus(courseLearn);



        }

        mv.setViewName("/video/videoPlayer");
        return mv;
    }

    @RequestMapping("/list/{courseId}")
    public ModelAndView videoList(@PathVariable("courseId") Integer courseId,@RequestParam(value = "page", required = false) String page){
        ModelAndView mv = new ModelAndView();
        Integer limit = 9;

        Integer curPage = 1;
        if (page != null && !page.trim().equals("")) {
            curPage = Integer.parseInt(page.trim()) > 0 ? Integer.parseInt(page.trim()) : 1;
        }
        Page<Object> page1 = PageHelper.startPage(curPage, limit);
        List<Video> videos = videoService.getVideosByCourseId(courseId);

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

        mv.addObject("videos",videos);
        mv.addObject("rowBounds",rowBounds);
        mv.setViewName("/video/video_list");
        return mv;
    }
}
