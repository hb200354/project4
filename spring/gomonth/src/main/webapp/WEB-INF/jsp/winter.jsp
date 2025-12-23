<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cpath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>겨울 여행지 | GO-MONTH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .filter-btn { border-radius: 50px; padding: 10px 35px; border: 1px solid #dee2e6; background: #fff; transition: 0.3s; font-weight: bold; }
        .filter-btn.active { background: #0d6efd !important; color: #fff !important; border-color: #0d6efd !important; }
        .place-card { border-radius: 20px; overflow: hidden; transition: 0.3s; border: none; box-shadow: 0 5px 15px rgba(0,0,0,0.08); }
        .featured-banner { border-radius: 25px; overflow: hidden; background: #fff; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .filter-item { display: none; } /* 기본적으로 숨김 */
    </style>
</head>
<body data-context-path="<%=cpath%>">

    <header class="season-hero-banner" style="background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('<%=cpath%>/assets/images/winter-width.jpg') no-repeat center center / cover;">
      <%@ include file="header.jsp" %>   
      <%@ include file="nav.jsp" %>
        <div class="container hero-content-wrapper text-center">
            <h1 class="display-3 fw-bold text-white">Winter in GO-MONTH</h1>
            <p class="lead text-white">하얀 눈꽃과 따뜻한 온천, 겨울 힐링의 모든 것</p>
        </div>
    </header>

    <div class="container py-5">
        <div class="d-flex justify-content-center gap-3 mb-5" id="monthTabs">
            <button class="filter-btn active" data-m="12" onclick="filterMonth(12, this)">12월</button>
            <button class="filter-btn" data-m="1" onclick="filterMonth(1, this)">1월</button>
            <button class="filter-btn" data-m="2" onclick="filterMonth(2, this)">2월</button>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div id="featuredArea">
                    <c:forEach var="p" items="${winterPlaces}">
                        <c:if test="${p.isFeatured == 'Y'}">
                            <div class="card mb-5 featured-banner filter-item" data-month="${p.monthVal}" data-title="${p.title}">
                                <div class="row g-0">
                                    <div class="col-md-7">
                                        <img src="<%=cpath%>/assets/images/winter/${p.listImg}" class="featured-img">
                                    </div>
                                    <div class="col-md-5 d-flex align-items-center">
                                        <div class="card-body p-4 p-lg-5">
                                            <span class="badge bg-primary mb-3 px-3 py-2">WINTER PICK</span>
                                            <h2 class="fw-bold mb-3">${p.title}</h2>
                                            <p class="text-muted mb-4">${p.seasonNote}</p>
                                            <a href="detail?id=${p.placeId}" class="btn btn-primary btn-lg rounded-pill px-5">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="row g-4" id="placeList">
                    <c:forEach var="p" items="${winterPlaces}">
                        <div class="col-md-6 filter-item" data-month="${p.monthVal}" data-title="${p.title}">
                            <div class="card h-100 place-card">
                                <div class="position-relative">
                                    <img src="<%=cpath%>/assets/images/winter/${p.listImg}" class="card-img-top" style="height: 250px; object-fit: cover;" onerror="this.src='<%=cpath%>/assets/images/default_list.jpg'">
                                    <c:if test="${p.isFeatured == 'Y'}">
                                        <span class="position-absolute top-0 start-0 m-3 badge bg-primary">PICK</span>
                                    </c:if>
                                </div>
                                <div class="card-body p-4 text-center">
                                    <h5 class="fw-bold mb-2">${p.title}</h5>
                                    <p class="text-muted small mb-3"><i class="fa-solid fa-location-dot me-1 text-primary"></i>${p.location}</p>
                                    <div class="d-grid">
                                        <a href="detail?id=${p.placeId}" class="btn btn-outline-primary rounded-pill fw-bold">자세히 보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="noResultMessage" class="text-center py-5 d-none">
                    <i class="fa-solid fa-circle-exclamation fa-3x text-muted mb-3"></i>
                    <p class="text-muted lead">검색 결과가 없습니다.</p>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card border-0 shadow-sm p-4 mb-4" style="border-radius: 20px;">
                    <h5 class="fw-bold mb-3">여행지 검색</h5>
                    <div class="input-group">
                        <input type="text" id="searchInput" class="form-control" placeholder="전체 겨울 여행지 검색">
                        <button class="btn btn-primary" onclick="searchEverywhere()"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                    <small class="text-muted mt-2">다른 월의 장소도 검색 가능합니다.</small>
                </div>
                <div class="card border-0 shadow-sm p-4 mb-4" style="border-radius: 20px; background: #f8f9fa;">
                    <h5 class="fw-bold mb-3">겨울 여행 팁</h5>
                    <p id="tipBox" class="text-muted small mb-0">월별 버튼을 눌러보세요!</p>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        // [1] 월별 필터링 함수
        function filterMonth(month, btn) {
            // 버튼 활성화 초기화
            document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
            if(btn) btn.classList.add('active');
            
            // 검색창 초기화 (월 클릭 시에는 해당 월 전체를 보여줌)
            document.getElementById('searchInput').value = "";
            document.getElementById('noResultMessage').classList.add('d-none');

            const items = document.querySelectorAll('.filter-item');
            items.forEach(item => {
                if (item.getAttribute('data-month') == month) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });

            // 팁 변경
            const tips = { '12': '❄️ 12월의 크리스마스 축제!', '1': '🎍 1월의 새해 해돋이!', '2': '♨️ 2월의 따뜻한 온천!' };
            document.getElementById('tipBox').innerText = tips[month] || "겨울 여행을 즐겨보세요.";
        }

        // [2] 전체 검색 함수 (월 상관없이 검색)
        function searchEverywhere() {
            const keyword = document.getElementById('searchInput').value.toLowerCase().trim();
            if(!keyword) {
                alert("검색어를 입력해주세요.");
                return;
            }

            const items = document.querySelectorAll('.filter-item');
            let foundCount = 0;
            let firstFoundMonth = null;

            items.forEach(item => {
                const title = item.getAttribute('data-title').toLowerCase();
                const month = item.getAttribute('data-month');

                if (title.includes(keyword)) {
                    item.style.display = 'block';
                    foundCount++;
                    if(!firstFoundMonth) firstFoundMonth = month;
                } else {
                    item.style.display = 'none';
                }
            });

            // 검색 결과에 따른 버튼 상태 및 메시지 처리
            if(foundCount > 0) {
                document.getElementById('noResultMessage').classList.add('d-none');
                // 검색된 첫 번째 아이템의 월 버튼을 활성화 시각화 (선택사항)
                document.querySelectorAll('.filter-btn').forEach(b => {
                    b.classList.toggle('active', b.getAttribute('data-m') == firstFoundMonth);
                });
            } else {
                document.getElementById('noResultMessage').classList.remove('d-none');
            }
        }

        // 엔터키 검색 지원
        document.getElementById('searchInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') searchEverywhere();
        });

        // 페이지 로드 시 기본 12월 노출
        document.addEventListener("DOMContentLoaded", function() {
            filterMonth(12, document.querySelector('.filter-btn[data-m="12"]'));
        });
    </script>
</body>
</html>