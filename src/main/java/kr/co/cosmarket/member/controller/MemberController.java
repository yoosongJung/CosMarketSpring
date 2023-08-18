package kr.co.cosmarket.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.cosmarket.member.domain.MemberBuyer;
import kr.co.cosmarket.member.domain.MemberSeller;
import kr.co.cosmarket.member.service.MemberService;

@Controller
@SessionAttributes({"memberId", "memberName", "memberType"})
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
		if(memberType.equals("buyer")) {
			try {
				MemberBuyer memberBuyer = new MemberBuyer();
				memberBuyer.setMemberId(memberId);
				memberBuyer.setMemberPw(memberPw);
				MemberBuyer mOne = service.selectCheckLoginBuyer(memberBuyer);
				if(mOne != null) {
					model.addAttribute("memberId", mOne.getMemberId());
					model.addAttribute("memberName", mOne.getMemberName());
					model.addAttribute("memberType", memberType);
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
					model.addAttribute("memberType", memberType);
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
	
	@RequestMapping(value="/memberInfo/logout.do", method=RequestMethod.GET)
	public String memberLogout(
			SessionStatus session,
			Model model) {
		if(session != null) {
			session.setComplete();
			if(session.isComplete()) {
				// 세션 만료 유효성 체크
			}
			return "redirect:/index.jsp";
		} else {
			model.addAttribute("msg", "로그아웃을 완료하지 못했습니다.");
			return "commonDisplay/serviceFailed";
		}
	}
	
	@RequestMapping(value="/member/myInfo.do", method=RequestMethod.GET)
	public String showDetailMember(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberType") String memberType,
			Model model) {
		if(memberType.isEmpty()) return "memberInfo/login";
		if(memberType.equals("buyer")) {
			try {
				MemberBuyer mOne = service.selectOneBuyerById(memberId);
				if(mOne != null) {
					model.addAttribute("member", mOne);
					return "member/common/myPage";
				} else {
					model.addAttribute("msg", "회원정보를 가져오지 못했습니다.");
					return "commonDisplay/serviceFailed";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "commonDisplay/serviceFailed";
			}
		} else {
			try {
				MemberSeller mOne = service.selectOneSellerById(memberId);
				if(mOne != null) {
					model.addAttribute("member", mOne);
					return "member/common/myPage";
				} else {
					model.addAttribute("msg", "회원정보를 가져오지 못했습니다.");
					return "commonDisplay/serviceFailed";
				}
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "commonDisplay/serviceFailed";
			}
		}
	}
	
	@RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
	public String removeMemberView() {
		return "member/common/secession";
	}
	
	@RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
	public String removeMember(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			@RequestParam("memberType") String memberType,
			Model model) {
		try {
			MemberBuyer mOneBuyer = null;
			MemberSeller mOneSeller = null;
			if(memberType.equals("buyer")) {
				MemberBuyer memberBuyer = new MemberBuyer(memberId, memberPw);
				mOneBuyer = service.selectCheckLoginBuyer(memberBuyer);
			} else {
				MemberSeller memberSeller = new MemberSeller(memberId, memberPw);
				mOneSeller = service.selectCheckLoginSeller(memberSeller);
			}
			if(mOneBuyer != null || mOneSeller != null) {
				int result = service.deleteMember(memberId, memberType);
				if(result > 0) {
					// 성공
					model.addAttribute("msg", "회원탈퇴 성공");
					model.addAttribute("url", "/memberInfo/logout.do");
					return "commonDisplay/serviceSuccess";
				} else {
					// 실패
					model.addAttribute("msg", "회원탈퇴 실패(비밀번호 불일치)");
					model.addAttribute("url", "/member/delete.do");
					return "commonDisplay/serviceFailed";
				}
			} else {
				// 실패
				model.addAttribute("msg", "회원탈퇴 실패(비밀번호 불일치)");
				model.addAttribute("url", "/member/delete.do");
				return "commonDisplay/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
	
	@RequestMapping(value="/member/update.do", method=RequestMethod.POST)
	public String updateMember(// @@@@@@@@@@@@@@@@@modelattribute로 받고 새비번,새비번체크는 따로 받고
			@ModelAttribute MemberBuyer mBuyer,
			@ModelAttribute MemberSeller mSeller,
			@RequestParam("memberPwNew") String memberPwNew,
			@RequestParam("memberPwNewCheck") String memberPwNewCheck,
			@RequestParam("memberType") String memberType,
			Model model) {
		try {
			int result = 0;
			if(memberType.equals("buyer")) {
				MemberBuyer memberBuyer = new MemberBuyer();
				memberBuyer.setMemberId(mBuyer.getMemberId());
				memberBuyer.setMemberPw(mBuyer.getMemberPw());
				MemberBuyer mOne = service.selectCheckLoginBuyer(memberBuyer);
				if(mOne != null) {
					mBuyer.setMemberPw(memberPwNew);
					mBuyer.setMemberPwCheck(memberPwNewCheck);
					result = service.updateBuyerMember(mBuyer);
					if(result > 0) {
						model.addAttribute("msg", "회원정보 수정 완료");
						model.addAttribute("url", "/index.jsp");
						return "commonDisplay/serviceSuccess";
					} else {
						model.addAttribute("msg", "회원정보 수정이 완료되지 않았습니다.");
						model.addAttribute("url", "/member/myInfo.do?memberId="+ mBuyer.getMemberId()+"&memberType="+ memberType);
						return "commonDisplay/serviceFailed";
					}
				} else {
					model.addAttribute("msg", "현재 비밀번호 불일치");
					model.addAttribute("url", "/member/myInfo.do?memberId="+ mBuyer.getMemberId()+"&memberType="+ memberType);
					return "commonDisplay/serviceFailed";
				}
			} else {
				MemberSeller memberSeller = new MemberSeller();
				memberSeller.setMemberId(mSeller.getMemberId());
				memberSeller.setMemberPw(mSeller.getMemberPw());
				MemberSeller mOne = service.selectCheckLoginSeller(memberSeller);
				if(mOne != null) {
					mSeller.setMemberPw(memberPwNew);
					mSeller.setMemberPwCheck(memberPwNewCheck);
					result = service.updateSellerMember(mSeller);
					if(result > 0) {
						model.addAttribute("msg", "회원정보 수정 완료");
						model.addAttribute("url", "/index.jsp");
						return "commonDisplay/serviceSuccess";
					} else {
						model.addAttribute("msg", "회원정보 수정이 완료되지 않았습니다.");
						model.addAttribute("url", "/member/myInfo.do?memberId="+ mSeller.getMemberId()+"&memberType="+ memberType);
						return "commonDisplay/serviceFailed";
					}
				} else {
					model.addAttribute("msg", "현재 비밀번호 불일치");
					model.addAttribute("url", "/member/myInfo.do?memberId="+ mSeller.getMemberId()+"&memberType="+ memberType);
					return "commonDisplay/serviceFailed";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
}
