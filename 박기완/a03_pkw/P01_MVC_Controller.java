package web.com.go_month.a03_pkw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import web.com.go_month.z01_dto.Inquiries;

@Controller
public class P01_MVC_Controller {
	@Autowired(required=false)
	private P02_MVC_Service service;
	
	// Model : 핵심
	// http://localhost:5052/inquiryList
	@GetMapping("inquiryList")
	public String getInquiries(Inquiries inq, Model d) {
		// model : 핵심데이터, view 보낼데이터..
		d.addAttribute("inqList", service.getInquiries(inq));
		return "a03_winter/inquiryList";
	}
	// http://localhost:5052/inquiryInsert
	@GetMapping("inquiryInsert")
	public String insertInquiries() {
		return "a03_winter/inquiryInsert";
	}
	@PostMapping("inquiryInsert")
	public String insertInquiries(Inquiries inq, Model d) {
		// model : 핵심데이터, view 보낼데이터..
		d.addAttribute("msg", service.insertInquiries(inq));
		return "a03_winter/inquiryInsert";
	}

	// http://localhost:5052/winter
	@GetMapping("winter")
	public String winter(Model d) {
		// model : 핵심데이터, view 보낼데이터..
//		d.addAttribute("deptList", service.getDeptList());
		return "a03_winter/a01_winter";
	}
}
