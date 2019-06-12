package cn.earlymorning.netvideo.services;

import cn.earlymorning.netvideo.beans.Favorite;
import cn.earlymorning.netvideo.dao.FavoriteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zpf
 * @create 2019-05-21-10:17
 */
@Service
public class FavoriteService {

    @Autowired
    private FavoriteMapper favoriteMapper;

    public List<Favorite> getFavorites(Integer customerId){
        List<Favorite> favorites = favoriteMapper.getFavorites(customerId);

        return favorites;
    }

    public Integer delCollect(Favorite favorite){
        Integer collect = favoriteMapper.delFavorite(favorite);

        return collect;
    }

    public Favorite getFavoriteByPrimaryId(Favorite favorite){
        Favorite favorite1 = favoriteMapper.getFavoriteByPrimaryId(favorite);
        return favorite1;
    }

    public Integer addFavorite(Favorite favorite){
        return favoriteMapper.addFactory(favorite);
    }
}
