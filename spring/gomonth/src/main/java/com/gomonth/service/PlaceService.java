package com.gomonth.service;

import com.gomonth.dao.PlaceMapper;
import com.gomonth.dto.PlaceDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PlaceService {
    @Autowired
    private PlaceMapper placeMapper;

    public List<PlaceDTO> getPlacesBySeason(String seasonType) {
        return placeMapper.getPlacesBySeason(seasonType);
    }

    public PlaceDTO getPlaceDetail(String id) {
        return placeMapper.getPlaceDetail(id);
    }
}