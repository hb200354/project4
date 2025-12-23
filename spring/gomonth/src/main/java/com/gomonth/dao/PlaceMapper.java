package com.gomonth.dao;

import com.gomonth.dto.PlaceDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface PlaceMapper {
    // 겨울 여행지 전체 목록 조회 (winter.jsp용)
    List<PlaceDTO> getWinterPlaces();
    
    // 특정 장소 상세 정보 조회 (detail.jsp용)
    PlaceDTO getPlaceDetail(String id);
}