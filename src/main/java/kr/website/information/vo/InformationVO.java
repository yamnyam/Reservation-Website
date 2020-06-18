package kr.website.information.vo;

import kr.website.foodlist.vo.foodListVO;

public class InformationVO extends foodListVO{
	
	private int menu_no;
	private String menu_name;
	private int menu_no_sto;
	private String menu_price;
	private String menu_check;
	
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_no_sto() {
		return menu_no_sto;
	}
	public void setMenu_no_sto(int menu_no_sto) {
		this.menu_no_sto = menu_no_sto;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_check() {
		return menu_check;
	}
	public void setMenu_check(String menu_check) {
		this.menu_check = menu_check;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
}
