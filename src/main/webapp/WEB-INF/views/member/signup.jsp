<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
 <title>signup</title> 
</head>
<body>

<form action="/member/register" role="form" method="post" autocomplete="off">
 <p>
  <label for="acc_id">아이디</label>
  <input type="text" id="acc_id" name="acc_id" />
 </p>  
 <p>
  <label for="acc_pw">패스워드</label>
  <input type="password" id="acc_pw" name="acc_pw" />
 </p>
 <p>
  <label for="acc_name">닉네임</label>
  <input type="text" id="acc_name" name="acc_name" />
 </p>
 <p>
   <button type="submit" id="submit">가입</button>  
 </p>
 <p>
  <a href="/">처음으로</a>
 </p>
 
</form>
</body>
</html>