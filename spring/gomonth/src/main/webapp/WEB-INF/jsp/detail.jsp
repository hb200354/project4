<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    String cpath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Go Month | ${place.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
    <style>
        /* 하트 버튼 커스텀 스타일 */
        .btn-wish-heart {
            background: none;
            border: none;
            transition: transform 0.2s ease;
            cursor: pointer;
        }
        .btn-wish-heart:hover { transform: scale(1.2); }
        .btn-wish-heart .fa-heart { font-size: 2.5rem; color: #ddd; }
        .btn-wish-heart.active .fa-heart { color: #e74c3c; }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<div class="detail-full-banner">
    <img src="<%=cpath%>/assets/images/${place.seasonType}/${place.bannerImg}" class="banner-img" 
         onerror="this.src='<%=cpath%>/assets/images/default_banner.jpg'">
</div>

<div class="date-info-bar">
    <div>
        <span class="date-tag">BEST SEASON</span>
        <c:forEach var="tip" items="${place.tips}" varStatus="status">
            <c:if test="${status.last}">
                <span id="placeSeason" class="fw-bold fs-5">${tip.content}</span>
            </c:if>
        </c:forEach>
    </div>
    <div id="placeLocation" class="opacity-50 small fw-bold">${place.location}</div>
</div>

<main class="mag-container">
    <div class="row">
        <div class="col-lg-8">
            <h1 id="placeTitle" class="mag-title">${place.title}</h1>
            <div id="pointsList">
                <c:forEach var="tip" items="${place.tips}" varStatus="status">
                    <c:if test="${!status.last}">
                        <div class="guide-item">
                            <span class="guide-label">Feature Point 0${status.count}</span>
                            <div class="guide-text">${tip.content}</div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <div class="col-lg-4 ps-lg-5">
            <div class="side-card text-center">
                <p class="fw-bold small mb-3 text-muted" style="letter-spacing:2px;">SNAPSHOT</p>
                <img src="<%=cpath%>/assets/images/${place.seasonType}/${place.listImg}" class="snapshot-img mb-4" 
                     onerror="this.src='<%=cpath%>/assets/images/default_list.jpg'">
  
                <div class="wish-section mb-4">
                    <c:choose>
                        <c:when test="${not empty sessionScope.loginUser}">
                            <button id="wishBtn" class="btn-wish-heart ${isFavorite ? 'active' : ''}" 
                                    onclick="toggleWishlist('${place.placeId}')" title="찜하기">
                                <i class="fa-solid fa-heart"></i>
                            </button>
                            <p class="small text-muted mt-2" id="wishText">
                                ${isFavorite ? '찜한 여행지입니다' : '이 여행지를 저장할까요?'}
                            </p>
                        </c:when>
                        <c:otherwise>
                            <button class="btn-wish-heart" onclick="location.href='<%=cpath%>/login'" title="로그인 후 이용">
                                <i class="fa-solid fa-heart"></i>
                            </button>
                            <p class="small text-muted mt-2">로그인 후 찜할 수 있습니다.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <div class="border-top pt-4 text-start">
                    <a href="javascript:history.back();" class="text-dark fw-bold text-decoration-none small">
                        &larr; RETURN TO LIST
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function toggleWishlist(placeId) {
        const wishBtn = document.getElementById('wishBtn');
        const wishText = document.getElementById('wishText');
        const isActive = wishBtn.classList.contains('active');
        
        // 이미 active 상태면 삭제(delete), 아니면 추가(add)
        const url = isActive ? '<%=cpath%>/favorites/delete' : '<%=cpath%>/favorites/add';
        
        $.ajax({
            url: url,
            type: 'POST',
            data: { placeId: placeId },
            success: function(response) {
                if(response === "success") {
                    const nowActive = wishBtn.classList.toggle('active');
                    wishText.innerText = nowActive ? '찜한 여행지입니다' : '이 여행지를 저장할까요?';
                } else {
                    alert("처리 중 오류가 발생했습니다.");
                }
            },
            error: function() {
                alert("서버 통신 오류가 발생했습니다.");
            }
        });
    }
</script>
</body>
</html>