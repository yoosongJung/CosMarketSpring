package kr.co.cosmarket.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.cosmarket.member.domain.MemberBuyer;
import kr.co.cosmarket.member.domain.MemberSeller;
import kr.co.cosmarket.member.service.MemberService;

@Controller
@SessionAttributes({"memberId", "memberName"})
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/memberInfo/register.do", method=RequestMethod.GET)
	public String showRegisterForm() {
		return "memberInfo/form";
	}
	
	@RequestMapping(value="/memberInfo/success.do", method=RequestMethod.GET)
	public String registerSuccessView() {
		return "memberInfo/success";
	}
	
	@RequestMapping(value="/memberInfo/registerBuyer.do", method=RequestMethod.POST)
	public String registerBuyerMember(
			@RequestParam("memberName") String memberName,
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			@RequestParam("memberPwCheck") String memberPwCheck,
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPhone") String memberPhone,
			@RequestParam("memberPostcode") String memberPostcode,
			@RequestParam("memberAddress") String memberAddress,
			@RequestParam("memberAddressDetail") String memberAddressDetail,
			Model model) {
		MemberBuyer memberBuyer = new MemberBuyer(memberName, memberId, memberPw, memberPwCheck, memberEmail, memberPhone, memberPostcode, memberAddress, memberAddressDetail);
		try {
			int result = service.insertMemberBuyer(memberBuyer);
			if(result > 0) {
				model.addAttribute("msg","회원가입 완료");
				model.addAttribute("url", "/memberInfo/success.do");
				return "commonDisplay/serviceSuccess";
			} else {
				model.addAttribute("msg","회원가입이 완료되지 않았습니다.");
				return "commonDisplay/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 빨간색으로 뜨게함
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
	
	@RequestMapping(value="/memberInfo/registerSeller.do", method=RequestMethod.POST)
	public String registerSellerMember(
			@RequestParam("sellerNo") String sellerNo,
			@RequestParam("memberName") String memberName,
			@RequestParam("memberBank") String memberBank,
			@RequestParam("memberAccount") String memberAccount,
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			@RequestParam("memberPwCheck") String memberPwCheck,
			@RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberPhone") String memberPhone,
			@RequestParam("memberPostcode") String memberPostcode,
			@RequestParam("memberAddress") String memberAddress,
			@RequestParam("memberAddressDetail") String memberAddressDetail,
			Model model) {
		MemberSeller memberSeller = new MemberSeller(sellerNo, memberName, memberBank, memberAccount, memberId, memberPw, memberPwCheck, memberEmail, memberPhone, memberPostcode, memberAddress, memberAddressDetail);
		try {
			int result = service.insertMemberSeller(memberSeller);
			if(result > 0) {
				model.addAttribute("msg","회원가입 완료");
				model.addAttribute("url", "/memberInfo/success.do");
				return "commonDisplay/serviceSuccess";
			} else {
				model.addAttribute("msg","회원가입이 완료되지 않았습니다.");
				return "commonDisplay/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace(); // 콘솔창에 빨간색으로 뜨게함
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
	
	@RequestMapping(value="/memberInfo/login.do", method=RequestMethod.GET)
	public String memberLoginView() {
		return "memberInfo/login";
	}
	
	@RequestMapping(value="/memberInfo/login.do", method=RequestMethod.POST)
	public String memberLogin(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			@RequestParam("memberType") String memberType,
			Model model) {
		if(memberType == "buyer") {
			try {
				MemberBuyer memberBuyer = new MemberBuyer();
				memberBuyer.setMemberId(memberId);
				memberBuyer.setMemberPw(memberPw);
				MemberBuyer mOne = service.selectCheckLoginBuyer(memberBuyer);
				if(mOne != null) {
					model.addAttribute("memberId", mOne.getMemberId());
					model.addAttribute("memberName", mOne.getMemberName());
					return "redirect:/index.jsp";
				} else {
					model.addAttribute("msg","로그인 정보 불일치");
					model.addAttribute("url","/memberInfo/login.do");
					return "commonDisplay/serviceFailed";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "commonDisplay/serviceFailed";
			}
		} else { // memberType == "seller"
			try {
				MemberSeller memberSeller = new MemberSeller();
				memberSeller.setMemberId(memberId);
				memberSeller.setMemberPw(memberPw);
				MemberSeller mOne = service.selectCheckLoginSeller(memberSeller);
				if(mOne != null) {
					model.addAttribute("memberId", mOne.getMemberId());
					model.addAttribute("memberName", mOne.getMemberName());
					return "redirect:/index.jsp";
				} else {
					model.addAttribute("msg","로그인 정보 불일치");
					model.addAttribute("url","/memberInfo/login.do");
					return "commonDisplay/serviceFailed";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "commonDisplay/serviceFailed";
			}
		}
	}
	
	
}
