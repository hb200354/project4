package com.gomonth.dao;

import com.gomonth.dto.PlaceDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface PlaceMapper {
    List<PlaceDTO> getPlacesBySeason(String seasonType);
    
    PlaceDTO getPlaceDetail(String id);
}