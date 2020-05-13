<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	String no = "";

	if (session.getAttribute("acc_no") != null)
		no = Integer.toString((int)session.getAttribute("acc_no"));
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Script -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/skel.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery.scrolly.min.js"></script>
<script src="/resources/js/skel.min.js"></script>
<script src="/resources/js/util.js"></script>
<script src="/resources/js/main.js"></script>
<script src="/resources/js/kakao.js"></script>
<script src="/resources/js/common.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">

<!-- Meta -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />