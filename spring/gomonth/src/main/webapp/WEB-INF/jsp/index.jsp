<%@ page contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <title>GO-MONTH</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">
  </head>

  <body>

      <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>


      <!-- 메인 배너 -->
      <section class="py-5 bg-light text-center">
        <div class="container">
          <h1 class="fw-bold mb-3">월과 계절로 떠나는 여행</h1>
          <p class="lead mb-4">
            지금 떠나기 가장 좋은 여행지를 GO-MONTH에서 만나보세요
          </p>
          <a href="<%=request.getContextPath()%>/about" class="btn btn-primary btn-lg">
            GO-MONTH 소개 →
          </a>
        </div>
      </section>

      <!-- 시즌 카드 -->
      <section class="py-5">
        <div class="container">
          <h2 class="fw-bold text-center mb-4">계절별 여행지</h2>

          <div class="row g-4">
            <div class="col-md-3">
              <div class="card h-100 text-center">
                <img src="<%=request.getContextPath()%>/assets/images/spring1.png" class="card-img-top">
                <div class="card-body">
                  <h5>봄</h5>
                  <p>꽃과 산책</p>
                  <a href="<%=request.getContextPath()%>/spring" class="btn btn-outline-primary btn-sm">보러가기</a>
                </div>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card h-100 text-center">
                <img src="<%=request.getContextPath()%>/assets/images/summer1.jpg" class="card-img-top">
                <div class="card-body">
                  <h5>여름</h5>
                  <p>바다와 휴양</p>
                  <a href="<%=request.getContextPath()%>/summer" class="btn btn-outline-primary btn-sm">보러가기</a>
                </div>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card h-100 text-center">
                <img src="<%=request.getContextPath()%>/assets/images/fall-main.jpg" class="card-img-top">
                <div class="card-body">
                  <h5>가을</h5>
                  <p>단풍과 감성</p>
                  <a href="<%=request.getContextPath()%>/fall" class="btn btn-outline-primary btn-sm">보러가기</a>
                </div>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card h-100 text-center">
                <img src="<%=request.getContextPath()%>/assets/images/winter5.jpg" class="card-img-top">
                <div class="card-body">
                  <h5>겨울</h5>
                  <p>눈꽃과 힐링</p>
                  <a href="<%=request.getContextPath()%>/winter" class="btn btn-outline-primary btn-sm">보러가기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <%@ include file="footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>

  </html>