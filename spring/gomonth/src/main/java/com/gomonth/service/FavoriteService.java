package com.gomonth.service;

import java.util.List;
import com.gomonth.dto.FavoriteDTO;

public interface FavoriteService {
    List<FavoriteDTO> getMyFavorites(String userId);
    boolean removeFavorite(String userId, String placeId);
    boolean addFavorite(String userId, String placeId);
    boolean checkFavoriteStatus(String placeId, String userId);
}