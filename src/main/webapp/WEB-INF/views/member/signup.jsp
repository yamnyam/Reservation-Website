<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>보통밥집 : 회원가입</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/css/main.css" />
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/jquery.scrolly.min.js"></script>
		<script src="/resources/js/skel.min.js"></script>
		<script src="/resources/js/util.js"></script>
		<script src="/resources/js/main.js"></script>
		<script src="/resources/js/kakao.js"></script>
		
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efac78643eb016816e0a0d506200b05a&libraries=services"></script>		
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
			
			var geocoder = new kakao.maps.services.Geocoder();
			
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log(result);
			       
				}
			};
			//TODO 1 기본적인 입력값 체크
			//TODO 2 비밀번호 확인값 체크
			$(document).ready(function(){
				$("#regBtn").click(function(){
					var id = $("#acc_id").val();
					var pw = $("#acc_pw").val();
					var pw_check = $("#acc_pw_check").val();
					var name = $("#acc_name").val();
					var acc_level = $("#acc_level").val();
					var sto_name = $("#sto_name").val();
					var sto_tel = $("#sto_tel").val();
					var sto_loc = $("#sto_loc").val();
					
					if (id == "" || id == null) {
						document.getElementById("err_empty_id").style.display = "block"
						return;
					}
					document.getElementById("err_empty_id").style.display = "none"
					
					if (pw == "" || pw == null) {
						document.getElementById("err_empty_pw").style.display = "block"
						return;
					}
					document.getElementById("err_empty_pw").style.display = "none"
					
					if (pw_check == "" || pw_check == null) {
						document.getElementById("err_empty_pw_check").style.display = "block"
						return;
					}
					document.getElementById("err_empty_pw_check").style.display = "none"
					
					if (pw != pw_check){
						alert("비밀번호가 일치하지 않습니다.");
						return;
					}
					
					if (name == "" || name == null) {
						alert("이름을 입력해주세요.");
						return;
					}

					if (acc_level == "") {
						alert("회원 구분을 선택해주세요.");
						return;
					}
					if (acc_level == "1"){
						if(sto_name == "" || sto_name == null){
							alert("매장 이름을 입력해주세요.");
							return;
						}
						if(sto_tel == "" || sto_tel == null){
							alert("매장 전화번호를 입력해주세요.");
							return;
						}
						if(sto_loc == "" || sto_loc == null){
							alert("매장 주소를 입력해주세요.");
							return;
						}
					}
					
					var formData = $("#signupForm").serialize();
					
					ajaxPostAction("/member/register", formData);
				});
			});
			
			function accChange(){
				if(document.getElementById("acc_level").value=="2"){
					document.getElementById("input_row_lev1").style.display="none";
					document.getElementById("input_row_lev2").style.display="none";
					document.getElementById("input_row_lev3").style.display="none";
				}
				else if(document.getElementById("acc_level").value=="1"){
					document.getElementById("input_row_lev1").style.display="block";
					document.getElementById("input_row_lev2").style.display="block";
					document.getElementById("input_row_lev3").style.display="block";
					
				}
			};
</script>
	</head>
	<body>
		
	  	<!-- Wrapper -->
		<div id="wrap_">
		
			<!-- Header -->
			<header id="header_">
				<a href="/" class="logo"><img src="/resources/images/home.png"></a>
			</header>
			
			<!-- Container -->
			<div id="container">
				<form id="signupForm" action="/member/register" method="post">
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="text" id="acc_id" name="acc_id" placeholder="아이디" maxlength="35">
						</span>
					</div>
					<div class="error" role="alert" id="err_empty_id" style="display: none;">아이디를 입력해주세요.</div>
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="password" id="acc_pw" name="acc_pw" placeholder="비밀번호" maxlength="16">
						</span>
					</div>
					<div class="error" role="alert" id="err_empty_pw" style="display: none;">비밀번호를 입력해주세요.</div>
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="password" id="acc_pw_check" name="acc_pw_check" placeholder="비밀번호 재확인" maxlength="16">
						</span>
					</div>
					<div class="error" role="alert" id="err_empty_pw_check" style="display: none;">비밀번호 재확인을 입력해주세요.</div>
					<div class="input_row">
						<span class="input_box">
							<input class="input" type="text" id="acc_name" name="acc_name" placeholder="이름" maxlength="20">
						</span>
					</div>
					<div class="input_row">
						<div class="level_code">
							<select class="sel" id="acc_level" name="acc_level" onchange="accChange()">
	                               	<option value="" selected>회원유형</option>
	                        	    <option value="1">밥집사장</option>
	                      			<option value="2">손님</option>
	                        </select>
						</div>
					</div>
					<div class="input_row_lev" id="input_row_lev1">
						<span class="input_box">
							<input class="input" type="text" id="sto_name" name="sto_name" placeholder="밥집명" maxlength="35">
						</span>
					</div>
					<div class="input_row_lev" id="input_row_lev2">
						<span class="input_box">
							<input class="input" type="text" id="sto_tel" name="sto_tel" placeholder="전화번호" maxlength="35">
						</span>
					</div>
					<div class="input_row_lev" id="input_row_lev3">
						<span class="input_box">
							<input class="input" type="text" id="sto_loc" name="sto_loc" placeholder="주소" maxlength="100" style="float: left; width:90%;">
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
					<div class="btn_login"><input type="button" title="가입하기" alt="가입하기" value="가입하기" class="btn_global" id="regBtn"></div>
				</form>
			</div>
		</div>
	</body>
</html>