<%@ page contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <title>여름 여행지 | GO-MONTH</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- 공통 CSS -->
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">
  </head>

  <body data-context-path="<%=request.getContextPath()%>">

      <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>


      <header class="py-5 bg-light border-bottom mb-4">
        <div class="container text-center my-5">
          <h1 class="fw-bolder">여름에 떠나기 좋은 여행지</h1>
          <p class="lead mb-0">바다와 계곡이 있는 시원한 여름 여행 (6~8월)</p>
        </div>
      </header>

      <section class="py-4">
        <div class="container d-flex gap-2">
          <button class="btn btn-dark btn-month" data-month="6">6월</button>
          <button class="btn btn-outline-dark btn-month" data-month="7">7월</button>
          <button class="btn btn-outline-dark btn-month" data-month="8">8월</button>
        </div>
      </section>

      <div class="container">
        <div class="row">

          <div class="col-lg-8">
            <div class="card mb-4">
              <img id="featuredImg" class="card-img-top featured-img">
              <div class="card-body">
                <div class="small text-muted">SUMMER PICK</div>
                <h2 id="featuredTitle"></h2>
                <p id="featuredDesc"></p>
                <a id="featuredLink" class="btn btn-primary btn-sm">자세히 보기 →</a>
              </div>
            </div>

            <div class="row" id="placeList"></div>
          </div>

          <div class="col-lg-4">
            <div class="card mb-4">
              <div class="card-header">여행지 검색</div>
              <div class="card-body">
                <input id="searchInput" class="form-control mb-2" placeholder="여행지 검색">
                <button id="searchBtn" class="btn btn-primary w-100">검색</button>
              </div>
            </div>

            <div class="card mb-4">
              <div class="card-header">여름 여행 테마</div>
              <div class="card-body">
                <ul class="list-unstyled mb-0">
                  <li>🏖 바다</li>
                  <li>🌊 계곡</li>
                  <li>🌙 야경</li>
                  <li>🌿 휴양</li>
                </ul>
              </div>
            </div>

            <div class="card mb-4">
              <div class="card-header">여름 여행 한 줄 팁</div>
              <div class="card-body" id="tipBox"></div>
            </div>
          </div>

        </div>
      </div>

      <%@ include file="footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/summer.js"></script>

  </body>

  </html>