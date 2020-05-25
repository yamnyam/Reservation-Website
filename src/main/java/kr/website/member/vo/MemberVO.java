package kr.website.member.vo;

import java.util.Date;

public class MemberVO {
	private int acc_no;
	private String acc_id;
	private String acc_pw;
	private String acc_name;
	private int acc_level;
	private int acc_count;
	private Date acc_date;
	
	private String sto_name;
	private String sto_tel;
	private String sto_loc;
	private String sto_gps_x;
	private String sto_gps_y;
	
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
	
	
	
	
	public String getSto_name() {
		return sto_name;
	}
	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}
	public String getSto_tel() {
		return sto_tel;
	}
	public void setSto_tel(String sto_tel) {
		this.sto_tel = sto_tel;
	}
	public String getSto_loc() {
		return sto_loc;
	}
	public void setSto_loc(String sto_loc) {
		this.sto_loc = sto_loc;
	}
	public String getSto_gps_x() {
		return sto_gps_x;
	}
	public void setSto_gps_x(String sto_gps_x) {
		this.sto_gps_x = sto_gps_x;
	}
	public String getSto_gps_y() {
		return sto_gps_y;
	}
	public void setSto_gps_y(String sto_gps_y) {
		this.sto_gps_y = sto_gps_y;
	}
}
