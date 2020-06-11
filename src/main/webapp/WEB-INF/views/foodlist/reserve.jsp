<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 예약</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		    
		<script type="text/javascript">
		
			$(document).ready(function(){
				$("#btnReserve").click(function(){
					var form = document.getElementById('reserveForm');
					form.action = "/store/afterReserve";
					$("#res_no_sto").val('${reserve.sto_no}');
					$("#res_no_acc").val('<%= no %>');
					form.method = "post";
					
					form.submit();
				});
				
				$( "#res_date" ).datepicker({
					dateFormat: 'yy-mm-dd' 
				});
				
				$("#btnCancel").click(function(){
					
					form.action = "/foodlist/foodDetail";
					form.method = "post";
					form.submit();
				});
			});
			
			function foodlist() {
				var form = $("#foodlistForm");

				form.submit();
			}
		</script>
	</head>
	<body>
		<!-- Header -->
		<header id="header">
			<nav class="left">
				<a href="#menu"><span>Menu</span></a>
			</nav>
			<a href="/"><img class="logo" src="/resources/images/home.png"></a>
			<nav class="right">	
				<% if (no == null || no == "") { %>
					<a href="/member/login" class="button alt">Login</a>
				<% } else { %>
					<a href="javascript:logout()" class="button alt">Logout</a>
				<% } %>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<div class="acc_img"><img src="/resources/images/medical-mask.png"></div>
			<div class="acc_info">
				<div class="nick">
					<% if (no == null || no == "") { %>
						<a href="/member/login" class="button alt">로그인하세요</a>
					<% } else { %>	
					<%= session.getAttribute("acc_name") %>님
					<% } %>
				</div>
				<div>내정보 수정</div>
				<div>내가 쓴 리뷰</div>
				<div>예약확인</div>
				<div>
					<% if (level == 1) { %>
						<a href="javascript:edit(<%= session.getAttribute("acc_no") %>)">밥집등록</a>	
					<% } %>
				</div>
			</div>
		</nav>
		<div class="letter_info" style="padding-left: 30px; text-align: center; font-size: 1.7em;">
				예약 : ${reserve.sto_name}
		</div>
		<div id="wrap">
			<form id="reserveForm">
				<div class="input_row">
					<input type="hidden" id="res_no_sto" name="res_no_sto"/>
					<input type="hidden" id="res_no_acc" name="res_no_acc"/>
	                <h2 class="input_row_tit">예약자 성명<span class="point"></span></h2>
	                <input class="input" id="let_title" name="res_name" type="text" placeholder="이름을 입력해주세요.">
	            </div>
	            <div class="input_row">
	                <h2 class="input_row_tit">예약 인원<span class="point"></span></h2>
	                <div class="input_row">
						<div class="level_code">
							<select class="sel" id="acc_level" name="res_people">
                               	<option value="">인원 수</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
	                        </select>
						</div>
					</div>
	            </div>
				<div class="input_row">
	            	<h2 class="input_row_tit">예약 날짜<span class="point"></span></h2>
					<input class ="input" type="text" id="res_date" name="res_date">
	            </div>
	            <div class="input_row">
	            	<h2 class="input_row_tit">예약 시간<span class="point"></span></h2>
	            	<input class="input" type="time" id="res_time" name="res_time" maxlength="50"><br>
	            </div>
	            <div class="input_row">
	                <input class="btn_global" type="button" id="btnReserve" value="예약등록">
	            	<input class="btn_global" type="button" id="btnCancel" value="취소">
                </div>
            </form>
		</div>
		<!-- Bottom_bar -->
		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="javascript:foodlist()"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
		    </ul>
		</div>
		
		<form id="foodlistForm" action="/foodlist/foodView" method="post">
	    	<input type="hidden" id="gps_x" name="gps_x" value="37.322843"/>
	    	<input type="hidden" id="gps_y" name="gps_y" value="127.127846"/>
		</form>
	</body>
</html>