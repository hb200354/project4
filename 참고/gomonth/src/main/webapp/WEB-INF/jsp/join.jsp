<%@ page contentType="text/html; charset=UTF-8" %>
  <% String cpath=request.getContextPath(); %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <title>회원가입 | GO-MONTH</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Bootstrap -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

      <!-- 공통 CSS -->
      <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    </head>

    <body>

      <%@ include file="header.jsp" %>

        <!-- =======================
 페이지 헤더
======================= -->
        <header class="py-5 bg-light border-bottom mb-4 text-center">
          <div class="container">
            <h1 class="fw-bolder">회원가입</h1>
            <p class="lead mb-0">GO-MONTH와 함께 여행을 시작하세요</p>
          </div>
        </header>

        <div class="container">
          <div class="row justify-content-center">

            <div class="col-lg-6">
              <div class="card mb-5">
                <div class="card-body">

                  <form>
                    <div class="mb-3">
                      <label class="form-label">아이디</label>
                      <input type="text" class="form-control" placeholder="아이디 입력">
                    </div>

                    <div class="mb-3">
                      <label class="form-label">비밀번호</label>
                      <input type="password" class="form-control" placeholder="비밀번호 입력">
                    </div>

                    <div class="mb-3">
                      <label class="form-label">비밀번호 확인</label>
                      <input type="password" class="form-control" placeholder="비밀번호 확인">
                    </div>

                    <div class="mb-3">
                      <label class="form-label">이메일</label>
                      <input type="email" class="form-control" placeholder="이메일 입력">
                    </div>

                    <div class="d-grid mb-3">
                      <button type="submit" class="btn btn-primary">회원가입</button>
                    </div>

                    <p class="small text-muted mb-0">
                      ※ 회원가입 기능은 추후 DB 연동을 통해 구현 예정입니다.
                    </p>
                  </form>

                  <hr>

                  <div class="text-center">
                    <a href="<%=cpath%>/login">이미 계정이 있으신가요? 로그인</a>
                  </div>

                </div>
              </div>
            </div>

          </div>
        </div>

        <%@ include file="footer.jsp" %>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>