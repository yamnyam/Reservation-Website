<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 마음의 편지</title>
		<script>
			$(document).ready(function(){
				$("#btnWrite").click(function(){
					location.href = "/letter/writeView";
				});
			});
		</script>
	</head>
	<body>
		<!-- Wrap -->
		<div id="wrap">
			<div>
				<div class="letter_info">
					마음의편지를 남겨주시면 성실하게<br>답변드리겠습니다.
				</div>
				<div class="list_header" style="padding-top: 10px;">
					<div style="width: 10%;">번호</div>
					<div style="width: 40%;">제목</div>
					<div style="width: 20%;">글쓴이</div>
					<div style="width: 20%;">작성일</div>
					<div style="width: 10%;">조회</div>
				</div>
				<c:choose>
					<c:when test="${fn:length(list) == 0}">
						<div>문의하신 글이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<div class="list_box">	
							<!-- list_content -->
							<c:forEach items="${list}" var="list">
								<div class="list_content">
									<div style="width: 10%;">${list.let_no}</div>
									<div style="width: 40%;text-align: left;"><a href="/letter/view?let_no=${list.let_no}">${list.let_title}</a></div>
									<div style="width: 20%;">글쓴이</div>
									<div style="width: 20%;"><fmt:formatDate value="${list.let_date}" pattern="MM-dd" /></div>
									<div style="width: 10%;">${list.let_viewCnt}</div>
								</div>
							</c:forEach>
						</div>
						<div class="list_header">
							<c:if test="${prev}">
								<a href="javascript:listpage('${startPageNum - 1}', '${let_no_acc}')">[이전]</a>
							</c:if>
					
							<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
								<c:choose>	
									<c:when test="${select != num}">
										<a href="javascript:listpage('${num}', '${let_no_acc}')">${num}</a>
									</c:when>
									<c:otherwise>
										<span style="color:red">${num}</span>
									</c:otherwise>	 
								</c:choose>
							</c:forEach>
							<c:if test="${next}">
								<a href="javascript:listpage('${endPageNum + 1}', '${let_no_acc}')">[다음]</a>
							</c:if>
						</div>
					</c:otherwise>
				</c:choose>
			</div>		
			<input class="btn_global" type="button" id="btnWrite" value="글쓰기">
		</div>
	</body>
</html>