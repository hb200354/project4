<%@ page contentType="text/html; charset=UTF-8" %>
  <% String ctx=request.getContextPath(); %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <title>GO-MONTH</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Bootstrap CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

      <!-- 기존 index.html CSS 그대로 -->
      <link rel="stylesheet" href="<%= ctx %>/css/styles.css">
    </head>

    <body>

      <!-- ===== HEADER (index.html 구조 유지) ===== -->
      <jsp:include page="/WEB-INF/jsp/header.jsp" />

      <!-- ===== 메인 소개 영역 ===== -->
      <section class="py-5">
        <div class="container text-center">
          <h1 class="fw-bold mb-3">4계절 여행</h1>
          <p class="mb-5">월별·계절별 여행지를 한눈에</p>

          <div class="d-flex justify-content-center gap-5">
            <a href="<%= ctx %>/spring.jsp">봄 여행</a>
            <a href="<%= ctx %>/summer.jsp">여름 여행</a>
            <a href="<%= ctx %>/fall.jsp">가을 여행</a>
            <a href="<%= ctx %>/winter.jsp">겨울 여행</a>
          </div>
        </div>
      </section>

      <!-- ===== 배너 / 슬라이더 영역 (HTML 구조 유지) ===== -->
      <section class="py-5">
        <div class="container">
          <div class="border p-5 text-center position-relative">

            <div class="position-absolute start-0 top-50 translate-middle-y fs-3">
              &lt;
            </div>

            <div class="position-absolute end-0 top-50 translate-middle-y fs-3">
              &gt;
            </div>

            <div class="mb-3">
              ● ○ ○
            </div>

          </div>
        </div>
      </section>

      <!-- ===== 사이트 소개 ===== -->
      <section class="py-5 bg-light">
        <div class="container text-center">
          <h2 class="fw-bold mb-3">사이트 소개 요약</h2>
          <p class="mb-4">
            GO-MONTH는 계절별로 가장 어울리는 여행지를 추천하는
            계절 기반 여행 가이드 웹 서비스입니다.
          </p>
          <a href="<%= ctx %>/about.jsp" class="btn btn-primary">
            사이트 소개 자세히 보기 →
          </a>
        </div>
      </section>

      <!-- ===== 인기 여행지 TOP 3 ===== -->
      <section class="py-5">
        <div class="container">
          <h2 class="fw-bold text-center mb-5">인기 여행지 TOP 3</h2>

          <div class="row g-4">

            <div class="col-md-4">
              <div class="card h-100 text-center">
                <img src="<%= ctx %>/assets/images/placeholder.jpg" class="card-img-top">
                <div class="card-body">
                  <h5 class="card-title">여행지 1</h5>
                  <p class="card-text">텍스트를 입력해 주세요.<br>텍스트를 입력해 주세요.</p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card h-100 text-center">
                <img src="<%= ctx %>/assets/images/placeholder.jpg" class="card-img-top">
                <div class="card-body">
                  <h5 class="card-title">여행지 2</h5>
                  <p class="card-text">텍스트를 입력해 주세요.<br>텍스트를 입력해 주세요.</p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card h-100 text-center">
                <img src="<%= ctx %>/assets/images/placeholder.jpg" class="card-img-top">
                <div class="card-body">
                  <h5 class="card-title">여행지 3</h5>
                  <p class="card-text">텍스트를 입력해 주세요.<br>텍스트를 입력해 주세요.</p>
                </div>
              </div>
            </div>

          </div>
        </div>
      </section>

      <!-- ===== FOOTER ===== -->
      <jsp:include page="/WEB-INF/jsp/footer.jsp" />

    </body>

    </html>