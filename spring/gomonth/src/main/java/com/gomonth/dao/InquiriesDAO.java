package com.gomonth.dao;

import java.util.List;
import org.apache.ibatis.annotations.*;
import com.gomonth.dto.InquiriesDTO;

@Mapper
public interface InquiriesDAO {
    // [사용자] 내 문의 목록 (답변 정보 포함)
    @Select("SELECT INQ_ID as inqId, USER_ID as userId, TITLE, CONTENT, STATUS, " +
            "CREATED_AT as createdAt, ANS_CONTENT as ansContent, ANSWERED_AT as answeredAt " +
            "FROM INQUIRIES WHERE USER_ID = #{userId} ORDER BY CREATED_AT DESC")
    List<InquiriesDTO> getMyInquiries(String userId);

    // [관리자] 전체 문의 목록
    @Select("SELECT INQ_ID as inqId, USER_ID as userId, TITLE, CONTENT, STATUS, " +
            "CREATED_AT as createdAt, ANS_CONTENT as ansContent, ANSWERED_AT as answeredAt " +
            "FROM INQUIRIES ORDER BY CREATED_AT DESC")
    List<InquiriesDTO> getAllInquiries();

    // [사용자] 문의 등록
    @Insert("INSERT INTO INQUIRIES (INQ_ID, USER_ID, TITLE, CONTENT, STATUS, CREATED_AT) " +
            "VALUES (INQ_SEQ.NEXTVAL, #{userId}, #{title}, #{content}, '접수', SYSDATE)")
    int registerInquiry(InquiriesDTO ins);

    // [사용자] 문의 수정 (접수 상태일 때만 가능)
    @Update("UPDATE INQUIRIES SET TITLE=#{title}, CONTENT=#{content} " +
            "WHERE INQ_ID=#{inqId} AND USER_ID=#{userId} AND STATUS='접수'")
    int updateInquiry(InquiriesDTO upt);

    // [사용자] 문의 삭제 (접수 상태일 때만 가능)
    @Delete("DELETE FROM INQUIRIES WHERE INQ_ID=#{inqId} AND USER_ID=#{userId} AND STATUS='접수'")
    int deleteInquiry(@Param("inqId") int inqId, @Param("userId") String userId);

    // [관리자] 답변 등록 및 상태 변경
    @Update("UPDATE INQUIRIES SET STATUS = '답변완료', ANS_CONTENT = #{reply}, ANSWERED_AT = SYSDATE WHERE INQ_ID = #{inqId}")
    int answerInquiry(@Param("inqId") int inqId, @Param("reply") String reply);
}