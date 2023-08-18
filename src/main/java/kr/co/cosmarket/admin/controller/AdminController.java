package kr.co.cosmarket.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	@RequestMapping(value="/admin/companyHistory.do", method=RequestMethod.GET)
	public String showCompanyHistory() {
		return "admin/companyHistory";
	}
	
	@RequestMapping(value="/admin/companyIntro.do", method=RequestMethod.GET)
	public String showCompanyIntro() {
		return "admin/companyIntro";
	}
	
	@RequestMapping(value="/admin/manageMember.do", method=RequestMethod.GET)
	public String showManageMember() {
		return "admin/manageMember";
	}
	
	@RequestMapping(value="/admin/manageProduct.do", method=RequestMethod.GET)
	public String showManageProduct() {
		return "admin/manageProduct";
	}
	
	@RequestMapping(value="/admin/manageWrite.do", method=RequestMethod.GET)
	public String showManageWrite() {
		return "admin/manageWrite";
	}
	
	@RequestMapping(value="/admin/sellerRecognize.do", method=RequestMethod.GET)
	public String showSellerRecognize() {
		return "admin/sellerRecognize";
	}
}
