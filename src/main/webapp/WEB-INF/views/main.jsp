<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/css/main.css" />
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a"></script>
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/jquery.scrolly.min.js"></script>
		<script src="/resources/js/skel.min.js"></script>
		<script src="/resources/js/util.js"></script>
		<script src="/resources/js/main.js"></script>
		<script src="/resources/js/kakao.js"></script>
		<script>
			Kakao.init('efac78643eb016816e0a0d506200b05a');

        	// SDK 초기화 여부를 판단합니다.
       		console.log(Kakao.isInitialized());
       		Kakao.Auth.createLoginButton({
       		  container: '#kakao-login-btn',
       		  size: 'small',
       		  success: function(response) {
       		    console.log(response);
       		  },
       		  fail: function(error) {
       		    console.log(error);
       		  },
       		});
		</script>
		<script type="text/javascript">
			function listLetter(acc_no) {
            
				if (acc_no == undefined) {
               		alert("로그인한 후 이용가능합니다.");
               		return;
            	}
            
            	var form = $("#letterForm");
            	form.submit();
         	}
      	</script>
   	</head>
   	<body>
    	<!-- Header -->
      	<header id="header">
        	<nav class="left">
            	<a href="#menu"><span>Menu</span></a>
         	</nav>
         	<a href="/" class="logo">보통밥집</a>
         	<nav class="right">   
            <% if (no == null || no == "") { %>
               <a href="/member/login" class="button alt">Login</a>
            <% } else { %>
               <a href="/member/logout" class="button alt">Logout</a>
            <% } %>
         	</nav>
      	</header>

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

		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<li><a href="main">Home</a></li>
				<li><a href="generic.html">내주변밥집</a></li>
				<li><a href="elements.html">밥집해시태그</a></li>
			</ul>
		</nav>
		
		<div id="wrap">
			<!-- Search -->
			<div id="search-box">
				<div class="search-area">   
					<input type="text" class="search-bar">
					<input type="submit" value=" " class="btn-search">
				</div>
			</div>
		
			<!-- One -->
			<div id ="map"></div>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(37.322843, 127.127846),
					level: 4
				};
		
				var map = new kakao.maps.Map(container, options);
			</script>
			
			<div class="contents">
				<div class="contents_info">
				 	<ul>
					 	<li>보통밥집  *4.9</li>
					 	<li>3,000원 대</li>
					 	<li>010-1234-1234</li>
					 	<li>죽전동 어딘가</li>
					  	<li></li>
				 	</ul>
				</div>
				<div class="contents_img_box">
				   	<img src="/resources/images/ban.jpg">
				</div>
			</div>
	        <div class="contents">
	        	<div class="contents_info">
	            	<ul>
	                	<li>보통밥집  *4.9</li>
	                    <li>3,000원 대</li>
	                    <li>010-1234-1234</li>
	                   	<li>죽전동 어딘가</li>
	                    <li></li>
					</ul>
	          	</div>
	            <div class="contents_img_box">
	            	<img src="/resources/images/ban.jpg">
	            </div>
			</div>
	        <div class="contents">
	        	<div class="contents_info">
	            	<ul>
	                	<li>보통밥집  *4.9</li>
	                    <li>3,000원 대</li>
	                    <li>010-1234-1234</li>
	                   	<li>죽전동 어딘가</li>
	                    <li></li>
					</ul>
	          	</div>
	            <div class="contents_img_box">
	            	<img src="/resources/images/ban.jpg">
	            </div>
			</div>
	        <div class="contents">
	        	<div class="contents_info">
	            	<ul>
	                	<li>보통밥집  *4.9</li>
	                    <li>3,000원 대</li>
	                    <li>010-1234-1234</li>
	                   	<li>죽전동 어딘가</li>
	                    <li></li>
					</ul>
	          	</div>
	            <div class="contents_img_box">
	            	<img src="/resources/images/ban.jpg">
	            </div>
			</div>
	        <div class="contents">
	        	<div class="contents_info">
	            	<ul>
	                	<li>보통밥집  *4.9</li>
	                    <li>3,000원 대</li>
	                    <li>010-1234-1234</li>
	                   	<li>죽전동 어딘가</li>
	                    <li></li>
					</ul>
	          	</div>
	            <div class="contents_img_box">
	            	<img src="/resources/images/ban.jpg">
	            </div>
			</div>
			<p style="border-top: 1px solid #ededed"></p>
		</div>   
    
	    <!-- Footer -->
		<!-- Bottom_bar -->

		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_food.png" alt="내주변맛집">내주변맛집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
			    </ul>
			</div>
		</div>
		
    	<!-- Hidden Form -->
		<form id="letterForm" action="/letter/list" method="post">
	    	<input type="hidden" id="let_no_acc" name="let_no_acc" value="<%= no %>" />
		</form>
	</body>
</html>