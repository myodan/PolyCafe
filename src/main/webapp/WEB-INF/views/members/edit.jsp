<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="item" scope="request" type="dev.myodan.polycafe.model.Member"/>
<html>
<head>
    <c:import url="../common/head.jsp"/>
    <title>회원 추가</title>
</head>
<body>
<c:import url="../common/nav.jsp"/>
<main class="container">
    <form action="${pageContext.request.contextPath}/members/edit?id=${item.id}" method="post">
        <label for="username">유저이름</label>
        <input type="text" id="username" name="username" value="${item.username}"/>
        <label for="password">비밀번호</label>
        <input type="text" id="password" name="password" value="${item.password}"/>
        <label for="name">이름</label>
        <input type="text" id="name" name="name" value="${item.name}"/>
        <label for="tel">전화번호</label>
        <input type="text" id="tel" name="tel" value="${item.tel}"/>
        <label for="role">역할</label>
        <select id="role" name="role">
            <option value="0" <c:if test="${item.role eq 0}">selected</c:if>>고객</option>
            <option value="1" <c:if test="${item.role eq 1}">selected</c:if>>직원</option>
            <option value="2" <c:if test="${item.role eq 2}">selected</c:if>>점장</option>
            <option value="3" <c:if test="${item.role eq 3}">selected</c:if>>본사직원</option>
        </select>
        <button type="submit">확인</button>
        <a href="${pageContext.request.contextPath}/members">돌아가기</a>
    </form>
</main>
</body>
</html>

