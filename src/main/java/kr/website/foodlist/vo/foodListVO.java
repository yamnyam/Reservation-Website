package kr.website.foodlist.vo;

public class foodListVO {
	private int sto_no;
	private String sto_name;
	private String sto_tel;
	private String sto_gps;
	private String sto_loc;
	private String sto_gps_x;
	private String sto_gps_y;
	private int sto_no_acc;
	private int average_price;
	private String sto_photo;
	private String sto_thumbPhoto;
	private String sto_comment;
	
	private String gps_x;
	private String gps_y;
	
	private String tag;
	
	private int congest;
	
	public int getSto_no() {
		return sto_no;
	}
	public void setSto_no(int sto_no) {
		this.sto_no = sto_no;
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
	public String getSto_gps() {
		return sto_gps;
	}
	public void setSto_gps(String sto_gps) {
		this.sto_gps = sto_gps;
	}
	public String getSto_loc() {
		return sto_loc;
	}
	public void setSto_loc(String sto_loc) {
		this.sto_loc = sto_loc;
	}
	public int getSto_no_acc() {
		return sto_no_acc;
	}
	public void setSto_no_acc(int sto_no_acc) {
		this.sto_no_acc = sto_no_acc;
	}
	public int getAverage_price() {
		return average_price;
	}
	public void setAverage_price(int averge_price) {
		this.average_price = averge_price;
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
	public String getSto_photo() {
		return sto_photo;
	}
	public void setSto_photo(String sto_photo) {
		this.sto_photo = sto_photo;
	}
	
	public String getGps_x() {
		return gps_x;
	}
	public void setGps_x(String gps_x) {
		this.gps_x = gps_x;
	}
	public String getGps_y() {
		return gps_y;
	}
	public void setGps_y(String gps_y) {
		this.gps_y = gps_y;
	}
	public String getSto_comment() {
		return sto_comment;
	}
	public void setSto_comment(String sto_comment) {
		this.sto_comment = sto_comment;
	}
	public String getSto_thumbPhoto() {
		return sto_thumbPhoto;
	}
	public void setSto_thumbPhoto(String sto_thumbPhoto) {
		this.sto_thumbPhoto = sto_thumbPhoto;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	public int getCongest() {
		return congest;
	}
	public void setCongest(int congest) {
		this.congest = congest;
	}
}
