package com.gomonth.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gomonth.dao.InquiriesDAO;
import com.gomonth.dto.InquiriesDTO;

@Service
public class InquiriesService {
    @Autowired
    private InquiriesDAO dao;

    // 일반 유저용
    public List<InquiriesDTO> getMyInquiries(String userId) {
        return dao.getMyInquiries(userId);
    }

    // 관리자용 (추가)
    public List<InquiriesDTO> getAllInquiries() {
        return dao.getAllInquiries();
    }

    public boolean registerInquiry(InquiriesDTO ins) {
        return dao.registerInquiry(ins) > 0;
    }

    public boolean updateInquiry(InquiriesDTO upt) {
        return dao.updateInquiry(upt) > 0;
    }

    public boolean deleteInquiry(int inqId, String userId) {
        return dao.deleteInquiry(inqId, userId) > 0;
    }

    public boolean answer(int inqId, String reply) {
        return dao.answerInquiry(inqId, reply) > 0;
    }
}