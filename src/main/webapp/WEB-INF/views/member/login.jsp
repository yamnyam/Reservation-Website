<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 로그인</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/css/main.css" />
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/jquery.scrolly.min.js"></script>
		<script src="/resources/js/skel.min.js"></script>
		<script src="/resources/js/util.js"></script>
		<script src="/resources/js/main.js"></script>
		<script src="/resources/js/kakao.js"></script>
		<script>
			Kakao.init('efac78643eb016816e0a0d506200b05a');

        	// SDK 초기화 여부를 판단합니다.
       		console.log(Kakao.isInitialized());
       		Kakao.Auth.createLoginButton({
       		  container: '#kakao-login-btn',
       		  size: 'small',
       		  success: function(response) {
       		    console.log(response);
       		  },
       		  fail: function(error) {
       		    console.log(error);
       		  },
       		});
		</script>
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
		<!-- Wrapper -->
		<div id="wrap_">
		
			<!-- Header -->
			<header id="header_">
				<a href="/" class="logo"><img src="/resources/images/home.png"></a>
			</header>
			
			<!-- Container -->
			<div id="container">
				<form id="loginForm" action="/member/logincheck" method="post">
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
					<div class="btn_login"><input type="submit" title="로그인" alt="로그인" value="로그인" class="btn_global" id="login"></div>
					<div class="btn_login"><input type="button" title="회원가입" alt="회원가입" value="회원가입" class="btn_global" id="join" onclick="location.href='/member/signup'"></div>
					<div class="btn_login"><a><img src="/resources/images/kakao_login_btn_medium_wide.png" style="width: 100%;"></a></div>
					<!-- <p>
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
					</p> -->
				</form>
			</div>
		</div>
		</body>
</html>