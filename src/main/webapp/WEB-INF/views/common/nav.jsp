<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="container">
    <nav>
        <ul>
            <li>
                <a href="${pageContext.request.contextPath}/" class="contrast">
                    <strong>폴리카페</strong>
                </a>
            </li>
        </ul>
        <ul>
            <c:if test="${sessionScope.member eq null}">
                <li>
                    <a href="${pageContext.request.contextPath}/auth/sign-in" class="contrast">
                        로그인
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/auth/sign-up" class="contrast">
                        회원가입
                    </a>
                </li>
            </c:if>
            <c:if test="${sessionScope.member.role ne null}">
                <c:if test="${sessionScope.member.role ne '4'}">
                    <li>
                        <a href="${pageContext.request.contextPath}/products" class="contrast">
                            제품관리
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.member.role eq '4'}">
                    <li>
                        <a href="${pageContext.request.contextPath}/members" class="contrast">
                            회원관리
                        </a>
                    </li>
                </c:if>
                <li>
                    <span>
                            ${sessionScope.member.name}
                    </span>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/auth/sign-out" class="contrast">
                        로그아웃
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</header>