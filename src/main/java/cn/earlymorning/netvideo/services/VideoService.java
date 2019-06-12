package cn.earlymorning.netvideo.services;

import cn.earlymorning.netvideo.beans.Video;
import cn.earlymorning.netvideo.dao.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-24-16:30
 */
@Service
public class VideoService {

    @Autowired
    private VideoMapper videoMapper;

    public List<Video> getVideosByCourseId(Integer courseId){
        List<Video> videos = videoMapper.getVideoByCourseId(courseId);
        return videos;
    }

    public Video getVideoByPrimaryId(Integer videoId){
        Video video = videoMapper.selectByPrimaryKey(videoId);

        return video;
    }
}
