<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 공지사항</title>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#btnList").click(function(){
					
					document.form.action = "/";
					document.form.submit();
				});
			});
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
			<div class="view">
				<div class="title" style="width: 100%;">${view.notice_title}</div>
				<div class="title_sub"><fmt:formatDate value="${view.notice_date}" pattern="yyyy-MM-dd HH:mm" />  조회수 ${view.notice_hits}</div>
				<div class="content">${view.notice_content}</div>
				<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
			</div>
			<div>
				<a href="/"><input class="btn_global" type="button" id="btnUpdate" value="메인"></a>
			</div>
		</div>
		<!-- Bottom_bar -->

		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="location.href='/foodlist/foodView'"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
		    </ul>
		</div>
		
		<!-- Hidden Form -->
		<form id="letterForm" action="/letter/list" method="post">
	    	<input type="hidden" id="let_no_acc" name="let_no_acc" value="<%= no %>" />
		</form>
	</body>
</html>