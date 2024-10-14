<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>제품 추가</title>
	<c:import url="../common/head.jsp"/>
	<%-- Summernote --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/lang/summernote-ko-KR.min.js"></script>
	<script type="module" defer src="${pageContext.request.contextPath}/resources/js/product-image-add.js"></script>

	<script>
        $(() => {
            $("#summernote").summernote({
                lang: "ko-KR",
                height: 240,
            })
        });
	</script>
</head>
<body>
<c:import url="../common/nav.jsp"/>
<template id="add-product-image-template">
	<div class="hstack gap-2">
		<input class="form-control" type="file" name="uploadFile"/>
		<button class="btn btn-outline-danger" type="button">-</button>
	</div>
</template>
<main class="container">
	<form class="vstack gap-2" action="${pageContext.request.contextPath}/products/add" method="post" enctype="multipart/form-data">
		<div class="row">
			<label class="col-form-label col-sm-2" for="name">제품명</label>
			<div class="col-sm-10">
				<input class="form-control" type="text" id="name" name="name"/>
			</div>
		</div>
		<div class="row">
			<label class="col-form-label col-sm-2" for="price">가격</label>
			<div class="col-sm-10">
				<input class="form-control" type="number" id="price" name="price"/>
			</div>
		</div>
		<div class="row">
			<label class="col-form-label col-sm-2" for="grade">등급</label>
			<div class="col-sm-10"><input class="form-control" type="text" id="grade" name="grade"/></div>
		</div>
		<div class="row">
			<label class="col-form-label col-sm-2">상세 설명</label>
			<div class="col-sm-10">
				<div id="summernote"></div>
			</div>
		</div>
		<div class="row">
			<label class="col-form-label col-sm-2">상품 이미지</label>
			<div class="col-sm-10 vstack gap-2">
				<button class="btn btn-outline-primary" type="button" id="add-product-image-button">이미지 추가</button>
				<div id="product-image-list" class="vstack gap-2"></div>
			</div>
		</div>
		<button class="btn btn-primary" type="submit">추가</button>
		<a href="${pageContext.request.contextPath}/products">돌아가기</a>
	</form>
</main>
</body>
</html>