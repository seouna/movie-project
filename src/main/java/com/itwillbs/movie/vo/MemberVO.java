package com.itwillbs.movie.vo;

import java.sql.Date;

public class MemberVO {
	private String member_id;
	private String member_name;
	private String member_pw;
	private String member_address;
	//분리된 주소
	private String member_address1;
	private String member_address2;
	private String member_bday;
	private String member_email;
	private String member_tel;
	private String member_point;
	private String member_prefer_branch;
	private String member_prefer_genre;
	private Date member_date;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_address1() {
		return member_address1;
	}
	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}
	public String getMember_address2() {
		return member_address2;
	}
	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}
	public String getMember_bday() {
		return member_bday;
	}
	public void setMember_bday(String member_bday) {
		this.member_bday = member_bday;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_point() {
		return member_point;
	}
	public void setMember_point(String member_point) {
		this.member_point = member_point;
	}
	public String getMember_prefer_branch() {
		return member_prefer_branch;
	}
	public void setMember_prefer_branch(String member_prefer_branch) {
		this.member_prefer_branch = member_prefer_branch;
	}
	public String getMember_prefer_genre() {
		return member_prefer_genre;
	}
	public void setMember_prefer_genre(String member_prefer_genre) {
		this.member_prefer_genre = member_prefer_genre;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_name=" + member_name + ", member_pw=" + member_pw
				+ ", member_address=" + member_address + ", member_address1=" + member_address1 + ", member_address2="
				+ member_address2 + ", member_bday=" + member_bday + ", member_email=" + member_email + ", member_tel="
				+ member_tel + ", member_point=" + member_point + ", member_prefer_branch=" + member_prefer_branch
				+ ", member_prefer_genre=" + member_prefer_genre + ", member_date=" + member_date + "]";
	}
	


	




	
	
	

}
