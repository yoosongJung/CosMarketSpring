package kr.co.cosmarket.member.domain;

import java.sql.Timestamp;

public class MemberSeller {
	private String sellerNo;
	private String memberName;
	private String memberBank;
	private String memberAccount;
	private String memberId;
	private String memberPw;
	private String memberPwCheck;
	private String memberEmail;
	private String memberPhone;
	private String memberPostcode;
	private String memberAddress;
	private String memberAddressDetail;
	private Timestamp memberEnrollDate;
	
	public MemberSeller() {}
	
	public MemberSeller(String memberId, String memberPw) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
	}

	public MemberSeller(String memberId, String memberPw, String memberPwCheck,
			String memberEmail, String memberPhone, String memberPostcode, String memberAddress,
			String memberAddressDetail, String memberBank, String memberAccount) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberPwCheck = memberPwCheck;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberPostcode = memberPostcode;
		this.memberAddress = memberAddress;
		this.memberAddressDetail = memberAddressDetail;
		this.memberBank = memberBank;
		this.memberAccount = memberAccount;
	}

	public MemberSeller(String sellerNo, String memberName, String memberBank, String memberAccount, String memberId,
			String memberPw, String memberPwCheck, String memberEmail, String memberPhone, String memberPostcode,
			String memberAddress, String memberAddressDetail) {
		super();
		this.sellerNo = sellerNo;
		this.memberName = memberName;
		this.memberBank = memberBank;
		this.memberAccount = memberAccount;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberPwCheck = memberPwCheck;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberPostcode = memberPostcode;
		this.memberAddress = memberAddress;
		this.memberAddressDetail = memberAddressDetail;
	}

	public String getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(String sellerNo) {
		this.sellerNo = sellerNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberBank() {
		return memberBank;
	}
	public void setMemberBank(String memberBank) {
		this.memberBank = memberBank;
	}
	public String getMemberAccount() {
		return memberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberPwCheck() {
		return memberPwCheck;
	}
	public void setMemberPwCheck(String memberPwCheck) {
		this.memberPwCheck = memberPwCheck;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberPostcode() {
		return memberPostcode;
	}
	public void setMemberPostcode(String memberPostcode) {
		this.memberPostcode = memberPostcode;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberAddressDetail() {
		return memberAddressDetail;
	}
	public void setMemberAddressDetail(String memberAddressDetail) {
		this.memberAddressDetail = memberAddressDetail;
	}
	public Timestamp getMemberEnrollDate() {
		return memberEnrollDate;
	}
	public void setMemberEnrollDate(Timestamp memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}
	@Override
	public String toString() {
		return "�����ȸ�� [����ڹ�ȣ=" + sellerNo + ", ��ȣ��=" + memberName + ", �����=" + memberBank
				+ ", ���¹�ȣ=" + memberAccount + ", ���̵�=" + memberId + ", ���=" + memberPw
				+ ", ���Ȯ��=" + memberPwCheck + ", �̸���=" + memberEmail + ", ��ȭ��ȣ=" + memberPhone
				+ ", �����ȣ=" + memberPostcode + ", �ּ�=" + memberAddress + ", ���ּ�="
				+ memberAddressDetail + ", ������=" + memberEnrollDate + "]";
	}
	
}
