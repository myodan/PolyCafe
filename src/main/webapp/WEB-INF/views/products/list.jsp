<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="list" scope="request" type="java.util.List<dev.myodan.polycafe.model.Product>"/>
<jsp:useBean id="pageable" scope="request" type="dev.myodan.polycafe.util.Pageable"/>
<html>
<head>
    <c:import url="../common/head.jsp"/>
    <title>제품 목록</title>
</head>
<body>
<c:import url="../common/nav.jsp"/>
<main class="container">
    <table>
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">제품명</th>
            <th scope="col">가격</th>
            <th scope="col">등급</th>
            <th scope="col">관리</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${fn:length(list) == 0}">
            <tr>
                <td colspan="5">데이터가 존재하지 않습니다.</td>
            </tr>
        </c:if>
        <c:forEach items="${list}" var="item">
            <tr>
                <th scope="row">${item.id}</th>
                <td>
                    <a class="secondary" href="/products/${item.id}">${item.name}</a>
                </td>
                <td>₩<fmt:formatNumber value="${item.price}"/></td>
                <td>${item.grade}</td>
                <td>
                    <a class="secondary" href="${pageContext.request.contextPath}/products/edit?id=${item.id}">수정</a>
                    <a class="secondary" href="${pageContext.request.contextPath}/products/delete?id=${item.id}">삭제</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <section style="display: flex; gap: 0.5rem; justify-content: space-between;">
        <span>총 ${pageable.count}개</span>
        <div style="display: flex; gap: 0.5rem;">
            <a class="contrast" href="${pageContext.request.contextPath}/products?page=1">
                처음
            </a>
            <a class="contrast" href="${pageContext.request.contextPath}/products?page=${pageable.prev}">
                이전
            </a>
            <c:forEach var="page" items="${pageable.list}">
                <a class="contrast"
                   <c:if test="${page eq pageable.page}">aria-current="page"</c:if>
                   href="${pageContext.request.contextPath}/products?page=${page}">${page}</a>
            </c:forEach>
            <a class="contrast" href="${pageContext.request.contextPath}/products?page=${pageable.next}">
                다음
            </a>
            <a class="contrast" href="${pageContext.request.contextPath}/products?page=${pageable.last}">
                끝
            </a>
        </div>
        <a href="${pageContext.request.contextPath}/products/add">추가</a>
    </section>
</main>
</body>
</html>
