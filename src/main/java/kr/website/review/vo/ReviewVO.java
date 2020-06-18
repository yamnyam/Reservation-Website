package kr.website.review.vo;

import java.util.Date;

public class ReviewVO {
	private int review_no;
	private int review_no_sto;
	private int review_no_acc;
	private int review_level_acc;
	private String review_content;
	private int review_star;
	private Date review_date;
	private String review_photo;
	private String review_tag;
	private int review_like;
	private int review_his_no;
	private String acc_name;
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getReview_no_sto() {
		return review_no_sto;
	}
	public void setReview_no_sto(int review_no_sto) {
		this.review_no_sto = review_no_sto;
	}
	public int getReview_no_acc() {
		return review_no_acc;
	}
	public void setReview_no_acc(int review_no_acc) {
		this.review_no_acc = review_no_acc;
	}
	public int getReview_level_acc() {
		return review_level_acc;
	}
	public void setReview_level_acc(int review_level_acc) {
		this.review_level_acc = review_level_acc;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getReview_photo() {
		return review_photo;
	}
	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}
	public String getReview_tag() {
		return review_tag;
	}
	public void setReview_tag(String review_tag) {
		this.review_tag = review_tag;
	}
	public int getReview_like() {
		return review_like;
	}
	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}
	public int getReview_his_no() {
		return review_his_no;
	}
	public void setReview_his_no(int review_his_no) {
		this.review_his_no = review_his_no;
	}
	
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	
}
