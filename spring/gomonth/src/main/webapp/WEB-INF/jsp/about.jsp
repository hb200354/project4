<%@ page contentType="text/html; charset=UTF-8" %>
<% String cpath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>소개 | GO-MONTH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-white">
    <%@ include file="header.jsp" %>
    <%@ include file="nav.jsp" %>

    <header class="about-hero" style="background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('<%=cpath%>/assets/images/fall-main.jpg') no-repeat center center / cover;">
        <div class="container h-100 d-flex align-items-center justify-content-center text-center text-white">
            <div>
                <h1 class="display-3 fw-800 mb-3">GO-MONTH</h1>
                <p class="lead">열두 달, 계절의 변화를 가장 잘 느낄 수 있는<br>최적의 여행지를 제안하는 서비스입니다.</p>
            </div>
        </div>
    </header>

    <section class="py-5 mt-5">
        <div class="container">
            <h2 class="text-center fw-bold mb-5">Key Features</h2>
            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="value-card p-4 shadow-sm h-100 text-center">
                        <i class="fas fa-calendar-alt text-primary mb-3 fa-2x"></i>
                        <h5 class="fw-bold">월별 추천</h5>
                        <p class="small text-muted">각 달에 최적화된 여행지를 선정하여 추천합니다.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="value-card p-4 shadow-sm h-100 text-center">
                        <i class="fas fa-search text-primary mb-3 fa-2x"></i>
                        <h5 class="fw-bold">여행지 검색</h5>
                        <p class="small text-muted">원하는 장소를 빠르게 찾을 수 있는 검색 기능을 제공합니다.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="value-card p-4 shadow-sm h-100 text-center">
                        <i class="fas fa-info-circle text-primary mb-3 fa-2x"></i>
                        <h5 class="fw-bold">상세 정보</h5>
                        <p class="small text-muted">풍성한 이미지와 설명으로 여행지의 매력을 전합니다.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="value-card p-4 shadow-sm h-100 text-center">
                        <i class="fas fa-heart text-primary mb-3 fa-2x"></i>
                        <h5 class="fw-bold">찜 기능</h5>
                        <p class="small text-muted">나만의 여행 목록을 관리하는 기능을 제공할 예정입니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 bg-light border-top">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-4"><h3 class="fw-bold">Tech Stack</h3></div>
                <div class="col-md-8">
                    <div class="d-flex flex-wrap gap-3">
                        <span class="badge bg-white text-dark border p-2 px-3">HTML5 / CSS3</span>
                        <span class="badge bg-white text-dark border p-2 px-3">JavaScript (ES6+)</span>
                        <span class="badge bg-white text-dark border p-2 px-3">Bootstrap 5.2</span>
                        <span class="badge bg-white text-dark border p-2 px-3">JSP / Servlet</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>