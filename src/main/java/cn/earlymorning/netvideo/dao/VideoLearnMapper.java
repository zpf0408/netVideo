package cn.earlymorning.netvideo.dao;

import cn.earlymorning.netvideo.beans.VideoLearn;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-24-23:11
 */
public interface VideoLearnMapper {

    public List<VideoLearn> getVideolearns(@Param("courseId") Integer courseId,@Param("customerId") Integer customerId);

    public VideoLearn getVideoLearnByPrimaryId(Integer videoId);



    public Integer insert(VideoLearn videoLearn);

    public VideoLearn getVideoLearn(VideoLearn videoLearn);



}
