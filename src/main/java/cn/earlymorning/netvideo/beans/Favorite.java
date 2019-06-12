package cn.earlymorning.netvideo.beans;

/**
 * @author zpf
 * @create 2019-05-20-17:47
 */
public class Favorite {

    private Customer customer;

    private Course course;

    public Favorite(Customer customer, Course course) {
        this.customer = customer;
        this.course = course;
    }

    public Favorite() {
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
