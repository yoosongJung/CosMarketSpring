package kr.co.cosmarket.buyer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BuyerController {

	@RequestMapping(value="/buyer/actHistory.do", method=RequestMethod.GET)
	public String showActHistory() {
		return "member/buyer/actHistory";
	}
	
	@RequestMapping(value="/buyer/orderHistory.do", method=RequestMethod.GET)
	public String showOrderHistory() {
		return "member/buyer/orderHistory";
	}
	
	@RequestMapping(value="/buyer/shoppingBasket.do", method=RequestMethod.GET)
	public String showShoppingBasket() {
		return "member/buyer/shoppingBasket";
	}
}
