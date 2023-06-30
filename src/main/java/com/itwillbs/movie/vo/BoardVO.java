package com.itwillbs.movie.vo;

import java.sql.Date;

/*	// 분실물 게시판
	CREATE TABLE lost_board (
	lost_code	int	,
	member_id	varchar(100)	,
	lost_location	varchar(100)	,
	lost_film	varchar(100)	,
	lost_name	varchar(100)	,
	lost_subject	varchar(100)	,
	lost_time	varchar(100)	,
	lost_email	varchar(100)	,
	lost_date	varchar(100)	,
	lost_write_date	varchar(100)	,
	lost_content	varchar(100)	,
	lost_tel	varchar(100)	,
	lost_board_rep	varchar(100)	,
	lost_board_rep_content	varchar(100)
);
 * */

public class BoardVO {
	
	private int lost_code;
	private String member_id;
	private String cinema_name;
	private String lost_name;
	private String lost_subject;
	private String lost_content;
	private String lost_tel;
	private String lost_email;
	private Date lost_date;
	private String lost_write_date;
	private String lost_passwd;
	private String lost_board_rep;
	private String lost_board_rep_content;
	
	public BoardVO() {
	}

	public int getLost_code() {
		return lost_code;
	}

	public void setLost_code(int lost_code) {
		this.lost_code = lost_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCinema_name() {
		return cinema_name;
	}

	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}

	public String getLost_name() {
		return lost_name;
	}

	public void setLost_name(String lost_name) {
		this.lost_name = lost_name;
	}

	public String getLost_subject() {
		return lost_subject;
	}

	public void setLost_subject(String lost_subject) {
		this.lost_subject = lost_subject;
	}

	public String getLost_content() {
		return lost_content;
	}

	public void setLost_content(String lost_content) {
		this.lost_content = lost_content;
	}

	public String getLost_tel() {
		return lost_tel;
	}

	public void setLost_tel(String lost_tel) {
		this.lost_tel = lost_tel;
	}

	public String getLost_email() {
		return lost_email;
	}

	public void setLost_email(String lost_email) {
		this.lost_email = lost_email;
	}

	public Date getLost_date() {
		return lost_date;
	}

	public void setLost_date(Date lost_date) {
		this.lost_date = lost_date;
	}

	public String getLost_write_date() {
		return lost_write_date;
	}

	public void setLost_write_date(String lost_write_date) {
		this.lost_write_date = lost_write_date;
	}

	public String getLost_passwd() {
		return lost_passwd;
	}

	public void setLost_passwd(String lost_passwd) {
		this.lost_passwd = lost_passwd;
	}

	public String getLost_board_rep() {
		return lost_board_rep;
	}

	public void setLost_board_rep(String lost_board_rep) {
		this.lost_board_rep = lost_board_rep;
	}

	public String getLost_board_rep_content() {
		return lost_board_rep_content;
	}

	public void setLost_board_rep_content(String lost_board_rep_content) {
		this.lost_board_rep_content = lost_board_rep_content;
	}

	@Override
	public String toString() {
		return "BoardVO [lost_code=" + lost_code + ", member_id=" + member_id + ", cinema_name=" + cinema_name
				+ ", lost_name=" + lost_name + ", lost_subject=" + lost_subject + ", lost_content=" + lost_content
				+ ", lost_tel=" + lost_tel + ", lost_email=" + lost_email + ", lost_date=" + lost_date
				+ ", lost_write_date=" + lost_write_date + ", lost_passwd=" + lost_passwd + ", lost_board_rep="
				+ lost_board_rep + ", lost_board_rep_content=" + lost_board_rep_content + "]";
	}

	
}
