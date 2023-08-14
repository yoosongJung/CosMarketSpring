package kr.co.cosmarket.member.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cosmarket.member.domain.MemberBuyer;
import kr.co.cosmarket.member.domain.MemberSeller;
import kr.co.cosmarket.member.service.MemberService;
import kr.co.cosmarket.member.store.MemberStore;

@Service
public class MemberServicveImpl implements MemberService{

	@Autowired
	private MemberStore mStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMemberBuyer(MemberBuyer memberBuyer) {
		int result = mStore.insertMemberBuyer(sqlSession, memberBuyer);
		return result;
	}

	@Override
	public int insertMemberSeller(MemberSeller memberSeller) {
		int result = mStore.insertMemberSeller(sqlSession, memberSeller);
		return result;
	}

	@Override
	public MemberBuyer selectCheckLoginBuyer(MemberBuyer memberBuyer) {
		MemberBuyer mOne = mStore.selectCheckLogin(sqlSession, memberBuyer);
		return mOne;
	}

	@Override
	public MemberSeller selectCheckLoginSeller(MemberSeller memberSeller) {
		MemberSeller mOne = mStore.selectCheckLogin(sqlSession, memberSeller);
		return mOne;
	}

	@Override
	public int deleteMember(String memberId, String memberType) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBuyerMember(MemberBuyer memberBuyer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSellerMember(MemberSeller memberSeller) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberBuyer selectOneBuyerById(String memberId) {
		MemberBuyer mOne = mStore.selectOneBuyerById(sqlSession, memberId);
		return mOne;
	}

	@Override
	public MemberSeller selectOneSellerById(String memberId) {
		MemberSeller mOne = mStore.selectOneSellerById(sqlSession, memberId);
		return mOne;
	}

}
