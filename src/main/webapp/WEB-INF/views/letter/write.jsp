<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="/letter/write" method="post">
		
			<label>제목</label>
			<input type="text" id="let_title" name="let_title" placeholder="제목을 입력해주세요"/><br />

			<label>내용</label>
			<textarea cols="50" rows="5" id="let_content" name="let_content" placeholder="내용을 입력해주세요"></textarea><br />

			<button type="submit">작성</button>
			
		</form>
		
		<ul>
			<li>
				<a href="/letter/listPage?num=1">게시물 목록</a>
			</li>
		</ul>
	</body>
</html>