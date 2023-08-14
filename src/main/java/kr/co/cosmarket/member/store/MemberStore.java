package kr.co.cosmarket.member.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.cosmarket.member.domain.MemberBuyer;
import kr.co.cosmarket.member.domain.MemberSeller;

public interface MemberStore {
	public int insertMemberBuyer(SqlSession session, MemberBuyer memberBuyer);

	public int insertMemberSeller(SqlSession session, MemberSeller memberSeller);

	public int updateBuyerMember(SqlSession session, MemberBuyer memberBuyer);

	public int updateSellerMember(SqlSession session, MemberSeller memberSeller);

	public int deleteMember(SqlSession session, String memberId, String memberType);

	public MemberBuyer selectCheckLogin(SqlSession session, MemberBuyer memberBuyer);
	
	public MemberSeller selectCheckLogin(SqlSession session, MemberSeller memberSeller);
	
	public MemberBuyer selectOneBuyerById(SqlSession session, String memberId);
	
	public MemberSeller selectOneSellerById(SqlSession session, String memberId);
}
