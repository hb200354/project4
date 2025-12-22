<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>봄 여행지 | GO-MONTH</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body data-context-path="<%=request.getContextPath()%>">

    <header class="season-hero-banner" style="background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('<%=request.getContextPath()%>/assets/images/spring-main.jpg') no-repeat center center / cover;">
      <%@ include file="header.jsp" %>   
      <%@ include file="nav.jsp" %>
        <div class="container hero-content-wrapper text-center py-5">
            <h1 class="display-3 fw-bold text-white">Spring in GO-MONTH</h1>
            <p class="lead text-white">꽃향기와 설레는 산책, 봄 여행지의 모든 것</p>
        </div>
    </header>

    <div class="container py-5">
        <div class="d-flex justify-content-center gap-3 mb-5">
            <button class="btn btn-month active" data-month="3">3월</button>
            <button class="btn btn-month" data-month="4">4월</button>
            <button class="btn btn-month" data-month="5">5월</button>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div id="featuredPlace" class="card border-0 shadow-sm mb-5 overflow-hidden" style="border-radius: 20px;">
                    <img id="featuredImg" class="card-img-top" style="height: 450px; object-fit: cover;">
                    <div class="card-body p-4">
                        <span class="badge bg-primary mb-2">SPRING PICK</span>
                        <h2 id="featuredTitle" class="fw-bold mb-3"></h2>
                        <p id="featuredDesc" class="text-muted mb-4"></p>
                        <a id="featuredLink" href="#" class="btn btn-primary px-4">자세히 보기 <i class="fas fa-chevron-right ms-1"></i></a>
                    </div>
                </div>
                
                <div class="row g-4" id="placeList">
                    </div>
            </div>

            <div class="col-lg-4">
                <div class="card border-0 shadow-sm p-4 mb-4" style="border-radius: 20px;">
                    <h5 class="fw-bold mb-3">여행지 검색</h5>
                    <div class="input-group">
                        <input id="searchInput" class="form-control" placeholder="어디로 떠날까요?">
                        <button id="searchBtn" class="btn btn-primary">검색</button>
                    </div>
                </div>

                <div class="card border-0 shadow-sm p-4" style="border-radius: 20px; background: #fdfdfd;">
                    <h5 class="fw-bold mb-3">봄 여행 테마</h5>
                    <div class="d-flex flex-wrap gap-2">
                        <span class="badge bg-light text-dark p-2 px-3 border">🌸 벚꽃</span>
                        <span class="badge bg-light text-dark p-2 px-3 border">🌿 자연</span>
                        <span class="badge bg-light text-dark p-2 px-3 border">📸 감성사진</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script src="<%=request.getContextPath()%>/js/spring.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>