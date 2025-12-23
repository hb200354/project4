package dto;

public class TravelDescDTO {

    private int descId;        // 설명 ID (PK)
    private int placeId;       // 여행지 ID (FK)
    private int descOrder;     // 설명 순서
    private String content;    // 설명 내용

    public TravelDescDTO() {}

    public int getDescId() {
        return descId;
    }

    public void setDescId(int descId) {
        this.descId = descId;
    }

    public int getPlaceId() {
        return placeId;
    }

    public void setPlaceId(int placeId) {
        this.placeId = placeId;
    }

    public int getDescOrder() {
        return descOrder;
    }

    public void setDescOrder(int descOrder) {
        this.descOrder = descOrder;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}