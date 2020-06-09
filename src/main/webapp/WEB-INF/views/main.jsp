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
			
			function edit(acc_no) {
				var editForm = document.getElementById('informationForm');;
				$("#sto_no_acc").val(acc_no);
				editForm.action="/information/edit";
				editForm.method="post";
// 				form.action = "/information/edit";
				editForm.submit();
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
			
			<!-- MainImg -->
			<img class="mainimg" src="/resources/images/main.jpg">
			
			<div>
				<div style="text-align: center; font-size: 1.5em;padding: 5px 0;">공지사항</div>
				<div class="list_header">
					<div style="width: 15%;">번호</div>
					<div style="width: 45%;">제목</div>
					<div style="width: 25%;">작성일</div>
					<div style="width: 15%;">조회</div>
				</div>
				<div class="list_box">	
					<!-- list_content -->
					<c:forEach items="${list}" var="list">
						<div class="list_content">
							<div style="width: 15%;">${list.notice_no}</div>
							<div style="width: 45%;text-align: left;"><a href="javascript:noticeView(${list.notice_no})">${list.notice_title}</a></div>
							<div style="width: 25%;"><fmt:formatDate value="${list.notice_date}" pattern="MM-dd" /></div>
							<div style="width: 15%;">${list.notice_hits}</div>
						</div>
					</c:forEach>
				</div>
				<% if (level == 3) { %>
				<a href="/notice/noticeWrite">글쓰기</a>
				<% } %>
			</div>	
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
			<input type="hidden" id="sto_no_acc" name="sto_no_acc" />
		</form>
		
		<form id="foodlistForm" action="/foodlist/foodView" method="post">
	    	<input type="hidden" id="gps_x" name="gps_x" value="37.322843"/>
	    	<input type="hidden" id="gps_y" name="gps_y" value="127.127846"/>
		</form>
	</body>
</html>