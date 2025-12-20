<%@ page contentType="text/html; charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="ko">

  <head>
    <meta charset="UTF-8">
    <title>GO-MONTH 소개</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- 공통 CSS -->
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">
  </head>

  <body>

    <%@ include file="header.jsp" %>

      <!-- =======================
 페이지 헤더
======================= -->
      <header class="py-5 bg-light border-bottom mb-4 text-center">
        <div class="container">
          <h1 class="fw-bolder">GO-MONTH 소개</h1>
          <p class="lead mb-0">
            계절과 월을 기준으로 여행지를 추천하는 큐레이션 서비스
          </p>
        </div>
      </header>

      <!-- =======================
 서비스 개요
======================= -->
      <section class="py-5">
        <div class="container">
          <h2 class="fw-bold mb-3">서비스 개요</h2>
          <p>
            GO-MONTH는 여행 시기를 기준으로 여행지를 추천하는 웹 서비스입니다.
            기존의 지역 중심 여행 서비스와 달리, 사용자가 여행을 떠나기 좋은
            <b>월과 계절</b>을 선택하면 그에 맞는 여행지를 직관적으로 확인할 수 있습니다.
          </p>
        </div>
      </section>

      <!-- =======================
 기획 의도
======================= -->
      <section class="py-5 bg-light">
        <div class="container">
          <h2 class="fw-bold mb-3">기획 의도</h2>
          <ul>
            <li>언제 여행을 가면 좋을지 고민하는 사용자를 위한 서비스</li>
            <li>계절별·월별 여행 정보의 직관적인 제공</li>
            <li>여행 준비 시간을 줄이고 선택을 돕는 큐레이션</li>
          </ul>
        </div>
      </section>

      <!-- =======================
 주요 기능
======================= -->
      <section class="py-5">
        <div class="container">
          <h2 class="fw-bold mb-3">주요 기능</h2>
          <ul>
            <li>봄 / 여름 / 가을 / 겨울 시즌별 여행지 제공</li>
            <li>월별 여행지 필터링</li>
            <li>여행지 상세 정보 제공</li>
            <li>찜 목록 관리</li>
            <li>문의하기 기능</li>
          </ul>
        </div>
      </section>

      <!-- =======================
 기술 스택
======================= -->
      <section class="py-5 bg-light">
        <div class="container">
          <h2 class="fw-bold mb-3">사용 기술</h2>
          <ul>
            <li>Frontend: HTML, CSS, JavaScript, Bootstrap</li>
            <li>Backend: Java, Spring MVC</li>
            <li>View: JSP</li>
            <li>Database: 추후 연동 예정</li>
          </ul>
        </div>
      </section>

      <%@ include file="footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>

  </html>