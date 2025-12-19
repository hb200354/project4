<%@ page contentType="text/html; charset=UTF-8" %>
  <% String ctx=request.getContextPath(); %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <title>가을 여행 | GO-MONTH</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Bootstrap CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

      <!-- 공통 CSS -->
      <link rel="stylesheet" href="<%= ctx %>/css/styles.css">
    </head>

    <body>

      <!-- ===== HEADER ===== -->
      <jsp:include page="/WEB-INF/jsp/header.jsp" />

      <!-- ===== 페이지 타이틀 ===== -->
      <section class="py-5 bg-light">
        <div class="container text-center">
          <h1 class="fw-bold">가을 여행</h1>
          <p class="mt-2">9월 · 10월 · 11월에 떠나기 좋은 여행지</p>
        </div>
      </section>

      <!-- ===== 월 선택 버튼 ===== -->
      <section class="py-4">
        <div class="container text-center">
          <div class="btn-group">
            <button class="btn btn-outline-dark">9월</button>
            <button class="btn btn-outline-dark">10월</button>
            <button class="btn btn-outline-dark">11월</button>
          </div>
        </div>
      </section>

      <!-- ===== 여행지 카드 ===== -->
      <section class="py-5">
        <div class="container">
          <div class="row g-4">

            <!-- 카드 1 -->
            <div class="col-md-4">
              <div class="card h-100 text-center">
                <img src="<%= ctx %>/assets/images/placeholder.jpg" class="card-img-top" alt="가을 여행지">
                <div class="card-body">
                  <h5 class="card-title">가을 여행지 1</h5>
                  <p class="card-text">
                    단풍이 아름다운 가을 추천 여행지입니다.
                  </p>
                  <a href="<%= ctx %>/detail.jsp?id=21" class="btn btn-primary">
                    자세히 보기 →
                  </a>
                </div>
              </div>
            </div>

            <!-- 카드 2 -->
            <div class="col-md-4">
              <div class="card h-100 text-center">
                <img src="<%= ctx %>/assets/images/placeholder.jpg" class="card-img-top" alt="가을 여행지">
                <div class="card-body">
                  <h5 class="card-title">가을 여행지 2</h5>
                  <p class="card-text">
                    가을 분위기를 느낄 수 있는 여행지입니다.
                  </p>
                  <a href="<%= ctx %>/detail.jsp?id=22" class="btn btn-primary">
                    자세히 보기 →
                  </a>
                </div>
              </div>
            </div>

            <!-- 카드 3 -->
            <div class="col-md-4">
              <div class="card h-100 text-center">
                <img src="<%= ctx %>/assets/images/placeholder.jpg" class="card-img-top" alt="가을 여행지">
                <div class="card-body">
                  <h5 class="card-title">가을 여행지 3</h5>
                  <p class="card-text">
                    사진 찍기 좋은 가을 명소입니다.
                  </p>
                  <a href="<%= ctx %>/detail.jsp?id=23" class="btn btn-primary">
                    자세히 보기 →
                  </a>
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