package cn.earlymorning.netvideo.controller;

import cn.earlymorning.netvideo.beans.Course;
import cn.earlymorning.netvideo.beans.CourseType;
import cn.earlymorning.netvideo.beans.Customer;
import cn.earlymorning.netvideo.services.CourseService;
import cn.earlymorning.netvideo.services.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author zpf
 * @create 2019-06-10-22:11
 */
@Controller
@RequestMapping("/comment")
public class CourseCommentController {


    @Autowired
    private CourseService courseService;

    @Autowired
    private CourseTypeService courseTypeService;

    @RequestMapping("/{courseId}")
    public ModelAndView comment(@PathVariable("courseId") Integer courseId, @SessionAttribute("customer") Customer customer){
        ModelAndView mv = new ModelAndView();
        Course course = courseService.selectByPrimaryKey(courseId);
        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.setViewName("/course/comment");
        mv.addObject("course",course);
        mv.addObject("courseTypes",courseTypes);
        return mv;
    }
}
