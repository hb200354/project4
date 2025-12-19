<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>겨울 여행지 | GO-MONTH</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header.jsp" />

<header class="py-5 bg-light border-bottom mb-4">
  <div class="container text-center my-5">
    <h1 class="fw-bolder">겨울에 떠나기 좋은 여행지</h1>
    <p class="lead mb-0">눈과 온천, 낭만 가득한 겨울 여행 (12~2월)</p>
  </div>
</header>

<section class="py-4">
  <div class="container d-flex gap-2">
    <button class="btn btn-dark btn-month" data-month="12">12월</button>
    <button class="btn btn-outline-dark btn-month" data-month="1">1월</button>
    <button class="btn btn-outline-dark btn-month" data-month="2">2월</button>
  </div>
</section>

<div class="container">
  <div class="row">

    <div class="col-lg-8">
      <div class="card mb-4">
        <img class="card-img-top" src="assets/images/winter1.jpg" alt="겨울 대표 여행지" />
        <div class="card-body">
          <div class="small text-muted">WINTER PICK</div>
          <h2 class="card-title">겨울 대표 여행지</h2>
          <p class="card-text">겨울 시즌 추천 여행지를 준비 중입니다.</p>
          <a class="btn btn-primary" href="detail.jsp?id=31">자세히 보기 →</a>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-6">
          <div class="card mb-4">
            <img class="card-img-top" src="assets/images/winter2.jpg" alt="" />
            <div class="card-body">
              <div class="small text-muted">겨울 테마</div>
              <h2 class="card-title h4">여행지 준비 중</h2>
              <p class="card-text">곧 업데이트될 예정입니다.</p>
              <a class="btn btn-primary" href="detail.jsp?id=32">자세히 보기 →</a>
            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card mb-4">
            <img class="card-img-top" src="assets/images/winter3.jpg" alt="" />
            <div class="card-body">
              <div class="small text-muted">겨울 테마</div>
              <h2 class="card-title h4">여행지 준비 중</h2>
              <p class="card-text">곧 업데이트될 예정입니다.</p>
              <a class="btn btn-primary" href="detail.jsp?id=33">자세히 보기 →</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-lg-4">
      <div class="card mb-4">
        <div class="card-header">여행지 검색</div>
        <div class="card-body">
          <div class="input-group">
            <input class="form-control" type="text" placeholder="여행지 검색" />
            <button class="btn btn-primary">검색</button>
          </div>
        </div>
      </div>

      <div class="card mb-4">
        <div class="card-header">겨울 여행 테마</div>
        <div class="card-body">
          <ul class="list-unstyled mb-0">
            <li>❄ 눈 여행</li>
            <li>♨ 온천</li>
            <li>🎿 스키</li>
            <li>🏔 설경</li>
          </ul>
        </div>
      </div>
    </div>

  </div>
</div>

<jsp:include page="/WEB-INF/jsp/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
