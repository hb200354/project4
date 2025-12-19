<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>GO-MONTH | 메인</title>
  <link rel="stylesheet" href="css/styles.css" />
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header.jsp" />

<main class="container my-5">
  <!-- 기존 index.html 내용 그대로 옮김 -->
  <section class="text-center">
    <h1 class="fw-bold">4계절 여행</h1>
    <p>월별·계절별 여행지를 한눈에</p>
  </section>

  <section class="row text-center mt-5">
    <div class="col">
      <a href="spring.jsp">봄 여행</a>
    </div>
    <div class="col">
      <a href="summer.jsp">여름 여행</a>
    </div>
    <div class="col">
      <a href="fall.jsp">가을 여행</a>
    </div>
    <div class="col">
      <a href="winter.jsp">겨울 여행</a>
    </div>
  </section>
</main>

<jsp:include page="/WEB-INF/jsp/footer.jsp" />

<script src="js/scripts.js"></script>
</body>
</html>