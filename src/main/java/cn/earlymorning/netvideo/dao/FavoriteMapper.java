package cn.earlymorning.netvideo.dao;

import cn.earlymorning.netvideo.beans.Favorite;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-20-17:48
 */
public interface FavoriteMapper {


    public List<Favorite> getFavorites(@Param("customerId") Integer customerId);

    public Integer delFavorite(Favorite favorite);

    public Favorite getFavoriteByPrimaryId(Favorite favorite);

    public Integer addFactory(Favorite favorite);


}
