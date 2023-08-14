package kr.co.cosmarket.member.service;

import kr.co.cosmarket.member.domain.MemberBuyer;
import kr.co.cosmarket.member.domain.MemberSeller;

public interface MemberService {
	public int insertMemberBuyer(MemberBuyer memberBuyer);

	public int insertMemberSeller(MemberSeller memberSeller);

	public MemberBuyer selectCheckLoginBuyer(MemberBuyer memberBuyer);

	public MemberSeller selectCheckLoginSeller(MemberSeller memberSeller);

	public int deleteMember(String memberId, String memberType);
	
	public int updateBuyerMember(MemberBuyer memberBuyer);

	public int updateSellerMember(MemberSeller memberSeller);

	public MemberBuyer selectOneBuyerById(String memberId);

	public MemberSeller selectOneSellerById(String memberId);


}
