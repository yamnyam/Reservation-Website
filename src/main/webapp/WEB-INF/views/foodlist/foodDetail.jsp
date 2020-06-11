<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집: 상세보기</title>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a&libraries=services"></script>		
		<script type="text/javascript">
			function foodReserve(sto_no) {
				var form = $("#reserveForm");
				$("#sto_no").val(sto_no);
	
				form.submit();
			}
			
			function foodlist() {
				var form = $("#foodlistForm");

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
		<!-- Bottom_bar -->
		<div id="bottom_bar">
			<ul>
				<li onclick="location.href='/'"><img src="/resources/images/bar_home.png" alt="HOME">HOME</li>
				<li onclick="javascript:foodlist()"><img src="/resources/images/bar_food.png" alt="내주변밥집">내주변밥집</li>
				<li onclick="location.href='#'"><img src="/resources/images/bar_hash.png" alt="해시태그">해시태그</li>
				<li onclick="javascript:listLetter(<%= no %>)"><img src="/resources/images/bar_food2.png" alt="기능4">마음의편지</li>
		    </ul>
		</div>
		
		<form id="letterForm" action="/letter/list" method="post">
	    	<input type="hidden" id="let_no_acc" name="let_no_acc" value="<%= no %>" />
		</form>
		
		<form id="reserveForm" action="/foodlist/reserve?sto_no=${detail.sto_no}">
	    	<input type="hidden" id="sto_no" name="sto_no" />
		</form>
		
		<form id="foodlistForm" action="/foodlist/foodView" method="post">
	    	<input type="hidden" id="gps_x" name="gps_x" value="37.322843"/>
	    	<input type="hidden" id="gps_y" name="gps_y" value="127.127846"/>
		</form>
	</body>
</html>