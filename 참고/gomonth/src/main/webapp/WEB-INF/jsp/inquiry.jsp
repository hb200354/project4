<%@ page contentType="text/html; charset=UTF-8" %>
    <% String cpath=request.getContextPath(); %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <title>문의하기 | GO-MONTH</title>
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <!-- Bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- 공통 CSS -->
            <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
        </head>

        <body>

            <%@ include file="header.jsp" %>

                <!-- =======================
 페이지 헤더
======================= -->
                <header class="py-5 bg-light border-bottom mb-4 text-center">
                    <div class="container">
                        <h1 class="fw-bolder">문의하기</h1>
                        <p class="lead mb-0">서비스 이용 중 궁금한 점을 남겨주세요</p>
                    </div>
                </header>

                <div class="container">
                    <div class="row">

                        <!-- ===================
     문의 작성
    =================== -->
                        <div class="col-lg-8">

                            <div class="card mb-4">
                                <div class="card-header">문의 작성</div>
                                <div class="card-body">

                                    <form>
                                        <div class="mb-3">
                                            <label class="form-label">제목</label>
                                            <input type="text" class="form-control" placeholder="문의 제목을 입력하세요">
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">문의 유형</label>
                                            <select class="form-control">
                                                <option>일반 문의</option>
                                                <option>계정/로그인</option>
                                                <option>건의 사항</option>
                                                <option>오류 제보</option>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">문의 내용</label>
                                            <textarea rows="6" class="form-control"
                                                placeholder="문의 내용을 입력하세요"></textarea>
                                        </div>

                                        <button type="submit" class="btn btn-primary">등록</button>
                                        <button type="reset" class="btn btn-secondary">초기화</button>

                                        <p class="small text-muted mt-3 mb-0">
                                            ※ 문의 기능은 추후 DB 연동을 통해 처리될 예정입니다.
                                        </p>
                                    </form>

                                </div>
                            </div>

                            <!-- ===================
       문의 내역 (더미)
      =================== -->
                            <div class="card mb-4">
                                <div class="card-header">내 문의 내역</div>
                                <div class="card-body">

                                    <div class="border rounded p-3 mb-3">
                                        <div class="fw-bold">[계정/로그인] 로그인이 안 됩니다</div>
                                        <div class="small text-muted">2025-12-19</div>
                                        <div class="mt-2">비밀번호 입력 후 로그인 화면에서 멈춥니다.</div>
                                        <div class="mt-2 small"><b>답변:</b> (대기중)</div>
                                    </div>

                                    <div class="border rounded p-3">
                                        <div class="fw-bold">[오류 제보] 봄 페이지 이미지 오류</div>
                                        <div class="small text-muted">2025-12-18</div>
                                        <div class="mt-2">spring 페이지에서 이미지가 보이지 않습니다.</div>
                                        <div class="mt-2 small"><b>답변:</b> 경로 확인 부탁드립니다.</div>
                                    </div>

                                </div>
                            </div>

                        </div>

                        <!-- ===================
     사이드
    =================== -->
                        <div class="col-lg-4">

                            <div class="card mb-4">
                                <div class="card-header">안내</div>
                                <div class="card-body">
                                    <ul class="mb-0">
                                        <li>문의는 로그인 후 이용 가능합니다.</li>
                                        <li>답변은 관리자 확인 후 등록됩니다.</li>
                                        <li>문의 내역은 마이페이지에서 확인 가능합니다.</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="card mb-4">
                                <div class="card-header">바로가기</div>
                                <div class="card-body d-grid gap-2">
                                    <a class="btn btn-primary" href="<%=cpath%>/favorites">내 찜 목록</a>
                                    <a class="btn btn-outline-secondary" href="<%=cpath%>/">메인으로</a>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

                <%@ include file="footer.jsp" %>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>