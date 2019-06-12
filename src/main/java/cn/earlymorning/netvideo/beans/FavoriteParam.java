package cn.earlymorning.netvideo.beans;

/**
 * @author zpf
 * @create 2019-06-06-14:57
 */
public class FavoriteParam {

    private Integer customerId;

    private Integer courseId;

    public FavoriteParam(Integer customerId, Integer courseId) {
        this.customerId = customerId;
        this.courseId = courseId;
    }

    public FavoriteParam() {
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
}
