<%@ page contentType="text/html; charset=UTF-8" %>
<% 
    String cpath = request.getContextPath(); 
    String id = request.getParameter("id"); 
    String listImg = request.getParameter("img"); // 리스트에서 전달받은 이미지 경로
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Go Month | Premium Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css?v=<%=System.currentTimeMillis()%>" rel="stylesheet">
</head>
<body>

<%@ include file="nav.jsp" %>

<div class="detail-full-banner">
    <img src="<%=cpath%>/assets/images/<%=id%>.jpg" class="banner-img" onerror="this.src='<%=listImg%>'">
</div>

<div class="date-info-bar">
    <div>
        <span class="date-tag">BEST SEASON</span>
        <span id="placeSeason" class="fw-bold fs-5"></span>
    </div>
    <div id="placeLocation" class="opacity-50 small fw-bold"></div>
</div>

<main class="mag-container">
    <div class="row">
        <div class="col-lg-8">
            <h1 id="placeTitle" class="mag-title">로딩 중...</h1>
            <div id="pointsList">
                </div>
        </div>

        <div class="col-lg-4 ps-lg-5">
            <div class="side-card">
                <p class="fw-bold small mb-3 text-muted" style="letter-spacing:2px;">SNAPSHOT</p>
                <img src="<%=listImg%>" class="snapshot-img" onerror="this.src='<%=cpath%>/assets/images/<%=id%>.jpg'">
                
                <button id="wishBtn" class="btn-luxury-wish mb-4">
                    SAVE TO MY TRIP
                </button>
                
                <div class="border-top pt-4">
                    <a href="javascript:history.back();" class="text-dark fw-bold text-decoration-none small">
                        ← RETURN TO LIST
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="<%=cpath%>/js/detailData.js"></script>
<script>
    window.onload = function() {
        const data = detailData["<%=id%>"];
        if(data) {
            document.getElementById('placeTitle').innerText = data.title;
            document.getElementById('placeLocation').innerText = data.location;
            document.getElementById('placeSeason').innerText = data.season;

            let html = '';
            data.desc.forEach((text, i) => {
                html += '<div class="guide-item">';
                html += '  <span class="guide-label">Feature Point 0' + (i+1) + '</span>';
                html += '  <div class="guide-text">' + text + '</div>';
                html += '</div>';
            });
            document.getElementById('pointsList').innerHTML = html;
        }

        const wishBtn = document.getElementById('wishBtn');
        wishBtn.onclick = function() {
            const isActive = this.classList.toggle('active');
            this.innerText = isActive ? 'SAVED' : 'SAVE TO MY TRIP';
        };
    };
</script>
</body>
</html>