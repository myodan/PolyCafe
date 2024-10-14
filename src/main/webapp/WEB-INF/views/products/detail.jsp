<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="item" scope="request" type="dev.myodan.polycafe.model.Product"/>
<html>
<head>
	<title>제품 정보</title>
	<c:import url="../common/head.jsp"/>
	<script type="module" defer src="${pageContext.request.contextPath}/resources/js/product-detail.js"></script>
</head>
<body>
<c:import url="../common/nav.jsp"/>
<main class="container d-flex flex-column gap-2">
	<div>
		<h3>상품 상세정보</h3>
	</div>

	<div class="card">
		<div class="col card-body">
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label" for="amount">수량</label>
				<div class="col-sm-10">
					<input id="amount" class="form-control" type="number" name="name" value="1"/>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<button id="card-btn" class="btn btn-outline-primary w-100">장바구니</button>
				</div>
				<div class="col">
					<button id="buy-btn" class="btn btn-primary w-100">구매하기</button>
				</div>
			</div>
		</div>
	</div>

	<div class="card">
		<form class="col card-body mb-0">
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label" for="name">제품명</label>
				<div class="col-sm-10">
					<input class="form-control-plaintext" type="text" id="name" name="name" value="${item.name}" readonly/>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label" for="price">가격</label>
				<div class="col-sm-10">
					<input class="form-control-plaintext" type="number" id="price" name="price" value="${item.price}"
					       readonly/>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label" for="grade">등급</label>
				<div class="col-sm-10">
					<input class="form-control-plaintext" type="text" id="grade" name="grade" value="${item.grade}"
					       readonly/>
				</div>
			</div>
			<div class="row">
				<label class="col-sm-2 col-form-label">상품 이미지</label>
				<div class="col-sm-10 d-flex align-self-center">
					<c:choose>
						<c:when test="${fn:length(item.productImages) == 0}">
							<p class="m-0">상품 이미지가 존재하지 않습니다.</p>
						</c:when>
						<c:otherwise>
							<div style="display: grid; grid-template-columns: repeat(5, 1fr); gap: .5rem;">
								<c:forEach items="${item.productImages}" var="itemImage">
									<img class="object-fit-cover w-100"
									     alt="${itemImage.filename}"
									     src="${pageContext.request.contextPath}/uploads/${itemImage.uuid}"
									/>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form>
	</div>

	<a href="${pageContext.request.contextPath}/products">돌아가기</a>
</main>
<input type="hidden" id="is-auth" value="${sessionScope.member != null}">
</body>
</html>
