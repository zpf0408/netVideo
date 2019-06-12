package cn.earlymorning.netvideo.services;

import cn.earlymorning.netvideo.beans.RoundDiagram;
import cn.earlymorning.netvideo.dao.RoundDiagramMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 轮播图服务层
 *
 * @author zpf
 * @create 2019-05-16-17:17
 */
@Service
public class RoundDiagramService {

	@Autowired
	private RoundDiagramMapper roundDiagramMapper;

	public List<RoundDiagram> getAlls(){
		List<RoundDiagram> roundDiagrams = roundDiagramMapper.getAlls();
		return roundDiagrams;
	}
}
