package kr.website.letter.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import kr.website.common.vo.PageVO;

public class LetterVO extends PageVO {
	private int let_no;
	private String let_title;
	private String let_content;
	private Date let_date;
	private int let_no_acc;
	private String let_photo;
	private int let_viewCnt;
	
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

	public int getLet_no_acc() {
		return let_no_acc;
	}

	public void setLet_no_acc(int let_no_acc) {
		this.let_no_acc = let_no_acc;
	}

	public String getLet_title() {
		return let_title;
	}

	public void setLet_title(String let_title) {
		this.let_title = let_title;
	}

	public int getLet_viewCnt() {
		return let_viewCnt;
	}

	public void setLet_viewCnt(int let_viewCnt) {
		this.let_viewCnt = let_viewCnt;
	}

	public String getLet_photo() {
		return let_photo;
	}

	public void setLet_photo(String let_photo) {
		this.let_photo = let_photo;
	}
}
