<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 수정</title>
		<script type="text/javascript">
			$(document).ready(function(){
				
				$("#btnCancel").click(function(){
					var cancel = confirm("취소하시겠습니까?");
					if(cancel){
						history.back();
					}
				});
				
				$("#btnList").click(function(){
					listLetter(<%= no%>);
				});
				
				$("#btnModify").click(function(){
					var formData = $("#modifyForm").serialize();
					ajaxPostAction("/letter/postModify", formData);
				});
			});
		</script>
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
					<a href="javascript:logout()" class="button alt">Logout</a>
				<% } %>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<div class="acc_img"><img src="/resources/images/medical-mask.png"></div>
			<div class="acc_info">
				<div class="nick">
					<% if (no == null || no == "") { %>
						<a href="/member/login" class="button alt">로그인하세요</a>
					<% } else { %>	
					<%= session.getAttribute("acc_name") %>님
					<% } %>
				</div>
				<div>내정보 수정</div>
				<div>내가 쓴 리뷰</div>
				<div>예약확인</div>
				<div>
					<% if (level == 1) { %>
						<a href="javascript:edit(<%= session.getAttribute("acc_no") %>)">밥집등록</a>	
					<% } %>
				</div>
			</div>
		</nav>		
		<!-- Wrap -->
		<div class="letter_info">
				마음의편지를 남겨주시면 성실하게<br>답변드리겠습니다.
		</div>
		<div id="wrap">
			<form id="modifyForm" name="modifyForm" action="post">
				<div class="input_row">
					<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
					<input type="hidden" id="let_no" name="let_no" value="${view.let_no}"/>
	                <h2 class="input_row_tit">제목<span class="point"></span></h2>
	                <input class="input" id="let_title" name="let_title" type="text" value="${view.let_title}">
	            </div>
	            <div class="input_row">
	                <h2 class="input_row_tit">내용<span class="point"></span></h2>
	                <textarea class="input_content" id="let_content" name="let_content" maxlength="400">${view.let_content}</textarea>
	            </div>
					
	            <div class="input_row">
	                <input class="btn_global" type="button" id="btnModify" value="수정">
	            	<input class="btn_global" type="button" id="btnCancel" value="취소">
	            	<input class="btn_global" type="button" id="btnList" value="게시글 목록">
                </div>
            </form>
		</div>
	</body>
</html>