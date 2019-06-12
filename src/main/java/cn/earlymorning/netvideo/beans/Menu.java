package cn.earlymorning.netvideo.beans;

import java.io.Serializable;

public class Menu implements Serializable {

	private Integer menuId;
	private String menuName;
	private String url;
	private Integer pid;
	private Integer menuLevel;
	private String icon;
	private String sort;
	private Integer hidden;

	public Menu(Integer menuId, String menuName, String url, Integer pid, Integer menuLevel, String icon, String sort, Integer hidden) {
		this.menuId = menuId;
		this.menuName = menuName;
		this.url = url;
		this.pid = pid;
		this.menuLevel = menuLevel;
		this.icon = icon;
		this.sort = sort;
		this.hidden = hidden;
	}

	public Menu() {
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(Integer menuLevel) {
		this.menuLevel = menuLevel;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Integer getHidden() {
		return hidden;
	}

	public void setHidden(Integer hidden) {
		this.hidden = hidden;
	}
}
