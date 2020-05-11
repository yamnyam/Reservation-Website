<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 회원가입</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<link rel="stylesheet" href="/resources/css/main.css" />
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/jquery.scrolly.min.js"></script>
		<script src="/resources/js/skel.min.js"></script>
		<script src="/resources/js/util.js"></script>
		<script src="/resources/js/main.js"></script>
		<script src="/resources/js/kakao.js"></script>
		<script type="text/javascript">
		
			//TODO 1 기본적인 입력값 체크
			//TODO 2 비밀번호 확인값 체크
			$(document).ready(function(){
				$("#regBtn").click(function(){
					var id = $("#acc_id").val();
					var pw = $("#acc_pw").val();
					var pw_check = $("#acc_pw_check").val();
					var name = $("#acc_name").val();
					var form = $("#signupForm");
					
					if (id == "" || id == null) {
						alert("아이디를 입력해주세요.");
						return;
					}
					
					if (pw == "" || pw == null) {
						alert("비밀번호를 입력해주세요.");
						return;
					}
					
					if (pw_check == "" || pw_check == null) {
						alert("필수 입력 정보입니다.");
						return;
					}
					
					if (name == "" || name == null) {
						alert("이름을 입력해주세요.");
						return;
					}
					
					if(pw != pw_check){
						alert("비밀번호가 일치하지 않습니다.");
						return;
					}
					
					form.submit();
				});
			});
		</script>
	</head>
	<body>
		
	  	<!-- Wrapper -->
		<div id="wrap_">
		
			<!-- Header -->
			<header id="header_">
				<a href="/" class="logo"><img src="/resources/images/home.png"></a>
			</header>
			
			<!-- Container -->
			<div id="container">
				<form id="loginForm" action="/member/register" method="post">
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="text" id="acc_id" name="acc_id" placeholder="아이디" maxlength="35">
						</span>
					</div>
					<div class="error" role="alert" id="err_empty_id" style="display: none;">아이디를 입력해주세요.</div>
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="password" id="acc_pw" name="acc_pw" placeholder="패스워드" maxlength="16">
						</span>
					</div>
					<div class="error" role="alert" id="err_empty_pw" style="display: none;">비밀번호를 입력해주세요.</div>
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="password" id="acc_pw_check" name="acc_pw_check" placeholder="패스워드 재확인" maxlength="16">
						</span>
					</div>
					<div class="error" role="alert" id="err_empty_pw_check" style="display: none;">비밀번호를 입력해주세요.</div>
					<div class="btn_login"><input type="submit" title="가입하기" alt="가입하기" value="가입하기" class="btn_global" id="join"></div>
					<!-- <form id="signupForm" action="/member/register" method="post">
			<p>
		  		<label for="acc_id">ID</label>
		  		<input type="text" id="acc_id" name="acc_id" />
		 	</p>
		 	<p>
		  		<label for="acc_pw">PW</label>
		  		<input type="password" id="acc_pw" name="acc_pw"/>
		  	</p>
		  	<p>
		  		<label for="acc_pw_check">PW 확인</label>
		  		<input type="password" id="acc_pw_check" name="acc_pw_check"/>
		  	</p>
		  	<p>
		  		<label for="acc_name">Name</label>
		  		<input type="text" id="acc_name" name="acc_name" />
		  	</p>
		  	<p>
				<input type="radio" id="acc_level" name="acc_level" value="1" />밥집사장
				<input type="radio" id="acc_level" name="acc_level" value="2" />손님
		  	</p>
		  	<p>
		  		<input type="button" id="regBtn" value="가입완료" />
		  	</p>
	  	</form>
	  	<p>
	  		<a href="/">처음으로</a>
	  	</p> -->
				</form>
			</div>
		</div>
	</body>
</html>