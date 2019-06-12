package cn.earlymorning.netvideo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author zpf
 * @create 2019-05-19-14:30
 */
@Controller
public class Index {

    @RequestMapping("/")
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/course/index");

        return mv;
    }
}
