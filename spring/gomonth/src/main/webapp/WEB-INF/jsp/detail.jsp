<%@ page contentType="text/html; charset=UTF-8" %>
<% 
    String cpath = request.getContextPath(); 
    String id = request.getParameter("id"); 
    // 실제 프로젝트에서는 DB에서 id로 제목/설명을 가져오겠지만, 
    // 현재는 파라미터로 받은 id를 활용해 디자인을 잡습니다.
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행지 상세 | GO-MONTH</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <%@ include file="header.jsp" %>
    <%@ include file="nav.jsp" %>

    <div class="detail-hero" style="background: linear-gradient(rgba(0,0,0,0.2), rgba(0,0,0,0.5)), url('<%=cpath%>/assets/images/<%=id%>.jpg') no-repeat center center / cover;">
        <div class="container h-100 d-flex align-items-end pb-5">
            <div class="text-white mb-4">
                <span class="badge bg-primary mb-3 px-3 py-2" style="border-radius: 50px;">RECOMMENDED</span>
                <h1 class="display-3 fw-bold mb-2 text-uppercase"><%=id.replace("-", " ")%></h1>
                <p class="lead shadow-text"><i class="fas fa-map-marker-alt me-2"></i> 대한민국, 이달의 추천 여행지</p>
            </div>
        </div>
    </div>

    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-8">
                <div class="bg-white p-5 shadow-sm mb-4" style="border-radius: 25px;">
                    <h3 class="fw-bold mb-4 border-start border-primary border-4 ps-3">여행지 소개</h3>
                    <p class="text-muted leading-relaxed mb-4" style="line-height: 1.8;">
                        GO-MONTH가 엄선한 이번 달 최고의 명소입니다. 이곳은 자연의 아름다움과 도심의 편의성이 어우러져 
                        많은 여행객들에게 사랑받는 곳입니다. 계절마다 다른 얼굴을 보여주는 이곳에서 잊지 못할 추억을 만들어보세요.
                    </p>
                    <div class="row g-3 mt-4">
                        <div class="col-md-6">
                            <img src="<%=cpath%>/assets/images/spring-main.jpg" class="img-fluid rounded-4 shadow-sm" alt="sub1">
                        </div>
                        <div class="col-md-6">
                            <img src="<%=cpath%>/assets/images/summer-main.jpg" class="img-fluid rounded-4 shadow-sm" alt="sub2">
                        </div>
                    </div>
                </div>

                <div class="bg-white p-5 shadow-sm" style="border-radius: 25px;">
                    <h4 class="fw-bold mb-4">주요 포인트</h4>
                    <div class="d-flex mb-3">
                        <div class="icon-box me-3"><i class="fas fa-check-circle text-primary"></i></div>
                        <div>
                            <h6 class="fw-bold mb-1">인생샷 명소</h6>
                            <p class="small text-muted">어디서 찍어도 화보가 되는 포토존이 가득합니다.</p>
                        </div>
                    </div>
                    <div class="d-flex mb-3">
                        <div class="icon-box me-3"><i class="fas fa-check-circle text-primary"></i></div>
                        <div>
                            <h6 class="fw-bold mb-1">여유로운 산책로</h6>
                            <p class="small text-muted">복잡한 일상을 벗어나 힐링할 수 있는 코스입니다.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="sticky-top" style="top: 100px;">
                    <div class="card border-0 shadow-sm p-4 mb-4" style="border-radius: 25px;">
                        <h5 class="fw-bold mb-4">Travel Info</h5>
                        <ul class="list-unstyled">
                            <li class="d-flex justify-content-between mb-3 pb-3 border-bottom">
                                <span class="text-muted"><i class="far fa-calendar-alt me-2"></i>추천 시기</span>
                                <span class="fw-bold">이달의 추천</span>
                            </li>
                            <li class="d-flex justify-content-between mb-3 pb-3 border-bottom">
                                <span class="text-muted"><i class="fas fa-walking me-2"></i>난이도</span>
                                <span class="fw-bold text-success">쉬움</span>
                            </li>
                            <li class="d-flex justify-content-between">
                                <span class="text-muted"><i class="fas fa-clock me-2"></i>소요 시간</span>
                                <span class="fw-bold">약 2~3시간</span>
                            </li>
                        </ul>
                        <div class="d-grid gap-2 mt-4">
                            <button class="btn btn-primary py-3 fw-bold" style="border-radius: 15px;">
                                <i class="far fa-heart me-2"></i> 내 여행지에 저장
                            </button>
                            <a href="javascript:history.back()" class="btn btn-outline-secondary py-3" style="border-radius: 15px;">
                                돌아가기
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>