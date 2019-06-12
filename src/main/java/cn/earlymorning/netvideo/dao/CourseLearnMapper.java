package cn.earlymorning.netvideo.dao;

import cn.earlymorning.netvideo.beans.CourseLearn;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-20-23:31
 */
public interface CourseLearnMapper {

    public List<CourseLearn> getCourseLearns(@Param("customerId") Integer customerId);

    public List<CourseLearn> getCourseLearning(@Param("customerId") Integer customerId);

    public List<CourseLearn> getAlls();

    public Integer insert(CourseLearn courseLearn);

    public Integer updCourseLearned(CourseLearn courseLearn);

    public Integer courseCountPlus(CourseLearn courseLearn);

    public CourseLearn getCourseLearn(@Param("courseId") Integer courseId,@Param("customerId")Integer customerId);


}
