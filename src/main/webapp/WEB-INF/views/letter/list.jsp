<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>list</title>
	</head>
	<body>
	
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>

		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.let_no}</td>
				<td>
					<a href="/letter/view?let_no=${list.let_no}"> ${list.let_title}</a>
				<td>
				<td>${list.let_date}</td>
			</tr>
		</c:forEach>
		
	</table></br>
	
	<div id="nav">
		<%@ include file="../common/nav.jsp" %>
	</div>	
	</body>
</html>