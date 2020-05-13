<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Signup</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#regBtn").click(function(){
					var id = $("#acc_id").val();
					var pw = $("#acc_pw").val();
					var pw_check = $("#acc_pw_check").val();
					var name = $("#acc_name").val();
					var acc_level = $('input[name=acc_level]:checked').val();
					var formData = $("#signupForm").serialize();
					
					if (id == "" || id == null) {
						alert("아이디를 입력해주세요.");
						return;
					}
					
					if (pw == "" || pw == null) {
						alert("비밀번호를 입력해주세요.");
						return;
					}
					
					if (pw_check == "" || pw_check == null) {
						alert("비밀번호 확인을 입력해주세요.");
						return;
					}
					
					if (pw != pw_check){
						alert("비밀번호가 일치하지 않습니다.");
						return;
					}
					
					if (name == "" || name == null) {
						alert("이름을 입력해주세요.");
						return;
					}

					if (acc_level == undefined) {
						alert("회원 구분을 선택해주세요.");
						return;
					}
					
					ajaxPostAction("/member/register", formData);
				});
			});
		</script>
	</head>
	<body>
		<form id="signupForm" action="" method="post">
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
					<td>PW 확인</td>
					<td><input type="password" id="acc_pw_check" name="acc_pw_check" /></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" id="acc_name" name="acc_name" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="radio" id="acc_level" name="acc_level" value="1" />밥집사장
						<input type="radio" id="acc_level" name="acc_level" value="2" />손님					
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" id="regBtn" value="가입완료" />
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