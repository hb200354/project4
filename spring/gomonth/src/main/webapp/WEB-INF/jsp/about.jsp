<%@ page contentType="text/html; charset=UTF-8" %>
<% String cpath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>소개 | GO-MONTH</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-white">
    <%@ include file="header.jsp" %>
    <%@ include file="nav.jsp" %>

    <header class="about-hero" style="background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('<%=cpath%>/assets/images/fall-main.jpg') no-repeat center center / cover;">
        <div class="container h-100 d-flex align-items-center justify-content-center text-center">
            <div class="text-white">
                <span class="badge bg-primary mb-3 px-3 py-2">OUR STORY</span>
                <h1 class="display-2 fw-800 mb-4">가장 아름다운 순간을<br>당신에게 선물합니다.</h1>
                <p class="lead opacity-75">GO-MONTH는 열두 달, 계절의 변화를 가장 잘 느낄 수 있는<br>최적의 여행지를 큐레이션합니다.</p>
            </div>
        </div>
    </header>

    <section class="py-100">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-lg-8 mx-auto">
                    <h2 class="fw-bold mb-4">왜 GO-MONTH인가요?</h2>
                    <p class="text-muted">우리는 단순히 장소를 알려주는 것을 넘어,<br>그 계절에만 느낄 수 있는 공기와 색감을 전달하고자 합니다.</p>
                </div>
            </div>

            <div class="row g-4 mt-2">
                <div class="col-md-4">
                    <div class="value-card p-5 text-center shadow-sm">
                        <div class="value-icon mb-4"><i class="fas fa-calendar-check text-primary fa-3x"></i></div>
                        <h4 class="fw-bold mb-3">정교한 큐레이션</h4>
                        <p class="text-muted small mb-0">빅데이터와 전문가의 안목으로 매달 가장 매력적인 여행지 5곳을 선정합니다.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="value-card p-5 text-center shadow-sm border-primary border-top border-4">
                        <div class="value-icon mb-4"><i class="fas fa-camera-retro text-primary fa-3x"></i></div>
                        <h4 class="fw-bold mb-3">시각적 영감</h4>
                        <p class="text-muted small mb-0">고화질 비주얼 콘텐츠를 통해 여행지에 가기 전 미리 설레는 경험을 제공합니다.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="value-card p-5 text-center shadow-sm">
                        <div class="value-icon mb-4"><i class="fas fa-map-marked-alt text-primary fa-3x"></i></div>
                        <h4 class="fw-bold mb-3">최적의 타이밍</h4>
                        <p class="text-muted small mb-0">꽃이 피고, 단풍이 드는 찰나의 순간을 놓치지 않도록 정확한 정보를 제공합니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="py-5 bg-light">
        <div class="container text-center py-5">
            <h3 class="fw-bold mb-4">지금, 당신의 계절을 찾아보세요.</h3>
            <div class="d-flex justify-content-center gap-3">
                <a href="<%=cpath%>/spring.jsp" class="btn btn-primary px-5 py-3 fw-bold shadow">여행지 보러가기</a>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>