<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="list" scope="request" type="java.util.List<dev.myodan.polycafe.model.Product>"/>
<html>
<head>
	<c:import url="./common/head.jsp"/>
	<title>폴리카페</title>
</head>
<body>
<c:import url="./common/nav.jsp"/>
<main class="container d-flex flex-column gap-2">
	<div>
		<h3>장바구니</h3>
	</div>
	<div>
		<table class="table table-bordered align-middle">
			<thead>
			<tr>
				<th scope="col">제품번호</th>
				<th scope="col">제품명</th>
				<th scope="col">수량</th>
				<th scope="col">단가</th>
				<th scope="col">주문금액</th>
				<th scope="col">관리</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${fn:length(list) == 0}">
				<tr>
					<td colspan="5">장바구니에 등록된 제품이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="item" items="${list}">
				<tr>
					<th scope="row">${item.id}</th>
					<td>${item.name}</td>
					<td>${sessionScope.cart.cart[item.id]}</td>
					<td>${item.price}</td>
					<td>${item.price * sessionScope.cart.cart[item.id]}</td>
					<td style="width: 0; white-space: nowrap;">
						<div class="btn-group">
							<a class="btn btn-sm btn-outline-primary" href="#">수정</a>
							<a class="btn btn-sm btn-outline-primary" href="#">삭제</a>
						</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<div class="col"></div>
	</div>
</main>
</body>
</html>
