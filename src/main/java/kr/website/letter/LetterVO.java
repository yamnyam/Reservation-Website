package kr.website.letter;

import java.util.Date;

public class LetterVO {
	private int let_no;
	private String let_title;
	private String let_content;
	private Date let_date;
	private int acc_no;
	private String let_image; 
	
	@Override
	public String toString() {
		return "LetterVO[let_no=" + let_no + ", let_content=" + let_content + ", let_date=" + let_date + ", acc_no=" + 
				acc_no + ", let_image=" + let_image + "]";
	}
	
	public String getLet_title() {
		return let_title;
	}

	public void setLet_title(String let_title) {
		this.let_title = let_title;
	}

	public int getLet_no() {
		return let_no;
	}

	public void setLet_no(int let_no) {
		this.let_no = let_no;
	}

	public String getLet_content() {
		return let_content;
	}

	public void setLet_content(String let_content) {
		this.let_content = let_content;
	}

	public Date getLet_date() {
		return let_date;
	}

	public void setLet_date(Date let_date) {
		this.let_date = let_date;
	}
	
	public int getAcc_no() {
		return acc_no;
	}
	
	public void setAcc_no(int acc_no) {
		this.acc_no = acc_no;
	}
	
	public String getLet_image() {
		return let_image;
	}
	
	public void setLet_image(String let_image) {
		this.let_image = let_image;
	}

}
