<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#loginBtn").click(function(){
					var id = $("#acc_id").val();
					var pw = $("#acc_pw").val();
					var formData = $("#loginForm").serialize();
					
					if (id == "" || id == null) {
						alert("아이디를 입력해주세요.");
						return;
					}
					
					if (pw == "" || pw == null) {
						alert("비밀번호를 입력해주세요.");
						return;
					}
					
					ajaxPostAction("/member/logincheck", formData);
				});
			});
		</script>
	</head>
	<body>	
		<form id="loginForm">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" id="acc_id" name="acc_id" /></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="password" id="acc_pw" name="acc_pw" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" id="loginBtn" value="로그인" />
						<input type="button" value="회원가입" onclick="location.href='/member/signup'"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="/">처음으로</a>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>