package com.gomonth.dto;

import java.util.Date;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InquiriesDTO {
    private int inqId;
    private String userId;
    private String title;
    private String content;
    private String status;
    private Date createdAt;
    private String ansContent;   
    private Date answeredAt;    
}