<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <c:import url="./common/head.jsp"/>
    <title>폴리카페</title>
</head>
<body>
<main class="container">
    <c:import url="./common/nav.jsp"/>
    ${sessionScope.member}
</main>
</body>
</html>
