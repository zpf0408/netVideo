package cn.earlymorning.netvideo.services;

import cn.earlymorning.netvideo.beans.VideoLearn;
import cn.earlymorning.netvideo.dao.VideoLearnMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-24-17:11
 */
@Service
public class VideoLearnService {

    @Autowired
    private VideoLearnMapper videoLearnMapper;


    public List<VideoLearn> getVideoLearns(Integer courseId,Integer customerId){
        List<VideoLearn> videoLearns = videoLearnMapper.getVideolearns(courseId,customerId);
        return videoLearns;
    }

    public VideoLearn getVideoLearn(VideoLearn videoLearn){
        VideoLearn videoLearn1 = videoLearnMapper.getVideoLearn(videoLearn);

        return videoLearn1;
    }

    public Integer insert(VideoLearn videoLearn){
        Integer i = videoLearnMapper.insert(videoLearn);
        return i;
    }



}
