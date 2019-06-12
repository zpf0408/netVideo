package cn.earlymorning.netvideo.services;

import cn.earlymorning.netvideo.beans.Course;
import cn.earlymorning.netvideo.beans.CourseLearn;
import cn.earlymorning.netvideo.dao.CourseLearnMapper;
import cn.earlymorning.netvideo.dao.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-21-10:56
 */
@Service
public class CourseLearnService {

    @Autowired
    private CourseLearnMapper courseLearnMapper;

    @Autowired
    private CourseMapper courseMapper;


    public List<CourseLearn> getCourseLearns(Integer customerId) {
        List<CourseLearn> courseLearns = courseLearnMapper.getCourseLearns(customerId);

        return courseLearns;
    }

    public List<CourseLearn> getCourseLearning(Integer customerId) {
        List<CourseLearn> courseLearns = courseLearnMapper.getCourseLearning(customerId);

        return courseLearns;
    }

    public List<CourseLearn> getAlls() {
        List<CourseLearn> courseLearns = courseLearnMapper.getAlls();

        return courseLearns;
    }

    public Integer addCourseLearn(CourseLearn courseLearn) {
        return courseLearnMapper.insert(courseLearn);
    }

    public Integer updCoursePlus(CourseLearn courseLearn) {
        Integer i = courseLearnMapper.courseCountPlus(courseLearn);
        Course course = courseMapper.selectByPrimaryKey(courseLearn.getCourse().getCourseId());
        if (course.getVideoCount().equals(courseLearn.getLearnCount())) {
            Integer ii = updCourseLearned(courseLearn);
            System.out.println("ii="+ii);
        }
        return i;
    }

    public Integer updCourseLearned(CourseLearn courseLearn) {
        Integer i = courseLearnMapper.updCourseLearned(courseLearn);
        return i;
    }

    public CourseLearn getCourseLearn(Integer courseId, Integer customerId) {
        CourseLearn courseLearn = courseLearnMapper.getCourseLearn(courseId, customerId);
        return courseLearn;
    }

}
