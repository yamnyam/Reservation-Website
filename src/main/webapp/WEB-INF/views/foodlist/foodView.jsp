<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집 : 내주변 밥집</title>
	</head>
	<body>
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
				
				var imageSrc = '/resources/images/green_color.png',
					imageSize = new kakao.maps.Size(25, 25),
					imageOption = {offset: new kakao.maps.Point(15, 9)};
				
				
				var geocoder = new kakao.maps.services.Geocoder();
	
				var callback = function(result, status) {
				    if (status === kakao.maps.services.Status.OK) {
				        console.log(result);
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				    	coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords,
			            image: markerImage
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
		                    <li>${view.sto_comment}</li>
		                    <li>평균가격: ${view.average_price}</li> 
		                    <li>${view.tag}</li>
						  	<li><script>geocoder.addressSearch('${view.sto_loc}', callback);</script></li>
					 	</ul>
					 </div>
					 <div class="contents_img_box">
				   			<img src="${view.sto_photo}" class="Img" />
					 </div>
				</div>	
			</c:forEach>
			<p style="border-top: 1px solid #ededed"></p>
		</div>
	</body>
</html>