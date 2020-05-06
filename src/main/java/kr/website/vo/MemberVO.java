package kr.website.vo;

import java.util.Date;

public class MemberVO {
	private int acc_no;
	private String acc_id;
	private String acc_pw;
	private String acc_name;
	private int acc_level;
	private int acc_count;
	private Date acc_date;
	public int getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(int acc_no) {
		this.acc_no = acc_no;
	}
	public String getAcc_id() {
		return acc_id;
	}
	public void setAcc_id(String acc_id) {
		this.acc_id = acc_id;
	}
	public String getAcc_pw() {
		return acc_pw;
	}
	public void setAcc_pw(String acc_pw) {
		this.acc_pw = acc_pw;
	}
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	public int getAcc_level() {
		return acc_level;
	}
	public void setAcc_level(int acc_level) {
		this.acc_level = acc_level;
	}
	public int getAcc_count() {
		return acc_count;
	}
	public void setAcc_count(int acc_count) {
		this.acc_count = acc_count;
	}
	public Date getAcc_date() {
		return acc_date;
	}
	public void setAcc_date(Date acc_date) {
		this.acc_date = acc_date;
	}
}
