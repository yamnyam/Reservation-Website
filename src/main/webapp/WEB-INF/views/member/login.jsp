<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#loginBtn").click(function(){
					var id = $("#acc_id").val();
					var pw = $("#acc_pw").val();
					var form = $("#loginForm");
					
					if (id == "" || id == null) {
						alert("아이디를 입력해주세요.");
						return;
					}
					
					if (pw == "" || pw == null) {
						alert("비밀번호를 입력해주세요.");
						return;
					}
					
					form.submit();
				});
			});
		</script>
	</head>
	<body>	
		<form id="loginForm" action="/member/logincheck" method="post">
			<p>
		  		<label for="acc_id">ID</label>
		  		<input type="text" id="acc_id" name="acc_id" />
		 	</p>
		 	<p>
		  		<label for="acc_pw">PW</label>
		  		<input type="password" id="acc_pw" name="acc_pw"/>
		 	</p>
			<p>
				<input type="button" id="loginBtn" value="로그인" />
				<input type="button" value="회원가입" onclick="location.href='/member/signup'"/>
			</p>
		</form>
		<p><a href="/">처음으로</a></p>
	</body>
</html>