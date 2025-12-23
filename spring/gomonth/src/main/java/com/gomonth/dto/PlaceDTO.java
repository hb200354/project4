package com.gomonth.dto;

import java.util.List;
import lombok.Data;

@Data
public class PlaceDTO {
    private String placeId;
    private String title;
    private String location;
    private String bannerImg;
    private String listImg;
    private String seasonNote;
    private String seasonType;
    private String isFeatured;
    private int monthVal;
    
    private List<PlaceTipDTO> tips; 
}