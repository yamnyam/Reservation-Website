<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String)session.getAttribute("acc_id");
%>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/Main.css" />
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a"></script>
	</head>
	<body>

		<!-- Header -->
		<header id="header">
			<nav class="left">
				<a href="#menu"><span>Menu</span></a>
			</nav>
			<a href="index2.html" class="logo">보통밥집</a>
			<nav class="right">	
				<% if (id == null || id == "") { %>
					<a href="/member/login" class="button alt">Login</a>
				<% } else { %>
					<a href="/member/logout" class="button alt">Logout</a>
				<% } %>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<li><a href="index.html">Home</a></li>
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
			<div id = "map"></div>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(37.322843, 127.127846),
					level: 4
				};
		
				var map = new kakao.maps.Map(container, options);
			</script>
				
			<!-- Footer -->
		</div>
		
		<!-- Bottom_bar -->
		<div id="bottom_bar">
			<ul>
		        <li><a href="#"><!-- <img src="#"> --><span>HOME</span></a></li>
		        <li><a href="#"><!-- <img src="#"> --><span>내주변맛집</span></a></li>
		        <li><a href="#"><!-- <img src="#"> --><span>해시태그</span></a></li>
		        <li><a href="/letter/listPage?num=1"><!-- <img src="#"> --><span>마음의 편지</span></a></li>
    		</ul>
   			<!-- <ul>
		        <li onclick="location.href='#'" style="background-color: 123"><img src="이미지넣은경로" alt="기능1"></li>
		        <li onclick="location.href='#'" style="background-color: 456"><img src="이미지넣은경로" alt="기능2"></li>
		        <li onclick="location.href='#'" style="background-color: 789"><img src="이미지넣은경로" alt="기능3"></li>
		        <li onclick="location.href='#'" style="background-color: abc"><img src="이미지넣은경로" alt="기능4"></li>
		    </ul> -->
		</div>
			
		<!-- Scripts -->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.scrolly.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/util.js"></script>
		<script src="js/main.js"></script>
		<script src="js/kakao.js"></script>
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
	</body>
</html>