package kr.co.cosmarket.member.domain;

import java.sql.Timestamp;

public class MemberBuyer {
	private String memberName;
	private String memberId;
	private String memberPw;
	private String memberPwCheck;
	private String memberEmail;
	private String memberPhone;
	private String memberPostcode;
	private String memberAddress;
	private String memberAddressDetail;
	private Timestamp memberEnrollDate;
	
	public MemberBuyer() {
		
	}

	public MemberBuyer(String memberId, String memberPw) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
	}

	public MemberBuyer(String memberId, String memberPw, String memberPwCheck, String memberEmail, String memberPhone,
			String memberPostcode, String memberAddress, String memberAddressDetail) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberPwCheck = memberPwCheck;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberPostcode = memberPostcode;
		this.memberAddress = memberAddress;
		this.memberAddressDetail = memberAddressDetail;
	}

	public MemberBuyer(String memberName, String memberId, String memberPw, String memberPwCheck, String memberEmail,
			String memberPhone, String memberPostcode, String memberAddress, String memberAddressDetail) {
		super();
		this.memberName = memberName;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberPwCheck = memberPwCheck;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberPostcode = memberPostcode;
		this.memberAddress = memberAddress;
		this.memberAddressDetail = memberAddressDetail;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
		return "�Ϲ�ȸ�� [�̸�=" + memberName + ", ���̵�=" + memberId + ", ���=" + memberPw
				+ ", ���Ȯ��=" + memberPwCheck + ", �̸���=" + memberEmail + ", ��ȭ��ȣ=" + memberPhone
				+ ", �����ȣ=" + memberPostcode + ", �ּ�=" + memberAddress + ", ���ּ�="
				+ memberAddressDetail + ", ������=" + memberEnrollDate + "]";
	}
	
}
