<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 마음의 편지</title>
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
			
			function listpage(num, let_no_acc) {
				var form = $("#pageForm");
				$("#num").val(num);	
				$("#let_no_acc").val(let_no_acc);	
				
				form.submit();
			}

			function foodlist() {
				var form = $("#foodlistForm");

				form.submit();
			}
		</script>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
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
					<a href="/member/logout" class="button alt">Logout</a>
				<% } %>
			</nav>
		</header>
		
		
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
		<!-- Bottom_bar -->

		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="javascript:foodlist()"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
		    </ul>
		</div>
		
		<form id="letForm" action="/letter/view" method="post">
	    	<input type="hidden" id="let_no" name="let_no" />
		</form>
		
		<form id="pageForm" action="/letter/list" method="post">
	    	<input type="hidden" id="num" name="num" />
	    	<input type="hidden" id="let_no_acc" name="let_no_acc" />
		</form>
		
		<form id="foodlistForm" action="/foodlist/foodView" method="post">
	    	<input type="hidden" id="gps_x" name="gps_x" value="37.322843"/>
	    	<input type="hidden" id="gps_y" name="gps_y" value="127.127846"/>
		</form>
	</body>
</html>