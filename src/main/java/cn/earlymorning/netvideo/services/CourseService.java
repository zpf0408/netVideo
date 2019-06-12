package cn.earlymorning.netvideo.services;

import cn.earlymorning.netvideo.beans.Course;
import cn.earlymorning.netvideo.dao.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-17-20:07
 */
@Service
public class CourseService {
    @Autowired
    private CourseMapper courseMapper;

    public List<Course> getCourses(){
        List<Course> courses = courseMapper.getCourses();
        return  courses;
    }

    public List<Course> getCoursesByTypeId(Integer typeId){
        List<Course> courses = courseMapper.getCoursesByTypeId(typeId);
        return courses;
    }

    public List<Course> search(String q){
        List<Course> courses = courseMapper.search(q);
        return courses;
    }

    public Course selectByPrimaryKey(Integer courseId){
        Course course = courseMapper.selectByPrimaryKey(courseId);

        return course;
    }
}
