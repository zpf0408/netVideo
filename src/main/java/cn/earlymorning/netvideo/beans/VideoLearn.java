package cn.earlymorning.netvideo.beans;

/**
 * @author zpf
 * @create 2019-05-20-23:29
 */
public class VideoLearn {

    private Integer videoId;

    private Integer customerId;

    private Integer learnTime;

    private String isWatched;

    private Integer courseId;

    public VideoLearn(Integer videoId, Integer customerId, Integer learnTime, String isWatched, Integer courseId) {
        this.videoId = videoId;
        this.customerId = customerId;
        this.learnTime = learnTime;
        this.isWatched = isWatched;
        this.courseId = courseId;
    }

    public VideoLearn() {
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getLearnTime() {
        return learnTime;
    }

    public void setLearnTime(Integer learnTime) {
        this.learnTime = learnTime;
    }

    public String getIsWatched() {
        return isWatched;
    }

    public void setIsWatched(String isWatched) {
        this.isWatched = isWatched;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
}
