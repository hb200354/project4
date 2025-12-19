package web.com.go_month.a03_pkw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.com.go_month.z01_dto.Inquiries;

@Service
public class P02_MVC_Service {
	@Autowired(required=false)
	private P03_MVC_Dao dao;
	
	public List<Inquiries> getInquiries(Inquiries inq) {
		if(inq.getInquiryType()==null) inq.setInquiryType("");
		inq.setInquiryType("%"+inq.getInquiryType()+"%");
		return dao.getInquiries(inq);
	}
	public String insertInquiries(Inquiries ins) {
		if(ins.getUserId()<1) ins.setUserId(9999);
		return dao.insertInquiries(ins)>0?"등록성공":"등록실패";
	}
}
