<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cpath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>가을 여행지 | GO-MONTH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .filter-btn { border-radius: 50px; padding: 10px 35px; border: 1px solid #dee2e6; background: #fff; transition: 0.3s; font-weight: bold; }
        .filter-btn.active { background: #fd7e14 !important; color: #fff !important; border-color: #fd7e14 !important; } /* 가을 오렌지 컬러 */
        .place-card { border-radius: 20px; overflow: hidden; transition: 0.3s; border: none; box-shadow: 0 5px 15px rgba(0,0,0,0.08); }
        .featured-banner { border-radius: 30px; overflow: hidden; border: none; background: #f8f9fa; }
        .featured-img { width: 100%; height: 400px; object-fit: cover; }
        .filter-item { display: none; }
        .btn-outline-orange { color: #fd7e14; border-color: #fd7e14; border-radius: 10px; font-weight: 600; }
        .btn-outline-orange:hover { background-color: #fd7e14; color: #fff; }
    </style>
</head>
<body data-context-path="<%=cpath%>">

    <header class="season-hero-banner" style="background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('<%=cpath%>/assets/images/fall-main.jpg') no-repeat center center / cover;">
      <%@ include file="header.jsp" %>   
      <%@ include file="nav.jsp" %>
        <div class="container hero-content-wrapper text-center">
            <h1 class="display-3 fw-bold text-white">Autumn in GO-MONTH</h1>
            <p class="lead text-white">황금빛 갈대와 붉은 단풍, 가을의 낭만을 찾아떠나요</p>
        </div>
    </header>

    <div class="container py-5">
        <div class="d-flex justify-content-center gap-3 mb-5">
            <button class="filter-btn active" data-m="9" onclick="filterMonth(9, this)">9월</button>
            <button class="filter-btn" data-m="10" onclick="filterMonth(10, this)">10월</button>
            <button class="filter-btn" data-m="11" onclick="filterMonth(11, this)">11월</button>
        </div>

        <div class="row">
            <div class="col-lg-8">
                
                <c:forEach var="p" items="${fallPlaces}">
                    <c:if test="${p.isFeatured == 'Y'}">
                        <div class="card mb-5 featured-banner filter-item" data-month="${p.monthVal}" data-title="${p.title}">
                            <div class="row g-0">
                                <div class="col-md-7">
                                    <img src="<%=cpath%>/assets/images/fall/${p.listImg}" class="featured-img" onerror="this.src='<%=cpath%>/assets/images/default.jpg'">
                                </div>
                                <div class="col-md-5 d-flex align-items-center">
                                    <div class="card-body p-4">
                                        <span class="badge bg-warning text-dark mb-2">AUTUMN PICK</span>
                                        <h2 class="fw-bold mb-3">${p.title}</h2>
                                        <p class="text-muted mb-4">${p.seasonNote}</p>
                                        <a href="<%=cpath%>/detail?id=${p.placeId}" class="btn btn-dark px-4">자세히 보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>

                <div class="row g-4">
                    <c:forEach var="p" items="${fallPlaces}">
                        <div class="col-md-6 filter-item" data-month="${p.monthVal}" data-title="${p.title}">
                            <div class="card h-100 place-card shadow-sm">
                                <img src="<%=cpath%>/assets/images/fall/${p.listImg}" class="card-img-top" style="height:220px; object-fit:cover;">
                                <div class="card-body p-4">
                                    <h5 class="fw-bold">${p.title}</h5>
                                    <p class="text-muted small mb-3">
                                        <i class="fa-solid fa-location-dot me-1"></i> ${p.location}
                                    </p>
                                    <a href="<%=cpath%>/detail?id=${p.placeId}" class="btn btn-outline-orange btn-sm w-100">상세 정보</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <div id="noResultMessage" class="text-center py-5 d-none">
                    <p class="text-muted">검색 결과가 없습니다.</p>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card border-0 shadow-sm p-4 mb-4" style="border-radius: 20px;">
                    <h5 class="fw-bold mb-3">여행지 검색</h5>
                    <div class="input-group">
                        <input id="searchInput" class="form-control" placeholder="가을 어디로 떠날까요?">
                        <button id="searchBtn" class="btn btn-primary" onclick="searchEverywhere()">검색</button>
                    </div>
                </div>
                <div class="card border-0 shadow-sm p-4" style="border-radius: 20px;">
                    <h5 class="fw-bold mb-3 text-warning">Autumn Tip</h5>
                    <p id="tipBox" class="text-muted small mb-0"></p>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        const tips = {
            9: "9월은 억새와 갈대가 물들기 시작하는 산책하기 좋은 시기입니다.",
            10: "10월은 설악산을 시작으로 온 산이 오색 단풍으로 물듭니다.",
            11: "11월은 늦가을 아기단풍과 은빛 억새의 마지막 정취를 즐기기 좋습니다."
        };

        function filterMonth(month, btn) {
            document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            const items = document.querySelectorAll('.filter-item');
            items.forEach(item => {
                if (item.getAttribute('data-month') == month) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
            document.getElementById('tipBox').innerText = tips[month] || "가을 여행을 즐겨보세요.";
            document.getElementById('noResultMessage').classList.add('d-none');
        }

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
            filterMonth(9, document.querySelector('.filter-btn[data-m="9"]'));
        });
    </script>
</body>
</html>