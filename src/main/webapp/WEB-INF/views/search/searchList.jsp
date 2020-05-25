<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>검색 리스트</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a&libraries=services"></script>
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

		<!-- Menu -->
		<nav id="menu">
			<ul class="links">
				<li><a href="main">Home</a></li>
				<li><a href="generic.html">내주변밥집</a></li>
				<li><a href="elements.html">밥집해시태그</a></li>
			</ul>
		</nav>
		
		<!-- Search -->
		<div id="search-box">
			<div class="search-area">
				<form id="searchForm" action="/search/searchList">   
					<input type="text" id="search" name="search" class="search-bar" placeholder="지역, 식당 또는 음식">
					<input type="submit" value=" " class="btn-search">
				</form>
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
				
				var geocoder = new kakao.maps.services.Geocoder();

				var callback = function(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        console.log(result);
				    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
					}
				};
				
			</script>
				<c:forEach items="${list}" var="list">
				 	<div class="contents">
						<div class="contents_info">
						 	<ul>
							 	<li>${list.sto_name}</li>
							 	<li>평균 가격: 아직 미정</li>
							 	<li>${list.sto_tel}</li>
							 	<li>${list.sto_loc}</li>
							  	<li><script>geocoder.addressSearch('${list.sto_loc}', callback);</script></li>
						 	</ul>
						 </div>
						 <div class="contents_img_box">
					   			<img src="/resources/images/ban.png">
						 </div>
					</div>	
				</c:forEach>
				
				<p style="border-top: 1px solid #ededed"></p>
		
		<!-- Bottom_bar -->

		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="location.href='/foodlist/foodView'"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
		    </ul>
		</div>
	</body>
</html>