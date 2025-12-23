<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cpath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>봄 여행지 | GO-MONTH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .filter-btn { border-radius: 50px; padding: 10px 35px; border: 1px solid #dee2e6; background: #fff; transition: 0.3s; font-weight: bold; }
        .filter-btn.active { background: #ff85a2 !important; color: #fff !important; border-color: #ff85a2 !important; }
        .filter-item { display: none; } 
    </style>
</head>
<body data-context-path="<%=cpath%>">

    <header class="season-hero-banner" style="background: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('<%=cpath%>/assets/images/spring-main.jpg') no-repeat center center / cover;">
      <%@ include file="header.jsp" %>   
      <%@ include file="nav.jsp" %>
        <div class="container hero-content-wrapper text-center">
            <h1 class="display-3 fw-bold text-white">Spring in GO-MONTH</h1>
            <p class="lead text-white">꽃향기와 설레는 산책, 봄 여행지의 모든 것</p>
        </div>
    </header>

    <div class="container py-5">
        <div class="d-flex justify-content-center gap-3 mb-5">
            <button class="filter-btn active" data-m="3" onclick="filterMonth(3, this)">3월</button>
            <button class="filter-btn" data-m="4" onclick="filterMonth(4, this)">4월</button>
            <button class="filter-btn" data-m="5" onclick="filterMonth(5, this)">5월</button>
        </div>

        <div class="row">
            <div class="col-lg-8">
                
                <c:forEach var="p" items="${springPlaces}">
                    <c:if test="${p.isFeatured == 'Y'}">
                        <div class="card mb-5 featured-banner filter-item" data-month="${p.monthVal}" data-title="${p.title}">
                            <div class="row g-0">
                                <div class="col-md-7">
                                    <img src="<%=cpath%>/assets/images/spring/${p.listImg}" class="featured-img" onerror="this.src='<%=cpath%>/assets/images/default.jpg'">
                                </div>
                                <div class="col-md-5 d-flex align-items-center">
                                    <div class="card-body p-4">
                                        <span class="badge bg-danger mb-2">SPRING PICK</span>
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
                    <c:forEach var="p" items="${springPlaces}">
                        <div class="col-md-6 filter-item" data-month="${p.monthVal}" data-title="${p.title}">
                            <div class="card h-100 place-card shadow-sm border-0">
                                <img src="<%=cpath%>/assets/images/spring/${p.listImg}" class="card-img-top" style="height:220px; object-fit:cover;">
                                <div class="card-body p-4">
                                    <h5 class="fw-bold">${p.title}</h5>
                                    <p class="text-muted small mb-3">
                                        <i class="fa-solid fa-location-dot me-1"></i> ${p.location}
                                    </p>
                                    <a href="<%=cpath%>/detail?id=${p.placeId}" class="btn btn-outline-pink btn-sm w-100">상세 정보</a>
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
                        <input id="searchInput" class="form-control" placeholder="전체 봄 여행지 검색">
                        <button id="searchBtn" class="btn btn-primary" onclick="searchEverywhere()">검색</button>
                    </div>
                </div>
                <div class="card border-0 shadow-sm p-4" style="border-radius: 20px;">
                    <h5 class="fw-bold mb-3 text-danger">Spring Tip</h5>
                    <p id="tipBox" class="text-muted small mb-0"></p>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        const tips = {
            3: "3월은 매화와 산수유가 피어나는 봄의 시작입니다.",
            4: "4월은 전국이 벚꽃으로 물드는 시기입니다.",
            5: "5월은 푸른 신록과 장미를 즐기기 좋습니다."
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
            document.getElementById('tipBox').innerText = tips[month] || "봄 여행을 즐겨보세요.";
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
            filterMonth(3, document.querySelector('.filter-btn[data-m="3"]'));
        });
    </script>
</body>
</html>