<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="item" scope="request" type="dev.myodan.polycafe.model.Product"/>
<html>
<head>
    <c:import url="../common/head.jsp"/>
    <title>제품 정보</title>
</head>
<body>
<c:import url="../common/nav.jsp"/>
<main class="container">
    <form>
        <label for="name">제품명</label>
        <input type="text" id="name" name="name" value="${item.name}" readonly/>
        <label for="price">가격</label>
        <input type="number" id="price" name="price" value="${item.price}" readonly/>
        <label for="grade">등급</label>
        <input type="text" id="grade" name="grade" value="${item.grade}" readonly/>
        <label>상품 이미지</label>
        <c:choose>
            <c:when test="${fn:length(item.productImages) == 0}">
                <p>상품 이미지가 존재하지 않습니다.</p>
            </c:when>
            <c:otherwise>
                <div style="display: grid; grid-template-columns: repeat(5, 1fr); gap: .5rem; margin-bottom: var(--pico-spacing);">
                    <c:forEach items="${item.productImages}" var="itemImage">
                        <img style="object-fit: cover; border-radius: var(--pico-border-radius); aspect-ratio: 1; width: 100%;"
                             alt="${itemImage.filename}"
                             src="${pageContext.request.contextPath}/uploads/${itemImage.uuid}"/>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}/products">돌아가기</a>
    </form>
</main>
</body>
</html>
