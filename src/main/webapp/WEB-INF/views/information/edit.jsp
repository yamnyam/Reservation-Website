<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집</title>
   	</head>
   	<body>
		<div id="wrap">
			<form id="signupForm" enctype="multipart/form-data" action="/information/stoUpdate" method="post">
				<div class="input_row" id="sto_name_box">
					<span class="input_box">
						<input type="hidden" id="sto_no_acc" name="sto_no_acc" value="<%= session.getAttribute("acc_no") %>" />
						<input class="input" type="text" id="sto_name" name="sto_name" placeholder="밥집명" maxlength="35" value="${store.sto_name}">
					</span>
				</div>
				<div class="input_row" id="sto_tel_box">
					<span class="input_box">
						<input class="input" type="text" id="sto_tel" name="sto_tel" placeholder="전화번호" maxlength="35" value="${store.sto_tel}">
					</span>
				</div>
				<div class="input_row" id="sto_loc_box">
					<span class="input_box">
						<input class="input" type="text" id="sto_loc" name="sto_loc" placeholder="주소" maxlength="100" style="float: left; width:90%;" value="${store.sto_loc}">
						<input class="input" type="text" onclick="findAddress()" value="검색" style="float: right; width: 10%; border: 1px solid #dadada; text-align-last: center;">
						<input type="hidden" id="sto_gps_x" name="sto_gps_x" value="${store.sto_gps_x}">
						<input type="hidden" id="sto_gps_y" name="sto_gps_y" value="${store.sto_gps_y}">
					</span>
				</div>
				<div id="map" style="width:100%;height:300px;margin-top:10px;display:none;"></div>
				<script>
					var mapContainer = document.getElementById('map');
					var options = {
							center: new kakao.maps.LatLng(${store.sto_gps_x}, ${store.sto_gps_y}),
							level: 4
						};
					
						var map = new kakao.maps.Map(mapContainer, options);
						//주소-좌표 변환 객체를 생성
					    var geocoder = new kakao.maps.services.Geocoder();
					    //마커를 미리 생성
					    var marker = new kakao.maps.Marker({
					        position: new kakao.maps.LatLng(${store.sto_gps_x}, ${store.sto_gps_y}),
					        map: map
					    });
			    </script>
			    <div class="input_row" id="sto_comment">
					<span class="input_box">
						<input class="input" type="text" id="sto_comment" name="sto_comment" placeholder="한마디" maxlength="35" value="${store.sto_comment}">
					</span>
				</div>
			    <div id="sto_menu">
			    	<input type="button" onclick="javascript:addMenu()">
			    	<c:forEach items="${menu}" var="menu">
			    		<div>
			    			<div class='input_row' id='menu1' style='height: fit-content;'>
				    			<span class='input_box'>
					    			<input class='input' type='text' id='menu_name1' name='menu_name' placeholder='메뉴이름' maxlength='35' value="${menu.menu_name} ">
					    			<input class='input' type='text' id='menu_price1' name='menu_price' style='float: left; width: 85%;' placeholder='가격' maxlength='35' value="${menu.menu_price}">
					    			<input class='input' type='text' id='menu_check1' style='float: right; width: fit-content;' name='menu_check' value="${menu.menu_check}">
				    			</span>
			    			</div>
			    		</div>
			    	</c:forEach>
				</div>
<!-- 				<div class="inputArea"> -->
<!-- 					<label for="sto_photo">이미지</label> -->
<!-- 					<input type="file" id="sto_photo" name="file" /> -->
<!-- 					<div class="select_img"><img src="" /></div> -->
<!-- 				</div> -->
				
				<div class="btn_login"><input type="submit" title="수정하기" alt="수정하기" value="수정하기" class="btn_global" id="stoInfoBtn"></div>
			    <script>
			    	var count = 0;
			    	
			    	function addMenu(){
			    		var addedMenuDiv= document.getElementById("sto_menu");
			    		
			    		var str = "";
			    		
			    		str+="<div class='input_row' id='menu1' style='height: fit-content;'>";
			    		str+="<span class='input_box'>";
			    		str+="<input class='input' type='text' id='menu_name1' name='menu_name' placeholder='메뉴이름' maxlength='35'>";
			    		str+="<input class='input' type='text' id='menu_price1' name='menu_price' style='float: left; width: 85%;' placeholder='가격' maxlength='35'>";
			    		str+="<input class='input' type='text' id='menu_check1' style='float: right; width: fit-content;' name='menu_check'>";
			    		str+="</span></div>";
			    		
			    		var addedDiv = document.createElement("div");
			    		addedDiv.innerHTML=str;
			    		addedMenuDiv.appendChild(addedDiv);
			    		
			    		count++;
			    	};
			    </script>
			</form>
		</div>
	</body>
</html>