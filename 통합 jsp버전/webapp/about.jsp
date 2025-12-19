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

      <!-- 프로젝트 CSS -->
      <link rel="stylesheet" href="<%= ctx %>/css/styles.css">
    </head>

<body>

<jsp:include page="/WEB-INF/jsp/header.jsp" />

<div class="container my-5">
  <h1 class="fw-bold mb-4">GO-MONTH 소개</h1>

  <p>
    <strong>GO-MONTH</strong>는 계절과 월을 기준으로 여행지를 추천하는 웹 서비스입니다.
    지역이나 테마 중심이 아닌, <em>"언제 가기 좋은지"</em>를 기준으로 여행 정보를 제공합니다.
  </p>

  <p>
    사용자는 봄·여름·가을·겨울 페이지에서 월별 여행지를 선택할 수 있으며,
    여행지 상세 페이지를 통해 정보 확인, 찜하기 기능을 이용할 수 있습니다.
  </p>

  <hr class="my-4" />

  <h3 class="fw-bold">주요 기능</h3>
  <ul>
    <li>계절·월별 여행지 큐레이션</li>
    <li>여행지 상세 정보 제공</li>
    <li>찜하기 기능</li>
    <li>검색 및 필터링</li>
  </ul>

  <hr class="my-4" />

  <h3 class="fw-bold">프로젝트 정보</h3>
  <ul>
    <li>프로젝트명: GO-MONTH</li>
    <li>개발 방식: JSP / Servlet / Tomcat</li>
    <li>형태: 팀 프로젝트</li>
  </ul>
</div>

<jsp:include page="/WEB-INF/jsp/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>