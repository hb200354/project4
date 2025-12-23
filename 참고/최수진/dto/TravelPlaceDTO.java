package dto;

public class TravelPlaceDTO {

    private int placeId;              // 여행지 ID (PK)
    private String title;             // 여행지 이름
    private String location;          // 위치
    private String recommendSeason;   // 추천 시즌
    private String mainImage;          // 메인 이미지
    private String subImage;           // 서브 이미지
    private int monthNum;              // 월 (6,7,8)

    public TravelPlaceDTO() {}

    public int getPlaceId() {
        return placeId;
    }

    public void setPlaceId(int placeId) {
        this.placeId = placeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getRecommendSeason() {
        return recommendSeason;
    }

    public void setRecommendSeason(String recommendSeason) {
        this.recommendSeason = recommendSeason;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public String getSubImage() {
        return subImage;
    }

    public void setSubImage(String subImage) {
        this.subImage = subImage;
    }

    public int getMonthNum() {
        return monthNum;
    }

    public void setMonthNum(int monthNum) {
        this.monthNum = monthNum;
    }
}
