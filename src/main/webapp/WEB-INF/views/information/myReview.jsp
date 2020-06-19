<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내가 쓴 리뷰</title>
	</head>
	<body>
		<div id="wrap">
			<c:forEach items="${review}" var="review">
				<div class="resInfoBox">
					<div class="resState">
						<span class="resTitle">${review.sto_name}의 리뷰</span><br>	
						<span style="float: left;"></span>
						<span style="float: left;"><fmt:formatDate value="${review.review_date}" pattern="yyyy년 MM월 dd일 " /></span>
					</div>
					<div class="resContent">
						<div class="input_row">
							<span>${review.review_content}</span><br>
							<span>${review.review_star}</span><br>
							<span>${review.review_tag}</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>	
	</body>
</html>