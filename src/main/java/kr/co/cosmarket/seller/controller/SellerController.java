package kr.co.cosmarket.seller.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SellerController {

	@RequestMapping(value="/seller/addProduct.do", method=RequestMethod.GET)
	public String showAddProduct() {
		return "member/seller/addProduct";
	}
	
	@RequestMapping(value="/seller/manageOrderDelivery.do", method=RequestMethod.GET)
	public String showManageOrderDelivery() {
		return "member/seller/manageOrderDelivery";
	}
	
	@RequestMapping(value="/seller/manageProduct.do", method=RequestMethod.GET)
	public String showManageProduct() {
		return "member/seller/manageProduct";
	}
}
