<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예약</title>
		<script type="text/javascript">
		
			$(document).ready(function(){
				$("#btnReserve").click(function(){
					var form = document.getElementById('reserveForm');
					form.action = "/store/afterReserve";
					form.method = "post";
					form.submit();
				});
			});
		</script>
	</head>
	<body>
		<h2>${reserve.sto_name} 예약</h2>
		<form id="reserveForm">
			예약자 성명: <input type="text" id="res_name" name="res_name" maxlength="50"><br>
			예약 인원: <select id="res_people" name="res_people">
						<option value="">인원 수</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select><br>
			예약 날짜: <select id="res_month" name="res_month">
					<option value="">월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<select id="res_date" name="res_date">
					<option value="">일</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</select><br>
			예약 시간: <input type="text" id="res_time" name="res_time" maxlength="50"><br>
			<input type="button" id="btnReserve" value="예약완료">
			<input type="button" id="btnCancel" value="취소">
		</form>
	</body>
</html>