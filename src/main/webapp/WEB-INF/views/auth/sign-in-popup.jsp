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
<main class="container d-flex flex-column gap-2">
    <div class="mt-2">
        <h3>로그인</h3>
    </div>
    <form class="vstack gap-2" action="${pageContext.request.contextPath}/auth/sign-in" method="post">
        <div>
            <label for="username">사용자 이름</label>
            <input type="text" id="username" name="username" class="form-control"/>
        </div>

        <div>
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" class="form-control"/>
        </div>

        <button class="btn btn-primary" type="submit">확인</button>

        <c:if test="${message ne null}">
            <p>${message}</p>
        </c:if>

        <a href="javascript:self.close()">돌아가기</a>
    </form>
</main>
</body>
</html>