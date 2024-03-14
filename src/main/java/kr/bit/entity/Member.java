package kr.bit.entity;

import lombok.Data;

@Data
public class Member {
	private int memberIdx;
	private String memberId;
	private String memberPassWord;
	private String memberName;
	private int memberAge;
	private String memberEmail;
	private String memberPhone;
	private String memberGender;
	private String memberProfile;
}
