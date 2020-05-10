<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>list</title>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnWrite").click(function(){
					location.href = "/letter/write";
				});
			});
		</script>
	</head>
	<body>
		<h2>게시글 목록</h2>
		<button type="button" id="btnWrite">글쓰기</button>
		<table border="1" width="600px">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.let_no}</td>
					<td>
						<a href="/letter/view?let_no=${list.let_no}">${list.let_title}</a>
					</td>
					<td>
						<fmt:formatDate value="${list.let_date}" pattern="yyyy-MM-dd HH:mm:ss" />
					</td>
					<td>${list.let_viewCnt}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
					<c:if test="${prev}">
						<a href="/letter/listPage?num=${startPageNum - 1}">[이전]</a>
					</c:if>
				
					<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
						<c:choose>	
							<c:when test="${select != num}">
								<a href="/letter/listPage?num=${num}">${num}</a>
							</c:when>
							<c:otherwise>
								<span style="color:red">${num}</span>
							</c:otherwise>	 
						</c:choose>
					</c:forEach>
					
					<c:if test="${next}">
							<a href="/letter/listPage?num=${endPageNum + 1}">[다음]</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<a href="/">처음으로</a>
				</td>
			</tr>	
		</table>	
	</body>
</html>