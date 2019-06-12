package cn.earlymorning.netvideo.controller;

import cn.earlymorning.netvideo.beans.*;

import cn.earlymorning.netvideo.services.CourseTypeService;
import cn.earlymorning.netvideo.services.FavoriteService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author zpf
 * @create 2019-05-20-17:49
 */
@Controller
public class FavoriteController {

    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private CourseTypeService courseTypeService;

    @RequestMapping("/favorite")
    public ModelAndView getFavorites(@RequestParam(value = "page", required = false) String page, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();

        Integer limit = 16;
        Customer customer = (Customer) session.getAttribute("customer");

        Integer curPage = 1;
        if (page != null && !page.trim().equals("")) {
            curPage = Integer.parseInt(page.trim()) > 0 ? Integer.parseInt(page.trim()) : 1;

        }
        Page<Object> pageHelper = PageHelper.startPage(curPage, limit);
        List<Favorite> favorites = favoriteService.getFavorites(customer.getId());
        //总页数
        int pages = pageHelper.getPages();
        if (curPage > pages) {
            curPage = pages;
        }
        //获取当前页
        int cur = pageHelper.getPageNum();
        //总个数
        long total = pageHelper.getTotal();
        RowBounds rowBounds = new RowBounds(cur, pages, total, limit);

        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.setViewName("/course/favorite");

        mv.addObject("rowBounds", rowBounds);
        mv.addObject("favorites", favorites);

        mv.addObject("courseTypes", courseTypes);


        return mv;
    }

    @ResponseBody
    @RequestMapping("/collect")
    public MessageResult collect(@RequestBody Favorite favorite) {
        MessageResult<Favorite> messageResult = new MessageResult<>();
        if (favoriteService.getFavoriteByPrimaryId(favorite) == null) {
            Integer i = favoriteService.addFavorite(favorite);

            if (i >= 1) {
                messageResult.setCode("0");
                messageResult.setStatus(true);
                messageResult.setData(favorite);
                messageResult.setMessage("收藏成功！");
            } else {
                messageResult.setCode("1");
                messageResult.setStatus(false);
                messageResult.setData(favorite);
                messageResult.setMessage("收藏失败！");
            }
        } else {
            Integer co = favoriteService.delCollect(favorite);

            if (co >= 1) {
                messageResult.setCode("2");
                messageResult.setStatus(true);
                messageResult.setData(favorite);
                messageResult.setMessage("取消收藏成功！");
            } else {
                messageResult.setCode("1");
                messageResult.setStatus(false);
                messageResult.setData(favorite);
                messageResult.setMessage("取消收藏失败！");
            }
        }

        return messageResult;
    }


}
