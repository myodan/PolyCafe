<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="message" scope="request" class="java.lang.String"/>
<html>
<head>
	<c:import url="../common/head.jsp"/>
	<title>로그인</title>
</head>
<body>
<c:import url="../common/nav.jsp"/>
<main class="container d-flex flex-column gap-2">
	<div>
		<h3>로그인</h3>
	</div>
	<form class="vstack gap-2" action="${pageContext.request.contextPath}/auth/sign-in" method="post">
		<div>
			<label for="username">사용자 이름</label>
			<input class="form-control" type="text" id="username" name="username"/>
		</div>

		<div>
			<label for="password">비밀번호</label>
			<input class="form-control" type="password" id="password" name="password"/>
		</div>

		<button class="btn btn-primary" type="submit">확인</button>

		<c:if test="${message ne null}">
			<p>${message}</p>
		</c:if>
	</form>
	<a href="${pageContext.request.contextPath}/">돌아가기</a>
</main>
</body>
</html>