<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 예약확인</title>
	</head>
	<body>
		<div id="wrap">
		
			<c:forEach items="${list}" var="list">	
				<div class="resInfoBox">
					<div class="resState">
						<span style="float: left;">
						<c:choose>
							<c:when test="${empty list.res_check} ">예약신청중</c:when>
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
						<input type="button" class="btn_global">
						<span>
						예약번호
						${list.res_no}
						</span>
						<span>
						예약밥집
						${list.res_no_sto}
						</span>
						
					</div>	
				</div>
			</c:forEach>
		</div>
	</body>
</html>