package cn.earlymorning.netvideo.beans;

/**
 * @author 63299
 * @create 2019-05-12
 */
public class RoundDiagram {
    private Integer roundId;
    private String url;
    private Integer courseId;
    private String descript;

    public Integer getRoundId() {
        return roundId;
    }

    public void setRoundId(Integer roundId) {
        this.roundId = roundId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }
}