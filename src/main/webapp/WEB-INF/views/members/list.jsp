<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="list" scope="request" type="java.util.List<dev.myodan.polycafe.model.Member>"/>
<jsp:useBean id="pageable" scope="request" type="dev.myodan.polycafe.util.Pageable"/>
<html>
<head>
    <c:import url="../common/head.jsp"/>
    <title>회원 목록</title>
</head>
<body>
<c:import url="../common/nav.jsp"/>
<main class="container d-flex flex-column gap-2">
    <div>
        <h3>회원 목록</h3>
    </div>
    <table class="table table-bordered align-middle">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">유저이름</th>
            <th scope="col">비밀번호</th>
            <th scope="col">이름</th>
            <th scope="col">전화번호</th>
            <th scope="col">역할</th>
            <th scope="col">관리</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${fn:length(list) == 0}">
            <tr>
                <td colspan="7">데이터가 존재하지 않습니다.</td>
            </tr>
        </c:if>
        <c:forEach items="${list}" var="item">
            <tr>
                <th scope="row">${item.id}</th>
                <td>${item.username}</td>
                <td>${item.password}</td>
                <td>${item.name}</td>
                <td>${item.tel}</td>
                <td>${item.role}</td>
                <td style="width: 0; white-space: nowrap;">
                    <div class="btn-group">
                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/members/edit?id=${item.id}">수정</a>
                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/members/delete?id=${item.id}">삭제</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <section class="d-flex justify-content-between align-items-center">
        <span>총 ${pageable.count}개</span>
        <ul class="pagination m-0">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/members?page=1">
                    처음
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/members?page=${pageable.prev}">
                    이전
                </a>
            </li>
            <c:forEach var="page" items="${pageable.list}">
                <li class="page-item">
                    <a class="page-link  <c:if test="${page eq pageable.page}">active</c:if>"
                       <c:if test="${page eq pageable.page}">aria-current="page"</c:if>
                       href="${pageContext.request.contextPath}/members?page=${page}">
                            ${page}
                    </a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/members?page=${pageable.next}">
                    다음
                </a>
            </li>
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/members?page=${pageable.last}">
                    끝
                </a>
            </li>
        </ul>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/members/add">추가</a>
    </section>
</main>
</body>
</html>
