<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집 : 내주변 밥집</title>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a&libraries=services"></script>
		
		<script type="text/javascript">
			function listLetter(acc_no) {
            
				if (acc_no == undefined) {
               		alert("로그인한 후 이용가능합니다.");
               		return;
            	}
            
            	var form = $("#letterForm");
            	form.submit();
         	}

			function foodDetail(sto_no) {
				var form = $("#detailForm");
				$("#sto_no").val(sto_no);

				form.submit();
			}
			
			function foodlist() {
				var form = $("#foodlistForm");

				form.submit();
			}
			
			function onClickSearch(){
				
				var places = new kakao.maps.services.Places();
				
				var callback = function(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        console.log(result);
				        $("#search_gps_x").val(result[0].x);
				        $("#search_gps_y").val(result[0].y);
				    }
				};
				
				var options ={
						location: new kakao.maps.LatLng($("gps_x").val(), $("gps_y").val())
				};
	
				places.keywordSearch($("#search").val(), callback);
				$("#searchForm").submit();
			}
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
		
		<!-- Wrap -->
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
			
			<!-- One -->
			<div id = "map"></div>
			<script>
	
				var container = document.getElementById('map');
				
				var options = {
					center: new kakao.maps.LatLng(${gps_x}, ${gps_y}),
					level: 4
				};
				
				if(navigator.geolocation){
					navigator.geolocation.getCurrentPosition(function(position) {
				        
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
						$("#gps_x").val(lat);
						$("#gps_y").val(lon);
						
					});
				}else{
					console.error('geo error');
				}
				
				$(document).ready(function(){
					$("#btnAround").click(function(){
						var formData = $("#foodlistForm");
						navigator.geolocation.getCurrentPosition(function(position) {
					        
					        var lat = position.coords.latitude, // 위도
					            lon = position.coords.longitude; // 경도
					        
					        if(lat==null&&lon==null){
								$("#gps_x").val(lat);
								$("#gps_y").val(lon);
					        }
						});
				        /* var locPosition = new kakao.maps.LatLng($("#gps_x").val(), $("#gps_y").val());
				        map.setCenter(locPosition);   
						 */
					    formData.submit();
					});
				});
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
			<input type="button" id="btnAround" name="btnAround" value="GPS" />
			
			<c:forEach items="${view}" var="view">
			 	<div class="contents">
					<div class="contents_info" onclick="javascript:foodDetail('${view.sto_no}')">
					 	<ul>
						 	<li>${view.sto_name}</li>
						 	<li>음식종류 #해시태그</li>
		                    <li>사장 한마디</li>
		                    <li>"       "</li> 
		                    <li>#해시태그 #해시태그 #해시태그</li>
						  	<li><script>geocoder.addressSearch('${view.sto_loc}', callback);</script></li>
					 	</ul>
					 </div>
					 <div class="contents_img_box">
				   			<img src="${view.sto_photo}">
					 </div>
				</div>	
			</c:forEach>
			
			<p style="border-top: 1px solid #ededed"></p>
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
		
		<!-- Hidden Form -->
		<form id="letterForm" action="/letter/list" method="post">
	    	<input type="hidden" id="let_no_acc" name="let_no_acc" value="<%= no %>" />
		</form>
		
		<form id="detailForm" action="/foodlist/foodDetail" method="post">
	    	<input type="hidden" id="sto_no" name="sto_no" />
		</form>
		
		<!-- <form id="aroundForm" action="/foodlist/foodView" method="post">
	    	<input type="hidden" id="gps_x" name="gps_x"/>
	    	<input type="hidden" id="gps_y" name="gps_y"/>
		</form> -->
		
		<form id="foodlistForm" action="/foodlist/foodView" method="post">
	    	<input type="hidden" id="gps_x" name="gps_x" value="${gps_x}"/>
	    	<input type="hidden" id="gps_y" name="gps_y" value="${gps_y}"/>
		</form>
	</body>
</html>