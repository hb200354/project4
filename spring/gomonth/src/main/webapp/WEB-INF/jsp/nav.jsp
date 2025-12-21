<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<nav class="navbar navbar-expand-lg">
    <div class="container position-relative">

        <!-- 로고 (홈/index 이동) -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            GO-MONTH
        </a>

        <!-- 중앙: 계절 네비게이션 -->
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

        <!-- 우측: 문의 / 로그인 -->
        <ul class="navbar-nav ms-auto align-items-center">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/inquiryList">
                    문의
                </a>
            </li>
            <li class="nav-item ms-2">
                <a class="btn btn-outline-primary btn-login" href="${pageContext.request.contextPath}/login">
                    로그인
                </a>
            </li>
        </ul>

    </div>
</nav>