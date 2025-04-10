<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>인덱스 화면</h3>
<c:if test="${empty user }">
<ul>
	<li><a href="/views/user/login">로그인</a></li>
	<li><a href="/views/user/join">회원가입</a></li>
</ul>
</c:if>
<c:if test="${not empty user }">
<ul>
	<li><a href="/views/board/list">게시판</a></li>
</ul>
</c:if>
</body>
</html>