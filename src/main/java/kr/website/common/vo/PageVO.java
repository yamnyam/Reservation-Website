package kr.website.common.vo;

public class PageVO {
	int num;
	int count;
	int postNum;
	int pageNum;
	int displayPost;
	int pageNum_cnt;
	int endPageNum;
	int startPageNum;
	int endPageNum_tmp;
	boolean prev;
	boolean next;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getDisplayPost() {
		return displayPost;
	}
	public void setDisplayPost(int displayPost) {
		this.displayPost = displayPost;
	}
	public int getPageNum_cnt() {
		return pageNum_cnt;
	}
	public void setPageNum_cnt(int pageNum_cnt) {
		this.pageNum_cnt = pageNum_cnt;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}
	public int getEndPageNum_tmp() {
		return endPageNum_tmp;
	}
	public void setEndPageNum_tmp(int endPageNum_tmp) {
		this.endPageNum_tmp = endPageNum_tmp;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
}
