<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="message" scope="request" class="java.lang.String"/>
<jsp:useBean id="member" scope="request" class="dev.myodan.polycafe.model.Member"/>
<html>
<head>
    <c:import url="../common/head.jsp"/>
    <title>회원가입</title>
    <script type="module" defer
            src="${pageContext.request.contextPath}/resources/js/auth-sign-up.js"></script>
</head>
<body>
<c:import url="../common/nav.jsp"/>
<main class="container">
    <form id="sign-up" action="${pageContext.request.contextPath}/auth/sign-up" method="post">

        <label for="username">사용자 이름</label>
        <input type="text" id="username" name="username" value="${member.username}"/>
        <small id="username-helper"></small>

        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password" value="${member.password}"/>
        <small id="password-helper"></small>

        <label for="name">이름</label>
        <input type="text" id="name" name="name" value="${member.name}"/>
        <small id="name-helper"></small>

        <label for="tel">전화번호</label>
        <input type="text" id="tel" name="tel" value="${member.tel}"/>
        <small id="tel-helper"></small>

        <button type="submit">확인</button>

        <c:if test="${message ne null}">
            <p>${message}</p>
        </c:if>

        <a href="${pageContext.request.contextPath}/">돌아가기</a>
    </form>
</main>
</body>
</html>