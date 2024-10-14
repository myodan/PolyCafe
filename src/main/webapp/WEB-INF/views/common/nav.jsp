<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            폴리카페
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-nav"
                aria-controls="navbar-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar-nav">
            <ul class="navbar-nav">
                <c:if test="${sessionScope.member eq null}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/auth/sign-in">
                            로그인
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/auth/sign-up">
                            회원가입
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.member ne null}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/products">
                            제품관리
                        </a>
                    </li>
                    <c:if test="${sessionScope.member.role eq '4'}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/members">
                                회원관리
                            </a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/cart">
                            장바구니
                        </a>
                    </li>
                    <li class="nav-item">
                        <span class="nav-link">
                                ${sessionScope.member.name}
                        </span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/auth/sign-out">
                            로그아웃
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>