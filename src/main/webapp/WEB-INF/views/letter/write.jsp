<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<title>보통밥집 : 마음의편지 작성</title>
		<script type="text/javascript">
			$(document).ready(function(){	
				$("#btnSave").click(function(){
					var title = $("#let_title").val();
					var content = $("#let_content").val();
					var formData = $("#writeForm").serialize();
					
					if(title == "" || title == null){
						alert("제목을 입력하세요.");
						return;
					}
					
					if(content == "" || content == null){
						alert("내용을 입력하세요.");
						return;
					}

					ajaxPostAction("/letter/write", formData);
				});
				
				$("#btnList").click(function(){
					var form = document.getElementById('writeForm');
					form.action = "/letter/list";
					form.method = "post";
					form.submit();
				});
				
				$("#btnCancel").click(function(){
					var cancel = confirm("취소하시겠습니까?");
					if(cancel){
						alert("취소되었습니다.");
						var form = document.getElementById('writeForm');
						form.action = "/letter/list";
						form.method = "post";
						form.submit();
					}
				});
			});
		</script>
	</head>
	<body>		
		<!-- Wrap -->
		<div class="letter_info">
				마음의편지를 남겨주시면 성실하게<br>답변드리겠습니다.
		</div>
		<div id="wrap">
			<form id="writeForm" enctype="multipart/form-data">
				<div class="input_row">
					<input type="hidden" name="let_no_acc" id="let_no_acc" value="<%= no%>">
	                <h2 class="input_row_tit">제목<span class="point"></span></h2>
	                <input class="input" id="let_title" name="let_title" type="text" placeholder="제목을 입력해주세요 (최대100자)">
	            </div>
	            <div class="input_row">
	                <h2 class="input_row_tit">내용<span class="point"></span></h2>
	                <textarea class="input_content" id="let_content" name="let_content" maxlength="400" placeholder="내용을 입력해주세요 (최대400자)"></textarea>
	            </div>
					
	            <div class="input_row">
	                <input class="btn_global" type="button" id="btnSave" value="등록">
	            	<input class="btn_global" type="button" id="btnCancel" value="취소">
                </div>
            </form>
		</div>
	</body>
</html>