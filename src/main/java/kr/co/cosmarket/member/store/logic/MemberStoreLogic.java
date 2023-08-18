package kr.co.cosmarket.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.cosmarket.member.domain.MemberBuyer;
import kr.co.cosmarket.member.domain.MemberSeller;
import kr.co.cosmarket.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public int insertMemberBuyer(SqlSession session, MemberBuyer memberBuyer) {
		int result = session.insert("MemberMapper.insertMemberBuyer", memberBuyer);
		return result;
	}

	@Override
	public int insertMemberSeller(SqlSession session, MemberSeller memberSeller) {
		int result = session.insert("MemberMapper.insertMemberSeller", memberSeller);
		return result;
	}

	@Override
	public int updateBuyerMember(SqlSession session, MemberBuyer memberBuyer) {
		int result = session.update("MemberMapper.updateBuyerMember", memberBuyer);
		return result;
	}

	@Override
	public int updateSellerMember(SqlSession session, MemberSeller memberSeller) {
		int result = session.update("MemberMapper.updateSellerMember", memberSeller);
		return result;
	}

	@Override
	public int deleteMember(SqlSession session, String memberId, String memberType) {
		int result = 0;
		if(memberType.equals("buyer")) {
			result = session.delete("MemberMapper.deleteMemberBuyer", memberId);
		} else {
			result = session.delete("MemberMapper.deleteMemberSeller", memberId);
		}
		
		return result;
	}

	@Override
	public MemberBuyer selectCheckLogin(SqlSession session, MemberBuyer memberBuyer) {
		MemberBuyer mOne = session.selectOne("MemberMapper.selectCheckLoginBuyer", memberBuyer);
		return mOne;
	}

	@Override
	public MemberSeller selectCheckLogin(SqlSession session, MemberSeller memberSeller) {
		MemberSeller mOne = session.selectOne("MemberMapper.selectCheckLoginSeller", memberSeller);
		return mOne;
	}

	@Override
	public MemberBuyer selectOneBuyerById(SqlSession session, String memberId) {
		MemberBuyer mOne = session.selectOne("MemberMapper.selectOneBuyerById", memberId);
		return mOne;
	}

	@Override
	public MemberSeller selectOneSellerById(SqlSession session, String memberId) {
		MemberSeller mOne = session.selectOne("MemberMapper.selectOneSellerById", memberId);
		return mOne;
	}

}
