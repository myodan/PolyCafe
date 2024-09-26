<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="item" scope="request" type="dev.myodan.polycafe.model.Product"/>
<html>
<head>
    <c:import url="../common/head.jsp"/>
    <title>제품 수정</title>
    <script type="module" defer
            src="${pageContext.request.contextPath}/resources/js/product-image-delete.js"></script>
    <script type="module" defer
            src="${pageContext.request.contextPath}/resources/js/product-image-add.js"></script>
</head>
<body>
<c:import url="../common/nav.jsp"/>
<template id="add-product-image-template">
    <li style="display: flex; align-items: center; justify-content: space-between">
        <input type="file" name="uploadFile"/>
        <button class="secondary" type="button">-</button>
    </li>
</template>
<main class="container">
    <form action="${pageContext.request.contextPath}/products/edit?id=${item.id}" method="post"
          enctype="multipart/form-data">
        <label for="name">제품명</label>
        <input type="text" id="name" name="name" value="${item.name}"/>
        <label for="price">가격</label>
        <input type="number" id="price" name="price" value="${item.price}"/>
        <label for="grade">등급</label>
        <input type="text" id="grade" name="grade" value="${item.grade}"/>
        <label>상품 이미지</label>
        <div style="display: grid; grid-template-columns: repeat(5, 1fr); gap: .5rem; margin-bottom: var(--pico-spacing);">
            <c:forEach items="${item.productImages}" var="itemImage">
                <div style="position: relative;">
                    <img style="object-fit: cover; border-radius: var(--pico-border-radius); width: 100%;"
                         alt="${itemImage.filename}"
                         src="${pageContext.request.contextPath}/uploads/${itemImage.uuid}"/>
                    <button type="button" class="secondary prod-img-del-btn"
                            style="position: absolute; bottom: .25rem; left: .25rem; margin: 0;"
                            data-image-id="${itemImage.id}">삭제
                    </button>
                </div>
            </c:forEach>
        </div>
        <button type="button" id="add-product-image-button">추가</button>
        <ul id="product-image-list">
        </ul>
        <button type="submit">수정</button>
        <a href="${pageContext.request.contextPath}/products">돌아가기</a>
    </form>
</main>
</body>
</html>
