<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집: 관리자 공지사항 작성</title>
		<script type="text/javascript">
			$(document).ready(function(){	
				$("#btnSave").click(function(){
					var title = $("#notice_title").val();
					var content = $("#notice_content").val();
					var form = document.getElementById('writeForm');
					if(title == "" || title == null){
						alert("제목을 입력하세요.");
						return;
					}
					
					if(content == "" || content == null){
						alert("내용을 입력하세요.");
						return;
					}
					
					form.action = "/notice/write";
					form.submit();
				});
				
				$("#btnList").click(function(){
					var form = document.getElementById('writeForm');
					form.action = "/";
					form.method = "post";
					form.submit();
				});
				
				$("#btnCancel").click(function(){
					var cancel = confirm("취소하시겠습니까?");
					if(cancel){
						alert("취소되었습니다.");
						var form = document.getElementById('writeForm');
						form.action = "/";
						form.method = "post";
						form.submit();
					}
				});
			})
		</script>
	</head>
	<body>
		<div id="wrap">
			<form id="writeForm" method="post" action="/notice/write">
				<div class="input_row">
	                <h2 class="input_row_tit">제목<span class="point"></span></h2>
	                <input class="input" id="notice_title" name="notice_title" type="text" placeholder="제목을 입력해주세요 (최대100자)">
	            </div>
	            <div class="input_row">
	                <h2 class="input_row_tit">내용<span class="point"></span></h2>
	                <textarea class="input_content" id="notice_content" name="notice_content" maxlength="400" placeholder="내용을 입력해주세요 (최대400자)"></textarea>
	            </div>
	            <div class="input_row">
	                <input class="btn_global" type="button" id="btnSave" value="등록">
	            	<input class="btn_global" type="button" id="btnCancel" value="취소">
                </div>
            </form>			
		</div>
	</body>
</html>