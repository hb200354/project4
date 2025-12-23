<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    String cpath = request.getContextPath(); 
    // 이제 id는 파라미터가 아닌 DB 데이터에서 가져오는 것을 권장하지만, 
    // 이미지 경로 하위 호환성을 위해 유지합니다.
    String id = request.getParameter("id"); 
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Go Month | ${place.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>

<div class="detail-full-banner">
    <img src="<%=cpath%>/assets/images/${place.seasonType}/${place.bannerImg}" class="banner-img" 
         onerror="this.src='<%=cpath%>/assets/images/default_banner.jpg'">
</div>

<%-- 상단 정보바 영역 수정 --%>
<div class="date-info-bar">
    <div>
        <span class="date-tag">BEST SEASON</span>
        <%-- tips 리스트의 마지막 content를 출력 --%>
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
                    <%-- 마지막 데이터(상단으로 보낸 것)를 제외한 나머지만 리스트에 표시 --%>
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
            <div class="side-card">
                <p class="fw-bold small mb-3 text-muted" style="letter-spacing:2px;">SNAPSHOT</p>
                <img src="<%=cpath%>/assets/images/${place.seasonType}/${place.listImg}" class="snapshot-img" 
                     onerror="this.src='<%=cpath%>/assets/images/default_list.jpg'">
  
                <button id="wishBtn" class="btn-luxury-wish mb-4">
                    SAVE TO MY TRIP
                </button>
                
                <div class="border-top pt-4">
                    <a href="javascript:history.back();" class="text-dark fw-bold text-decoration-none small">
                        &larr; RETURN TO LIST
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

<script>
    // 위시리스트 버튼 토글 로직만 유지
    window.onload = function() {
        const wishBtn = document.getElementById('wishBtn');
        if(wishBtn) {
            wishBtn.onclick = function() {
                const isActive = this.classList.toggle('active');
                this.innerText = isActive ? 'SAVED' : 'SAVE TO MY TRIP';
            };
        }
    };
</script>
</body>
</html>