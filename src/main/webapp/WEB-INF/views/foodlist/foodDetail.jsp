<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집: 상세보기</title>
	</head>
	<body>
		<div id="wrap">
			<div class="stoDetail">
				<div class="sto_name">${detail.sto_name}</div>
				<div class="sto_sub">${detail.sto_tel}</div>
				<div id = "map"></div>
				<script>
		
					var container = document.getElementById('map');
					var coords = new kakao.maps.LatLng(${detail.sto_gps_x}, ${detail.sto_gps_y});
					var options = {
						center: coords,
						level: 4
					};
					var map = new kakao.maps.Map(container, options);
					
					
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        
				</script>
				<div class="sto_sub" >${detail.sto_loc}</div>
				<div class="menu_title">메 뉴</div>
				<div class="stoMenu">
					<c:forEach items="${menu}" var="menu">
						<div class="menu_box">
							<div class="menu_name">${menu.menu_name}</div>
							<div class="menu_price">${menu.menu_price}원</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<button type="button" class="btn_global" id="btnReserve" onclick="javascript:foodReserve('${detail.sto_no}')">에약하기</button>
		</div>
	</body>
</html>