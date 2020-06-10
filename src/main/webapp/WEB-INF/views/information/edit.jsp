<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집</title>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a&libraries=services"></script>		
		<script>
		
			Kakao.init('efac78643eb016816e0a0d506200b05a');

        	// SDK 초기화 여부를 판단합니다.
       		console.log(Kakao.isInitialized());
		</script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			//지도를 미리 생성
			
		 	    function findAddress() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addr = data.address; // 최종 주소 변수
		
		                // 주소 정보를 해당 필드에 넣는다.
		                $("#sto_loc").val(addr);
		                // 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {
		
		                        var result = results[0]; //첫번째 결과의 값을 활용
		
		                        // 해당 주소에 대한 좌표를 받아서
		                        var coords = new kakao.maps.LatLng(result.y, result.x);
		                        $("#sto_gps_x").val(result.y);
		    			        $("#sto_gps_y").val(result.x);
		                        // 지도를 보여준다.
		                        mapContainer.style.display = "block";
		                        map.relayout();
		                        // 지도 중심을 변경한다.
		                        map.setCenter(coords);
		                        // 마커를 결과값으로 받은 위치로 옮긴다.
		                        marker.setPosition(coords)
		                    }
		                });
		            }
		        }).open();
		    }
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
			
			function logout() {
				ajaxPostAction("/member/logout");
			}
			
			function noticeView(notice_no) {
				var form = $("#noticeForm");
				$("#notice_no").val(notice_no);

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
			
			$(document).ready(function(){
				$("#stoInfoBtn").click(function(){
					var formData = $("#signupForm").serialize();
					
					ajaxPostAction("/information/stoInfo", formData);
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
		<div id="wrap">
			<form id="signupForm" method="post">
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
						<input type="hidden" id="sto_gps_x" name="sto_gps_x" value="">
						<input type="hidden" id="sto_gps_y" name="sto_gps_y" value="">
					</span>
				</div>
				<div id="map" style="width:100%;height:300px;margin-top:10px;display:none;"></div>
				<script>
					var mapContainer = document.getElementById('map');
					var options = {
							center: new kakao.maps.LatLng(37.322843, 127.127846),
							level: 4
						};
					
						var map = new kakao.maps.Map(mapContainer, options);
						//주소-좌표 변환 객체를 생성
					    var geocoder = new kakao.maps.services.Geocoder();
					    //마커를 미리 생성
					    var marker = new kakao.maps.Marker({
					        position: new kakao.maps.LatLng(37.322843, 127.127846),
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
				</div>
				<div class="inputArea">
					<label for="sto_photo">이미지</label>
					<input type="file" id="sto_photo" name="sto_photo" />
					<div class="select_img"><img src="" /></div>
					<script>
						$("#sto_photo").change(function(){
							if(this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src", data.target.result).width(500);        
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
					</script>
					
<%-- 					<%=request.getRealPath("/") %> --%>
				</div>
				
				<div class="btn_login"><input type="button" title="등록하기" alt="등록하기" value="등록하기" class="btn_global" id="stoInfoBtn"></div>
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
		
		<form id="noticeForm" action="/notice/noticeView" method="post">
	    	<input type="hidden" id="notice_no" name="notice_no" />
		</form>
		
		<form id="informationForm">
			<input type="hidden" id="acc_no" name="acc_no" />
		</form>
		
		<form id="foodlistForm" action="/foodlist/foodView" method="post">
	    	<input type="hidden" id="gps_x" name="gps_x" value="37.322843"/>
	    	<input type="hidden" id="gps_y" name="gps_y" value="127.127846"/>
		</form>
	</body>
</html>