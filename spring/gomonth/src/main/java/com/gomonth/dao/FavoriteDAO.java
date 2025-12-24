package com.gomonth.dao;

import com.gomonth.dto.FavoriteDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface FavoriteDAO {
    List<FavoriteDTO> getFavoritesByUserId(String userId);
    int isFavorite(@Param("placeId") String placeId, @Param("userId") String userId);
    int insertFavorite(@Param("userId") String userId, @Param("placeId") String placeId);
    int deleteFavorite(@Param("userId") String userId, @Param("placeId") String placeId);
}