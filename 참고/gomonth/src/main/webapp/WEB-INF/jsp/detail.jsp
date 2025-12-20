<%@ page contentType="text/html; charset=UTF-8" %>
  <% String cpath=request.getContextPath(); String id=request.getParameter("id"); %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <title>여행지 상세 | GO-MONTH</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Bootstrap -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

      <!-- 공통 CSS -->
      <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    </head>

    <body>

      <%@ include file="header.jsp" %>

        <!-- =======================
 대표 이미지
======================= -->
        <section class="py-5">
          <div class="container">
            <div class="card">
              <img src="<%=cpath%>/assets/images/<%=id%>.jpg" class="card-img-top featured-img" alt="대표 이미지">
            </div>
          </div>
        </section>

        <!-- =======================
 기본 정보
======================= -->
        <section class="pb-4">
          <div class="container">
            <h2 class="fw-bold mb-3">
              <%=id%>
            </h2>
            <ul class="list-unstyled">
              <li>📍 위치: 상세 위치 정보</li>
              <li>🗓 추천 시기: 계절별 추천</li>
            </ul>
          </div>
        </section>

        <hr>

        <!-- =======================
 상세 설명
======================= -->
        <section class="py-4">
          <div class="container">
            <h4 class="fw-bold mb-3">상세 설명</h4>
            <ul>
              <li>GO-MONTH에서 추천하는 여행지입니다.</li>
              <li>계절별로 가장 매력적인 시기에 방문할 수 있습니다.</li>
              <li>자연, 휴식, 관광을 모두 즐길 수 있습니다.</li>
            </ul>
          </div>
        </section>

        <hr>

        <!-- =======================
 하단 버튼
======================= -->
        <section class="py-5">
          <div class="container text-center">
            <div class="d-flex justify-content-center gap-3">
              <a href="<%=cpath%>/favorites" class="btn btn-outline-primary">
                찜하기 ♡
              </a>
              <a href="javascript:history.back()" class="btn btn-dark">
                뒤로가기
              </a>
            </div>
          </div>
        </section>

        <%@ include file="footer.jsp" %>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>