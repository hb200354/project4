package com.gomonth.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gomonth.dao.FavoriteDAO;
import com.gomonth.dto.FavoriteDTO;

@Service // 위치 확인
public class FavoriteServiceImpl implements FavoriteService {
    @Autowired
    private FavoriteDAO favoriteDAO;

    @Override
    public List<FavoriteDTO> getMyFavorites(String userId) {
        return favoriteDAO.getFavoritesByUserId(userId);
    }
    @Override
    public boolean addFavorite(String userId, String placeId) {
        return favoriteDAO.insertFavorite(userId, placeId) > 0;
    }
    @Override
    public boolean removeFavorite(String userId, String placeId) {
        return favoriteDAO.deleteFavorite(userId, placeId) > 0;
    }
    @Override
    public boolean checkFavoriteStatus(String placeId, String userId) {
        return favoriteDAO.isFavorite(placeId, userId) > 0;
    }
}