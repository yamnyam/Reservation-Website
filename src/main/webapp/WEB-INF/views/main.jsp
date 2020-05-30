<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집</title>
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
			<ul class="links">
				<li><a href="main">Home</a></li>
				<li><a href="generic.html">내주변밥집</a></li>
				<li><a href="elements.html">밥집해시태그</a></li>
			</ul>
		</nav>
		
		<div id="wrap">
		
			<!-- Search -->
			<div id="search-box">
				<div class="search-area">
					<form id="searchForm" action="/search/searchList">   
						<input type="text" id="search" name="search" class="search-bar" placeholder="지역, 식당 또는 음식">
						<input type="submit" value=" " class="btn-search">
					</form>
				</div>
			</div>
			
			<!-- MainImg -->
			<img class="mainimg" src="/resources/images/main.jpg">
			
			<div>
				<table border="1" style="width: 350px">
					<colgroup>
						<col width="10%" />
						<col width="*" />
						<col width="25%" />
						<col width="15%" />
					</colgroup>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.notice_no}</td>
								<td>
									<a href="javascript:noticeView(${list.notice_no})">${list.notice_title}</a>
								</td>
								<td>
									<fmt:formatDate value="${list.notice_date}" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>${list.notice_hits}</td>
							</tr>
						</c:forEach>
					
				</table>
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
		
		<form id="foodlistForm" action="/foodlist/foodView" method="post">
	    	<input type="hidden" id="gps_x" name="gps_x" value="37.322843"/>
	    	<input type="hidden" id="gps_y" name="gps_y" value="127.127846"/>
		</form>
	</body>
</html>