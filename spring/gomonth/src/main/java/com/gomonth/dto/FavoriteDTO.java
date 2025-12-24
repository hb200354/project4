package com.gomonth.dto;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class FavoriteDTO {
    private int favId;
    private String userId;
    private String placeId;
    private Timestamp createdAt;
    
    private String title;
    private String summary;
    private String seasonType; 
    private String listImg;
}