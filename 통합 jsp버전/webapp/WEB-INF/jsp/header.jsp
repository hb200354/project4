<%@ page contentType="text/html; charset=UTF-8" %>
  <% String ctx=request.getContextPath(); %>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark position-relative">
      <div class="container">

        <!-- 로고 -->
        <a class="navbar-brand fw-bold" href="<%= ctx %>/index.jsp">
          GO-MONTH
        </a>

        <!-- 모바일 토글 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- 시즌 메뉴 (가운데 정렬) -->
        <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
          <ul class="navbar-nav position-lg-absolute start-50 translate-middle-x">
            <li class="nav-item">
              <a class="nav-link" href="<%= ctx %>/spring.jsp">봄</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%= ctx %>/summer.jsp">여름</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%= ctx %>/fall.jsp">가을</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%= ctx %>/winter.jsp">겨울</a>
            </li>
          </ul>
        </div>

        <!-- 로그인 버튼 (오른쪽) -->
        <div class="d-none d-lg-block" id="authArea">
          <a class="btn btn-outline-light btn-login" href="<%= ctx %>/login.jsp">
            로그인
          </a>
        </div>

      </div>
    </nav>