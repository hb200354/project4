<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>찜 목록 | GO-MONTH</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header.jsp" />

<div class="container my-5">
  <h1 class="fw-bold mb-4">찜 목록</h1>

  <p class="text-muted">아직 찜한 여행지가 없습니다.</p>

  <!-- DB 연동 후 찜 목록 반복 출력 예정 -->
  <!--
  <div class="row">
    <div class="col-md-4">
      <div class="card mb-4">
        <img class="card-img-top" src="assets/images/sample.jpg" />
        <div class="card-body">
          <h5 class="card-title">여행지 이름</h5>
          <a href="detail.jsp?id=1" class="btn btn-primary btn-sm">자세히 보기</a>
        </div>
      </div>
    </div>
  </div>
  -->
</div>

<jsp:include page="/WEB-INF/jsp/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
