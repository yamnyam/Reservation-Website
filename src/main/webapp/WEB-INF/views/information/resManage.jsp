<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 예약관리</title>
	</head>
	<body>
		<div id="wrap">
		
			<c:forEach items="${list}" var="list">	
				<div class="resInfoBox">
					<div class="resState">
						<span class="resTitle">${list.sto_name}</span><br>	
						<span style="float: left;">
						<c:choose>
						
							<c:when test="${list.res_check eq 0}">${list.res_name}님의 예약신청</c:when>
							<c:otherwise>${list.res_name}님 예약완료</c:otherwise>
						</c:choose>
						</span>
						<span style="float: right;"><fmt:formatDate value="${list.res_cur_time}" pattern="yyyy년 MM월 dd일 " /></span>
					</div>
					<div class="resContent">
						<div class="input_row"><span class="resDate">${list.res_date}</span></div>
						<div class="input_row">
							<span class="resTime">시간 ${list.res_time}</span>
							<span>${list.res_people}명</span>
						</div>
						<input type="button" class="btn_global" style="border-radius: 0;"name="res_check" value="예약확인" onClick="javascript:resConfirm('${list.res_no}', 2)">
						<input type="button" class="btn_global" name="res_check" value="예약거절" onClick="javascript:resConfirm('${list.res_no}', 1)">						
					</div>	
				</div>
			</c:forEach>
		</div>
	</body>
</html>