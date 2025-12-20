<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="UTF-8"/> 
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
    <title>가을 여행지 - 4계절 여행</title>

	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- 공통 CSS -->
	<link href="${path}/css/styles.css" rel="stylesheet">

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.html">🍁 4계절 여행</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		        <li class="nav-item"><a class="nav-link" href="${path}/spring">봄</a></li>
		        <li class="nav-item"><a class="nav-link" href="${path}/summer">여름</a></li>
		        <li class="nav-item"><a class="nav-link" href="${path}/fall">가을</a></li>
		        <li class="nav-item"><a class="nav-link active" href="${path}/winter">겨울</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Header -->
<header class="py-5 bg-light border-bottom mb-4">
    <div class="container">
        <div class="text-center my-5">
            <h1 class="fw-bolder">겨울에 떠나기 좋은 여행지</h1>
            <p class="lead mb-0">
                눈꽃과 온천이 있어 가장 신나는 계절 (12~1월)
            </p>
        </div>
    </div>
</header>

<!-- Page content -->
<div class="container">
    <div class="row">

        <!-- Travel entries -->
        <div class="col-lg-8">

            <!-- Featured travel -->
            <div class="card mb-4">
                <a href="#"><img class="card-img-top" src="${path}/imgs/winter-main.jpg" alt="겨울 여행 메인" /></a>
                <div class="card-body">
                    <div class="small text-muted">AUTUMN PICK</div>
                    <h2 class="card-title">서울 강서 한강공원</h2>
                    <p class="card-text">
                        강서구에 위치한 강서한강공원.
                        겨울철 철새 도래지라 망원경으로 다양한 새들을 관찰할 수 있답니다.
                    </p>
                    <a class="btn btn-primary" href="#">자세히 보기 →</a>
                </div>
            </div>

            <!-- Travel list -->
            <div class="row">
                <div class="col-lg-6">

                    <div class="card mb-4">
                        <a href="#"><img class="card-img-top" src="${path}/imgs/winter1.jpg" alt="겨울 여행지" /></a>
                        <div class="card-body">
                            <div class="small text-muted">해운대</div>
                            <h2 class="card-title h4">부산 해운대 빛축제</h2>
                            <p class="card-text">
                                부산 해운대 해수욕장 바로 앞에서
                                열리고 있는 해운대 빛축제.
                            </p>
                            <a class="btn btn-primary" href="#">자세히 보기 →</a>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <a href="#"><img class="card-img-top" src="${path}/imgs/winter2.jpg" alt="겨울 여행지" /></a>
                        <div class="card-body">
                            <div class="small text-muted">감성 여행</div>
                            <h2 class="card-title h4">파주 퍼스트가든</h2>
                            <p class="card-text">
                                밤에는 퍼스트가든의 곳곳이 전구옷을 입고
                                화려하게 어둠을 밝혀주고 있었어요.
                            </p>
                            <a class="btn btn-primary" href="#">자세히 보기 →</a>
                        </div>
                    </div>

                </div>

                <div class="col-lg-6">

                    <div class="card mb-4">
                        <a href="#"><img class="card-img-top" src="${path}/imgs/winter3.jpg" alt="겨울 여행지" /></a>
                        <div class="card-body">
                            <div class="small text-muted">월미도</div>
                            <h2 class="card-title h4">인천 월미도</h2>
                            <p class="card-text">
                                월미도 먹자골목으로 가면 상당한 호객 행위와 함께
                                그안에서도 해산물 맛집들이 쭈르륵 ~ 있어요.
                            </p>
                            <a class="btn btn-primary" href="#">자세히 보기 →</a>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <a href="#"><img class="card-img-top" src="${path}/imgs/winter4.jpg" alt="겨울 여행지" /></a>
                        <div class="card-body">
                            <div class="small text-muted">힐링 여행</div>
                            <h2 class="card-title h4">강원도 삼척의 맹방해변 !</h2>
                            <p class="card-text">
                                겨울 바다에는 사람도 많이 없는데
                                찬바람 맞으면서 물멍 때리니 힐링 그잡채..💙
                            </p>
                            <a class="btn btn-primary" href="#">자세히 보기 →</a>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Pagination -->
            <nav aria-label="Pagination">
                <hr class="my-0" />
                <ul class="pagination justify-content-center my-4">
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                </ul>
            </nav>

        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">

            <!-- Search -->
            <div class="card mb-4">
                <div class="card-header">여행지 검색</div>
                <div class="card-body">
                    <div class="input-group">
                        <input class="form-control" type="text" placeholder="여행지 검색" />
                        <button class="btn btn-primary" type="button">검색</button>
                    </div>
                </div>
            </div>

            <!-- Categories -->
            <div class="card mb-4">
                <div class="card-header">가을 여행 테마</div>
                <div class="card-body">
                    <ul class="list-unstyled mb-0">
                        <li><a href="#">🍂 단풍 명소</a></li>
                        <li><a href="#">🥾 트레킹</a></li>
                        <li><a href="#">📸 감성 사진</a></li>
                        <li><a href="#">☕ 가을 카페</a></li>
                    </ul>
                </div>
            </div>

            <!-- Side widget -->
            <div class="card mb-4">
                <div class="card-header">가을 여행 한 줄 팁</div>
                <div class="card-body">
                    가을 여행은 아침·저녁 기온 차가 크니
                    얇은 겉옷을 꼭 챙기세요.
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">
            Copyright © 4계절 여행 2025
        </p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
