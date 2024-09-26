<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <c:import url="../common/head.jsp"/>
    <title>제품 추가</title>
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
    <form action="${pageContext.request.contextPath}/products/add" method="post"
          enctype="multipart/form-data">
        <label for="name">제품명</label>
        <input type="text" id="name" name="name"/>
        <label for="price">가격</label>
        <input type="number" id="price" name="price"/>
        <label for="grade">등급</label>
        <input type="text" id="grade" name="grade"/>
        <label>상품 이미지</label>
        <button type="button" id="add-product-image-button">추가</button>
        <ul id="product-image-list">
        </ul>
        <button type="submit">확인</button>
        <a href="${pageContext.request.contextPath}/products">돌아가기</a>
    </form>
</main>
</body>
</html>