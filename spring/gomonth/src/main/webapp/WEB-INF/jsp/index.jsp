<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>GO-MONTH | 계절별 여행 추천</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>

<header class="main-hero-banner" style="background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.5)), url('<%=request.getContextPath()%>/assets/images/main-banner.jpg') no-repeat center center / cover;">
    <%@ include file="header.jsp" %>
    <%@ include file="nav.jsp" %>

    <div class="container hero-content-wrapper">
      <h1 class="display-3 fw-bold text-white">월과 계절로 떠나는 여행</h1>
      <p class="lead mb-4 text-white">지금 떠나기 가장 좋은 여행지를 GO-MONTH에서 만나보세요</p>
      <a href="<%=request.getContextPath()%>/about" class="btn btn-primary btn-lg px-5">
        GO-MONTH 소개 <i class="fas fa-arrow-right ms-2"></i>
      </a>
    </div>
</header>

  <section class="py-5 bg-white">
    <div class="container py-4">
      <h2 class="fw-bold text-center mb-5">계절별 여행지</h2>
      <div class="row g-4">
        <div class="col-sm-6 col-lg-3">
          <div class="season-card">
            <img src="<%=request.getContextPath()%>/assets/images/spring-main.jpg" class="card-img" alt="봄">
            <div class="card-overlay">
              <h5>봄</h5>
              <p>꽃향기와 설레는 산책</p>
              <a href="<%=request.getContextPath()%>/spring" class="btn btn-overlay-view">보러가기</a>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-lg-3">
          <div class="season-card">
            <img src="<%=request.getContextPath()%>/assets/images/summer-main.jpg" class="card-img" alt="여름">
            <div class="card-overlay">
              <h5>여름</h5>
              <p>푸른 바다와 시원한 휴양</p>
              <a href="<%=request.getContextPath()%>/summer" class="btn btn-overlay-view">보러가기</a>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-lg-3">
          <div class="season-card">
            <img src="<%=request.getContextPath()%>/assets/images/fall-main.jpg" class="card-img" alt="가을">
            <div class="card-overlay">
              <h5>가을</h5>
              <p>단풍이 물든 감성 여행</p>
              <a href="<%=request.getContextPath()%>/fall" class="btn btn-overlay-view">보러가기</a>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-lg-3">
          <div class="season-card">
            <img src="<%=request.getContextPath()%>/assets/images/winter-main.jpg" class="card-img" alt="겨울">
            <div class="card-overlay">
              <h5>겨울</h5>
              <p>하얀 눈꽃과 따뜻한 힐링</p>
              <a href="<%=request.getContextPath()%>/winter" class="btn btn-overlay-view">보러가기</a>
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