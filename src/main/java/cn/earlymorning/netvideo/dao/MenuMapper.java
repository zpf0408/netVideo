package cn.earlymorning.netvideo.dao;

import cn.earlymorning.netvideo.beans.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单
 *
 * @author zpf
 * @create 2019-05-13-22:53
 */
public interface MenuMapper {
	public List<Menu> getMenus();

	public Menu getMenuById(@Param("id") Integer id);

	public Integer updMenu(Menu menu);

	public Integer addMenu(Menu menu);

	public Integer delMenus(List<Menu> menus);

	public Integer delMenuById(@Param("id") Integer id);

}
