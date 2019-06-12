package cn.earlymorning.netvideo.beans;

/**
 * @author zpf
 * @create 2019-05-20-17:52
 */
public class CourseLearn {
    private Course course;

    private Customer customer;

    private String isLearned;

    private Integer learnCount;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getIsLearned() {
        return isLearned;
    }

    public void setIsLearned(String isLearned) {
        this.isLearned = isLearned;
    }

    public Integer getLearnCount() {
        return learnCount;
    }

    public void setLearnCount(Integer learnCount) {
        this.learnCount = learnCount;
    }
}
