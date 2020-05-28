<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>list</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnWrite").click(function(){
					location.href = "/letter/writeView";
				});
			});
			
			function listView(let_no) {
				var form = $("#letForm");
				$("#let_no").val(let_no);

				form.submit();
			}
			
// 			function listLetter() {
// 				var form = $("#listForm");
				
// 				form.submit();
// 			}
		</script>
	</head>
	<body>
		<h2>게시글 목록</h2>
		<table border="1" style="width:600px">
			<colgroup>
				<col width="10%" />
				<col width="*" />
				<col width="20%" />
				<col width="10%" />
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test="${fn:length(list) == 0}">
					<tr>
						<td colspan="4">등록하신 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.let_no}</td>
							<td>
								<a href="javascript:listView('${list.let_no}')">${list.let_title}</a>
							</td>
							<td>
								<fmt:formatDate value="${list.let_date}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>${list.let_viewCnt}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4">
							<c:if test="${prev}">
								<a href="/letter/list?let_no_acc=${let_no_acc}&num=${startPageNum - 1}">[이전]</a>
							</c:if>
						
							<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
								<c:choose>	
									<c:when test="${select != num}">
										<a href="/letter/list">${num}</a>
									</c:when>
									<c:otherwise>
										<span style="color:red">${num}</span>
									</c:otherwise>	 
								</c:choose>
							</c:forEach>
							
							<c:if test="${next}">
								<a href="/letter/list?let_no_acc=${let_no_acc}&num=${endPageNum + 1}">[다음]</a>
							</c:if> 	
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="4">
					<button type="button" id="btnWrite">글쓰기</button>
					<a href="/">처음으로</a>
				</td>
			</tr>
		</table>
		
		<form id="letForm" action="/letter/view" method="post">
	    	<input type="hidden" id="let_no" name="let_no" />
		</form>
	</body>
</html>