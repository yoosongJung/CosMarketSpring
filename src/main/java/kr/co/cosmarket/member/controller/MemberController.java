package kr.co.cosmarket.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
				model.addAttribute("msg","ȸ������ �Ϸ�");
				model.addAttribute("url", "/memberInfo/success.do");
				return "commonDisplay/serviceSuccess";
			} else {
				model.addAttribute("msg","ȸ�������� �Ϸ���� �ʾҽ��ϴ�.");
				return "commonDisplay/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace(); // �ܼ�â�� ���������� �߰���
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
				model.addAttribute("msg","ȸ������ �Ϸ�");
				model.addAttribute("url", "/memberInfo/success.do");
				return "commonDisplay/serviceSuccess";
			} else {
				model.addAttribute("msg","ȸ�������� �Ϸ���� �ʾҽ��ϴ�.");
				return "commonDisplay/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace(); // �ܼ�â�� ���������� �߰���
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
					model.addAttribute("msg","�α��� ���� ����ġ");
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
					model.addAttribute("msg","�α��� ���� ����ġ");
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
				// ���� ���� ��ȿ�� üũ
			}
			return "redirect:/index.jsp";
		} else {
			model.addAttribute("msg", "�α׾ƿ��� �Ϸ����� ���߽��ϴ�.");
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
					model.addAttribute("msg", "ȸ�������� �������� ���߽��ϴ�.");
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
					model.addAttribute("msg", "ȸ�������� �������� ���߽��ϴ�.");
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
		MemberBuyer mOneBuyer = null;
		MemberSeller mOneSeller = null;
		if(memberType.equals("buyer")) {
			MemberBuyer memberBuyer = new MemberBuyer(memberId, memberPw);
			mOneBuyer = service.selectCheckLoginBuyer(memberBuyer);
		} else {
			MemberSeller memberSeller = new MemberSeller(memberId, memberPw);
			mOneSeller = service.selectCheckLoginSeller(memberSeller);
		}
		try {
			if(mOneBuyer != null || mOneSeller != null) {
				int result = service.deleteMember(memberId, memberType);
				if(result > 0) {
					// ����
					model.addAttribute("msg", "ȸ��Ż�� ����");
					model.addAttribute("url", "/memberInfo/logout.do");
					return "commonDisplay/serviceSuccess";
				} else {
					// ����
					model.addAttribute("msg", "ȸ��Ż�� ����(��й�ȣ ����ġ)");
					model.addAttribute("url", "/member/delete.do");
					return "commonDisplay/serviceFailed";
				}
			} else {
				// ����
				model.addAttribute("msg", "ȸ��Ż�� ����(��й�ȣ ����ġ)");
				model.addAttribute("url", "/member/delete.do");
				return "commonDisplay/serviceFailed";
			}
			
//			int result = service.removeMember(memberId);
//			if(result > 0) {
//				return "redirect:/member/logout.do";
//			} else {
//				model.addAttribute("msg", "ȸ�������� �������� ���߽��ϴ�.");
//				return "commonDisplay/serviceFailed";
//			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
}
