<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <c:import url="./common/head.jsp"/>
    <title>폴리카페</title>
</head>
<body>
<c:import url="./common/nav.jsp"/>
<main class="container d-flex flex-column gap-2">
    <div>
        <h3>메인</h3>
    </div>
    <div>
        ${sessionScope.member}
    </div>
</main>
</body>
</html>
