<%@ page contentType="text/html; charset=UTF-8" %>
  <% String cpath=request.getContextPath(); %>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark position-relative">
      <div class="container">

        <a class="navbar-brand fw-bold" href="<%=cpath%>/">GO-MONTH</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
          <ul class="navbar-nav position-lg-absolute start-50 translate-middle-x">
            <li class="nav-item"><a class="nav-link" href="<%=cpath%>/spring">봄</a></li>
            <li class="nav-item"><a class="nav-link" href="<%=cpath%>/summer">여름</a></li>
            <li class="nav-item"><a class="nav-link" href="<%=cpath%>/fall">가을</a></li>
            <li class="nav-item"><a class="nav-link" href="<%=cpath%>/winter">겨울</a></li>
            <li class="nav-item"><a class="nav-link" href="<%=cpath%>/about">소개</a></li>
            <li class="nav-item"><a class="nav-link" href="<%=cpath%>/inquiry">문의</a></li>
          </ul>
        </div>

        <div class="d-none d-lg-block">
          <a class="btn btn-outline-light btn-login" href="<%=cpath%>/login">
            로그인
          </a>
        </div>

      </div>
    </nav>