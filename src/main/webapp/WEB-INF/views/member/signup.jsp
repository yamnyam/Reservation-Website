<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
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
					var acc_level = $('input[name=acc_level]:checked').val();
					var formData = $("#signupForm").serialize();
					var sto_name = $("#sto_name").val();
					var sto_tel = $("#sto_tel").val();
					var sto_loc = $("#sto_loc").val();
					
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

					if (acc_level == "") {
						alert("회원 구분을 선택해주세요.");
						return;
					}
					if (acc_level == "1"){
						if(sto_name == "" || sto_name == null){
							alert("매장 이름을 입력해주세요.");
							return;
						}
						if(sto_tel == "" || sto_tel == null){
							alert("매장 전화번호를 입력해주세요.");
							return;
						}
						if(sto_loc == "" || sto_loc == null){
							alert("매장 주소를 입력해주세요.");
							return;
						}
					}
					
					
					ajaxPostAction("/member/register", formData);
				});
			});
			
			function accChange(){
				if(document.getElementById("acc_level").value=="2"){
					document.getElementById("input_row_lev1").style.display="none";
					document.getElementById("input_row_lev2").style.display="none";
					document.getElementById("input_row_lev3").style.display="none";
				}
				else if(document.getElementById("acc_level").value=="1"){
					document.getElementById("input_row_lev1").style.display="block";
					document.getElementById("input_row_lev2").style.display="block";
					document.getElementById("input_row_lev3").style.display="block";
					
				}
			};
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
				<form id="signupForm" action="/member/register" method="post">
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
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="text" id="acc_name" name="acc_name" placeholder="이름" maxlength="20">
						</span>
					</div>
					<div class="input_row">
						<div class="level_code">
							<select class="sel" id="acc_level" name="acc_level" onchange="accChange()">
	                               	<option value="" selected="">누구</option>
	                        	    <option value="1">밥집사장</option>
	                      			<option value="2">손님</option>
	                        </select>
						</div>
					</div>
					<div class="input_row_lev" id="input_row_lev1">
						<span class="input_box">
							<input class="input" type="text" id="sto_name" name="sto_name" placeholder="맛집명" maxlength="35">
						</span>
					</div>
					<div class="input_row_lev" id="input_row_lev2">
						<span class="input_box">
							<input class="input" type="text" id="sto_tel" name="sto_tel" placeholder="전화번호" maxlength="35">
						</span>
					</div>
					<div class="input_row_lev" id="input_row_lev3">
						<span class="input_box">
							<input class="input" type="text" id="sto_loc" name="sto_loc" placeholder="주소" maxlength="100">
							<input type="hidden" id="sto_gps" name="sto_gps" value="">
						</span>
					</div>
					
					
					<div class="btn_login"><input type="button" title="가입하기" alt="가입하기" value="가입하기" class="btn_global" id="regBtn"></div>
				</form>
			</div>
		</div>
	</body>
</html>
