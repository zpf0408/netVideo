package cn.earlymorning.netvideo.beans;

/**
 * @author zpf
 * @create 2019-05-21-13:23
 */
public class RowBounds {
    private Integer curPage;
    private Integer pages;
    private long total;
    private Integer limit;

    public RowBounds(Integer curPage, Integer pages, long total, Integer limit) {
        this.curPage = curPage;
        this.pages = pages;
        this.total = total;
        this.limit = limit;
    }

    public RowBounds() {
    }

    public Integer getCurPage() {
        return curPage;
    }

    public void setCurPage(Integer curPage) {
        this.curPage = curPage;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
