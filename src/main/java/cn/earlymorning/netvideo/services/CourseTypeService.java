package cn.earlymorning.netvideo.services;

import cn.earlymorning.netvideo.beans.CourseType;
import cn.earlymorning.netvideo.dao.CourseTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-17-19:47
 */
@Service
public class CourseTypeService {
    @Autowired
    private CourseTypeMapper courseTypeMapper;

    public List<CourseType> getAlls(){
        List<CourseType> courseTypes = courseTypeMapper.getCourseTypes();
        return courseTypes;
    }


    public CourseType getCourseById(Integer typeId){
        CourseType courseType = courseTypeMapper.selectByPrimaryKey(typeId);

        return courseType;

    }

}
