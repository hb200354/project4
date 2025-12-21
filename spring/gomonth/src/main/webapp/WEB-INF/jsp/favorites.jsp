<%@ page contentType="text/html; charset=UTF-8" %>
  <% String cpath=request.getContextPath(); %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
      <meta charset="UTF-8">
      <title>찜 목록 | GO-MONTH</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">

      <!-- Bootstrap -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

      <!-- 공통 CSS -->
      <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    </head>

    <body>

      <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>


        <!-- =======================
 페이지 헤더
======================= -->
        <header class="py-5 bg-light border-bottom mb-4 text-center">
          <div class="container">
            <h1 class="fw-bolder">찜 목록</h1>
            <p class="lead mb-0">내가 저장한 여행지를 한눈에 확인하세요</p>
          </div>
        </header>

        <div class="container">
          <div class="row">

            <!-- ===================
     찜 리스트
    =================== -->
            <div class="col-lg-8">

              <div class="card mb-4">
                <div class="card-header d-flex justify-content-between">
                  <span>내 찜 목록</span>
                  <span class="small text-muted">총 3개</span>
                </div>

                <div class="card-body">

                  <!-- item -->
                  <div class="d-flex align-items-center justify-content-between border rounded p-2 mb-3">
                    <div class="d-flex align-items-center gap-3">
                      <img src="<%=cpath%>/assets/images/summer1.jpg"
                        style="width:90px;height:60px;object-fit:cover;border-radius:8px;">
                      <div>
                        <div class="fw-bold">부산 해운대</div>
                        <div class="small text-muted">여름 대표 해변</div>
                      </div>
                    </div>
                    <div class="d-flex gap-2">
                      <a href="<%=cpath%>/detail?id=haeundae" class="btn btn-primary btn-sm">상세보기</a>
                      <button class="btn btn-danger btn-sm">삭제</button>
                    </div>
                  </div>

                  <div class="d-flex align-items-center justify-content-between border rounded p-2 mb-3">
                    <div class="d-flex align-items-center gap-3">
                      <img src="<%=cpath%>/assets/images/fall-main.jpg"
                        style="width:90px;height:60px;object-fit:cover;border-radius:8px;">
                      <div>
                        <div class="fw-bold">내장산 국립공원</div>
                        <div class="small text-muted">가을 단풍 명소</div>
                      </div>
                    </div>
                    <div class="d-flex gap-2">
                      <a href="<%=cpath%>/detail?id=naejangsan" class="btn btn-primary btn-sm">상세보기</a>
                      <button class="btn btn-danger btn-sm">삭제</button>
                    </div>
                  </div>

                  <div class="d-flex align-items-center justify-content-between border rounded p-2">
                    <div class="d-flex align-items-center gap-3">
                      <img src="<%=cpath%>/assets/images/winter5.jpg"
                        style="width:90px;height:60px;object-fit:cover;border-radius:8px;">
                      <div>
                        <div class="fw-bold">한라산 설경</div>
                        <div class="small text-muted">겨울 설산 트레킹</div>
                      </div>
                    </div>
                    <div class="d-flex gap-2">
                      <a href="<%=cpath%>/detail?id=hallasan" class="btn btn-primary btn-sm">상세보기</a>
                      <button class="btn btn-danger btn-sm">삭제</button>
                    </div>
                  </div>

                  <p class="small text-muted mt-3 mb-0">
                    ※ 찜 기능은 로그인 및 DB 연동 후 활성화될 예정입니다.
                  </p>

                </div>
              </div>

            </div>

            <!-- ===================
     사이드
    =================== -->
            <div class="col-lg-4">

              <div class="card mb-4">
                <div class="card-header">바로가기</div>
                <div class="card-body d-grid gap-2">
                  <a class="btn btn-primary" href="<%=cpath%>/spring">봄 여행지</a>
                  <a class="btn btn-outline-secondary" href="<%=cpath%>/inquiry">문의하기</a>
                </div>
              </div>

              <div class="card mb-4">
                <div class="card-header">안내</div>
                <div class="card-body">
                  <ul class="mb-0">
                    <li>찜 목록은 로그인 후 이용 가능합니다.</li>
                    <li>삭제 기능은 추후 구현 예정입니다.</li>
                  </ul>
                </div>
              </div>

            </div>

          </div>
        </div>

        <%@ include file="footer.jsp" %>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>