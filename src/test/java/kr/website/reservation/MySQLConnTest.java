package kr.website.reservation;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnTest {
	private static final String Driver ="com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/website?useSSL=false&serverTimezone=Asia/Seoul";
	private static final String User = "root";
	private static final String Password = "1234";
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(Driver); //드라이버 지정 클래스 로딩
		try (Connection con = DriverManager.getConnection(URL, User, Password)){
			System.out.println(con);
		} catch(Exception e){
			e.printStackTrace();
		}
	}

}
