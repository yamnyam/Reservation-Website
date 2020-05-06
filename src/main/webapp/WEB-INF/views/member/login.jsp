<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			var acc_id = $("#acc_id").val();
			var acc_pw = $("#acc_pw").val();
			if(acc_id == ""){
				alert("아이디를 입력하세요.");
				$("#acc_id").focus();
				return;
			}
			if(acc_pw == ""){
				alert("비밀번호를 입력하세요.");
				$("#acc_pw").focus();
				return;
			}
			document.form.action = "${path}/member/logincheck"
			document.form.submit();
		});
	});
</script>
</head>
<body>
	<form role="form" method="post" autocomplete="off">
 	<p>
  		<label for="acc_id">아이디</label>
  		<input type="text" id="acc_id" name="acc_id" />
 	</p>
 	<p>
  		<label for="acc_pw">비밀번호</label>
  		<input type="password" id="acc_pw" name="acc_pw"/>
 	</p>
 	<p>
 		<button type="button" id = "btnLogin">로그인</button>
 		<c:if test = "${msg == 'failure'}">
 			<div style = "color: red">
 				아이디 또는 비밀번호가 일치하지 않습니다.
 			</div>
 		</c:if>
 		<c:if test = "${msg == 'logout'}">
 			<div style = "color: red">
 				로그아웃되었습니다.
 			</div>
 		</c:if> 
 	</p>
 	<p><a href="/member/signup">회원가입</a></p>
</form>
</body>
</html>