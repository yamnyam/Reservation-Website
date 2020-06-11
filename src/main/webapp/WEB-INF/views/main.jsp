<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집</title>
   	</head>
   	<body>
		<div id="wrap">
			<!-- Search -->
			<div id="search-box">
				<div class="search-area">
					<form id="searchForm" action="/search/searchList" method="post">
						<input type="text" style="display: none;">   
						<input type="text" id="search" name="search" class="search-bar" placeholder="지역, 식당 또는 음식" onkeypress="javascript:if( event.keyCode==13 ){onClickSearch();}">
						<input type="button" onclick="javascript:onClickSearch()" value=" " class="btn-search">
						<input type="hidden" id="search_gps_x" name="search_gps_x">
						<input type="hidden" id="search_gps_y" name="search_gps_y">
					</form>
				</div>
			</div>
			
			<!-- MainImg -->
			<img class="mainimg" src="/resources/images/main.jpg">
			
			<div>
				<div style="text-align: center; font-size: 1.5em;padding: 5px 0;">공지사항</div>
				<div class="list_header">
					<div style="width: 15%;">번호</div>
					<div style="width: 45%;">제목</div>
					<div style="width: 25%;">작성일</div>
					<div style="width: 15%;">조회</div>
				</div>
				<div class="list_box">	
					<!-- list_content -->
					<c:forEach items="${list}" var="list">
						<div class="list_content">
							<div style="width: 15%;">${list.notice_no}</div>
							<div style="width: 45%;text-align: left;"><a href="javascript:noticeView(${list.notice_no})">${list.notice_title}</a></div>
							<div style="width: 25%;"><fmt:formatDate value="${list.notice_date}" pattern="MM-dd" /></div>
							<div style="width: 15%;">${list.notice_hits}</div>
						</div>
					</c:forEach>
				</div>
				<% if (level == 3) { %>
				<a href="/notice/noticeWrite">글쓰기</a>
				<% } %>
			</div>	
		</div>
	</body>
</html>