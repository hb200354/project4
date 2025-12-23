<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cpath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여름 여행지 | GO-MONTH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .filter-btn { border-radius: 50px; padding: 10px 35px; border: 1px solid #dee2e6; background: #fff; transition: 0.3s; font-weight: bold; }
        .filter-btn.active { background: #0dcaf0 !important; color: #fff !important; border-color: #0dcaf0 !important; } /* 여름 느낌의 Cyan 컬러 */
        .place-card { border-radius: 20px; overflow: hidden; transition: 0.3s; border: none; box-shadow: 0 5px 15px rgba(0,0,0,0.08); }
        .featured-banner { border-radius: 25px; overflow: hidden; background: #fff; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .filter-item { display: none; } /* 자바스크립트로 제어 */
    </style>
</head>
<body data-context-path="<%=cpath%>">

    <header class="season-hero-banner" style="background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('<%=cpath%>/assets/images/summer-width.jpg') no-repeat center center / cover;">
      <%@ include file="header.jsp" %>   
      <%@ include file="nav.jsp" %>
        <div class="container hero-content-wrapper text-center">
            <h1 class="display-3 fw-bold text-white">Summer in GO-MONTH</h1>
            <p class="lead text-white">시원한 바다와 계곡, 여름 휴양의 모든 것</p>
        </div>
    </header>

    <div class="container py-5">
        <div class="d-flex justify-content-center gap-3 mb-5" id="monthTabs">
            <button class="filter-btn active" data-m="6" onclick="filterMonth(6, this)">6월</button>
            <button class="filter-btn" data-m="7" onclick="filterMonth(7, this)">7월</button>
            <button class="filter-btn" data-m="8" onclick="filterMonth(8, this)">8월</button>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div id="featuredArea">
                    <c:forEach var="p" items="${summerPlaces}">
                        <c:if test="${p.isFeatured == 'Y'}">
                            <div class="card mb-5 featured-banner filter-item" data-month="${p.monthVal}" data-title="${p.title}">
                                <div class="row g-0">
                                    <div class="col-md-7">
                                        <img src="<%=cpath%>/assets/images/summer/${p.listImg}" class="featured-img">
                                    </div>
                                    <div class="col-md-5 d-flex align-items-center">
                                        <div class="card-body p-4 p-lg-5">
                                            <span class="badge bg-info mb-3 px-3 py-2">SUMMER PICK</span>
                                            <h2 class="fw-bold mb-3">${p.title}</h2>
                                            <p class="text-muted mb-4">${p.seasonNote}</p>
                                            <a href="detail?id=${p.placeId}" class="btn btn-info btn-lg text-white rounded-pill px-5">자세히 보기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="row g-4" id="placeList">
                    <c:forEach var="p" items="${summerPlaces}">
                        <div class="col-md-6 filter-item" data-month="${p.monthVal}" data-title="${p.title}">
                            <div class="card h-100 place-card">
                                <div class="position-relative">
                                    <img src="<%=cpath%>/assets/images/summer/${p.listImg}" class="card-img-top" style="height: 250px; object-fit: cover;" onerror="this.src='<%=cpath%>/assets/images/default_list.jpg'">
                                    <c:if test="${p.isFeatured == 'Y'}">
                                        <span class="position-absolute top-0 start-0 m-3 badge bg-info">PICK</span>
                                    </c:if>
                                </div>
                                <div class="card-body p-4 text-center">
                                    <h5 class="fw-bold mb-2">${p.title}</h5>
                                    <p class="text-muted small mb-3"><i class="fa-solid fa-location-dot me-1 text-info"></i>${p.location}</p>
                                    <div class="d-grid">
                                        <a href="detail?id=${p.placeId}" class="btn btn-outline-info rounded-pill fw-bold">자세히 보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <div id="noResultMessage" class="text-center py-5 d-none">
                    <p class="text-muted lead">검색 결과가 없습니다.</p>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card border-0 shadow-sm p-4 mb-4" style="border-radius: 20px;">
                    <h5 class="fw-bold mb-3">여행지 검색</h5>
                    <div class="input-group">
                        <input type="text" id="searchInput" class="form-control" placeholder="전체 여름 여행지 검색">
                        <button class="btn btn-info text-white" onclick="searchEverywhere()"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                </div>
                <div class="card border-0 shadow-sm p-4 mb-4" style="border-radius: 20px; background: #f0faff;">
                    <h5 class="fw-bold mb-3">여름 여행 팁</h5>
                    <p id="tipBox" class="text-muted small mb-0">월별 버튼을 눌러보세요!</p>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        // 월 필터링
        function filterMonth(month, btn) {
            document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
            if(btn) btn.classList.add('active');
            
            document.getElementById('searchInput').value = "";
            document.getElementById('noResultMessage').classList.add('d-none');

            const items = document.querySelectorAll('.filter-item');
            items.forEach(item => {
                item.style.display = (item.getAttribute('data-month') == month) ? 'block' : 'none';
            });

            const tips = { '6': '🌿 6월은 싱그러운 숲길과 수국을 즐기기 좋습니다.', '7': '🌊 7월은 시원한 바다 축제와 머드 체험이 최고예요!', '8': '🏡 8월은 계곡이나 이국적인 마을에서 휴양을 즐겨보세요.' };
            document.getElementById('tipBox').innerText = tips[month] || "여름 여행을 즐겨보세요.";
        }

        // 전체 검색 (월 무관)
        function searchEverywhere() {
            const keyword = document.getElementById('searchInput').value.toLowerCase().trim();
            if(!keyword) return;

            const items = document.querySelectorAll('.filter-item');
            let foundCount = 0;
            let firstMonth = null;

            items.forEach(item => {
                const title = item.getAttribute('data-title').toLowerCase();
                if (title.includes(keyword)) {
                    item.style.display = 'block';
                    foundCount++;
                    if(!firstMonth) firstMonth = item.getAttribute('data-month');
                } else {
                    item.style.display = 'none';
                }
            });

            document.getElementById('noResultMessage').classList.toggle('d-none', foundCount > 0);
            if(foundCount > 0) {
                document.querySelectorAll('.filter-btn').forEach(b => {
                    b.classList.toggle('active', b.getAttribute('data-m') == firstMonth);
                });
            }
        }

        document.getElementById('searchInput').addEventListener('keypress', e => { if(e.key === 'Enter') searchEverywhere(); });

        document.addEventListener("DOMContentLoaded", () => {
            filterMonth(6, document.querySelector('.filter-btn[data-m="6"]'));
        });
    </script>
</body>
</html>