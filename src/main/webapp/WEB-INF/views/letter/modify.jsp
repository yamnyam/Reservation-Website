<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 수정</title>
	</head>
	<body>
		<form method="post">
		
			<label>제목</label>
			<input type="text" name="let_title" value="${view.let_title}"/><br />

			<label>내용</label>
			<textarea cols="50" rows="5" name="let_content">${view.let_content}</textarea><br />

			<button type="submit">완료</button>

		</form>
		
		<ul>
			<li>
				<a href="/letter/listPage?num=1">게시물 목록</a>
			</li>
		</ul>
	</body>
</html>