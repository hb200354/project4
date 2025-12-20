package web.com.go_month.a03_pkw;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import web.com.go_month.z01_dto.Inquiries;

@Mapper
public interface P03_MVC_Dao {
	@Select("SELECT * FROM INQUIRIES WHERE INQUIRY_TYPE LIKE #{inquiryType} ORDER BY INQUIRY_ID DESC")
	List<Inquiries> getInquiries(Inquiries inq);

	@Insert("INSERT INTO INQUIRIES VALUES((SELECT MAX(INQUIRY_ID)+1 FROM INQUIRIES),#{userId},#{inquiryType},#{content},SYSDATE)")
	int insertInquiries(Inquiries ins);
}
