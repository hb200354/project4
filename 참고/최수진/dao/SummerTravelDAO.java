package dao;

import dto.TravelDescDTO;
import dto.TravelPlaceDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SummerTravelDAO {

    private Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        return DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe",
            "DB아이디",
            "DB비밀번호"
        );
    }

    // 월별 여행지 목록
    public List<TravelPlaceDTO> getSummerListByMonth(int month) {

        List<TravelPlaceDTO> list = new ArrayList<>();
        String sql = """
            SELECT *
            FROM TRAVEL_PLACE
            WHERE MONTH_NUM = ?
            ORDER BY PLACE_ID
        """;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, month);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TravelPlaceDTO dto = new TravelPlaceDTO();
                dto.setPlaceId(rs.getInt("PLACE_ID"));
                dto.setTitle(rs.getString("TITLE"));
                dto.setLocation(rs.getString("LOCATION"));
                dto.setRecommendSeason(rs.getString("RECOMMEND_SEASON"));
                dto.setMainImage(rs.getString("MAIN_IMAGE"));
                dto.setSubImage(rs.getString("SUB_IMAGE"));
                dto.setMonthNum(rs.getInt("MONTH_NUM"));
                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 여행지 상세 정보
    public TravelPlaceDTO getPlaceDetail(int placeId) {

        TravelPlaceDTO dto = null;
        String sql = """
            SELECT *
            FROM TRAVEL_PLACE
            WHERE PLACE_ID = ?
        """;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, placeId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new TravelPlaceDTO();
                dto.setPlaceId(rs.getInt("PLACE_ID"));
                dto.setTitle(rs.getString("TITLE"));
                dto.setLocation(rs.getString("LOCATION"));
                dto.setRecommendSeason(rs.getString("RECOMMEND_SEASON"));
                dto.setMainImage(rs.getString("MAIN_IMAGE"));
                dto.setSubImage(rs.getString("SUB_IMAGE"));
                dto.setMonthNum(rs.getInt("MONTH_NUM"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    // 여행지 상세 설명
    public List<TravelDescDTO> getPlaceDescriptions(int placeId) {

        List<TravelDescDTO> list = new ArrayList<>();
        String sql = """
            SELECT *
            FROM TRAVEL_DESC
            WHERE PLACE_ID = ?
            ORDER BY DESC_ORDER
        """;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, placeId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                TravelDescDTO dto = new TravelDescDTO();
                dto.setDescId(rs.getInt("DESC_ID"));
                dto.setPlaceId(rs.getInt("PLACE_ID"));
                dto.setDescOrder(rs.getInt("DESC_ORDER"));
                dto.setContent(rs.getString("CONTENT"));
                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}