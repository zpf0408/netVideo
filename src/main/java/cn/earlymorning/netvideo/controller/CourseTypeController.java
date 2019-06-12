package cn.earlymorning.netvideo.controller;

import cn.earlymorning.netvideo.beans.CourseType;
import cn.earlymorning.netvideo.services.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-18-15:09
 */
@Controller
@RequestMapping("courseType")
public class CourseTypeController {

    @Autowired
    private CourseTypeService courseTypeService;

    @RequestMapping("/getCourseTypes")
    public ModelAndView getCourseType(){
        ModelAndView mv = new ModelAndView();
        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.addObject("courseTypes",courseTypes);
        mv.setViewName("/include/header");
        return mv;
    }

}
