<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg">
    <div class="container position-relative">

        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="GO-MONTH 로고" class="navbar-logo">
        </a>

        <ul class="navbar-nav season-nav position-absolute start-50 translate-middle-x">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/spring">봄</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/summer">여름</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/fall">가을</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/winter">겨울</a>
            </li>
        </ul>

        <ul class="navbar-nav ms-auto align-items-center">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/inquiry">문의</a>
            </li>
            
            <c:choose>
                <c:when test="${empty sessionScope.loginUser}">
                    <li class="nav-item ms-2">
                        <a class="btn btn-outline-primary btn-login" href="${pageContext.request.contextPath}/login">
                            로그인
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item ms-3">
                        <span class="text-white fw-bold">${sessionScope.loginUser.userName}님</span>
                    </li>
                    <li class="nav-item ms-2">
                        <a class="btn btn-outline-danger btn-sm" href="${pageContext.request.contextPath}/logout">
                            로그아웃
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>

    </div>
</nav>