<%@ page contentType="text/html; charset=UTF-8" %>
<% 
    String cpath = request.getContextPath(); 
    String id = request.getParameter("id"); 
    if(id != null) id = id.trim();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Travel Detail</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        body { background-color: #ffffff; color: #222; font-family: 'Pretendard', sans-serif; margin:0; }
        
        /* 배너 영역 */
        .hero {
            height: 60vh;
            background: #eee url('<%=cpath%>/assets/images/<%=id%>.jpg') no-repeat center center / cover !important;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
        .hero-overlay {
            position: absolute; top:0; left:0; width:100%; height:100%;
            background: rgba(0,0,0,0.3);
        }

        /* 뒤로가기 버튼 */
        .btn-close-custom {
            position: fixed; top: 30px; right: 30px; z-index: 1000;
            background: rgba(0,0,0,0.5); color: white; border: none;
            width: 50px; height: 50px; border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            cursor: pointer; transition: 0.3s;
        }
        .btn-close-custom:hover { background: #000; transform: rotate(90deg); }

        /* 본문 디자인 */
        .main-content { max-width: 800px; margin: -50px auto 100px; position: relative; z-index: 10; }
        .info-card {
            background: white; padding: 50px; border-radius: 30px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.1);
        }
        .guide-item {
            padding: 30px; border-radius: 20px; background: #f8f9fa;
            margin-bottom: 20px; border: none;
        }
        .guide-item h5 { color: #0d6efd; font-weight: bold; margin-bottom: 10px; }
        .guide-item p { font-size: 1.2rem; line-height: 1.6; margin: 0; }

        /* 찜하기 버튼 */
        .wish-float {
            position: fixed; bottom: 40px; right: 40px; z-index: 100;
            background: white; border: none; padding: 15px 30px;
            border-radius: 50px; box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            font-weight: bold; transition: 0.3s;
        }
        .wish-float.active { background: #ff4757; color: white; }
    </style>
</head>
<body>

    <button class="btn-close-custom" onclick="history.back()">
        <i class="fas fa-times fa-lg"></i>
    </button>

    <div class="hero">
        <div class="hero-overlay"></div>
        <div class="position-relative">
            <h1 id="placeTitle" class="display-2 fw-bold mb-2">로딩 중...</h1>
            <p id="placeLocation" class="fs-4 opacity-75"></p>
        </div>
    </div>

    <div class="container main-content">
        <div class="info-card">
            <div class="mb-5 text-center">
                <span class="badge bg-primary px-3 py-2 rounded-pill mb-3">BEST SEASON</span>
                <h2 id="placeSeason" class="fw-bold text-dark">-</h2>
            </div>

            <hr class="my-5">

            <h3 class="fw-bold mb-4"><i class="fas fa-quote-left text-primary me-2"></i> 핵심 가이드</h3>
            <div id="pointsList">
                </div>
        </div>
    </div>

    <button id="wishBtn" class="wish-float">
        <i class="far fa-heart me-2"></i> 내 여행지에 저장
    </button>

    <script src="<%=cpath%>/js/detailData.js"></script>
    <script>
        window.onload = function() {
            const placeId = "<%=id%>";
            const data = detailData[placeId];

            if (data) {
                document.getElementById('placeTitle').innerText = data.title;
                document.getElementById('placeLocation').innerText = data.location;
                document.getElementById('placeSeason').innerText = data.season;

                const listContainer = document.getElementById('pointsList');
                let html = '';
                
                // desc 설명글 처리
            if(data.desc && Array.isArray(data.desc)) {
                    data.desc.forEach((text, index) => {
                        html += `
                            <div class="col-12 mb-3">
                                <div class="p-4 bg-white rounded-4 shadow-sm border-start border-primary border-5">
                                    <div class="d-flex align-items-start">
                                        <span class="badge bg-primary text-white me-3 mt-1">${index + 1}</span>
                                        <p class="mb-0 fs-5 text-dark fw-medium">${text}</p>
                                    </div>
                                </div>
                            </div>`;
                    });
                    listContainer.innerHTML = html;
                }
            } else {
                document.getElementById('placeTitle').innerText = "정보를 찾을 수 없습니다.";
                console.error("ID 매칭 실패:", placeId);
            }

            // 찜하기 버튼 토글
            const wishBtn = document.getElementById('wishBtn');
            wishBtn.onclick = function() {
                this.classList.toggle('active');
                if(this.classList.contains('active')) {
                    this.innerHTML = '<i class="fas fa-heart me-2"></i> 저장 완료';
                } else {
                    this.innerHTML = '<i class="far fa-heart me-2"></i> 내 여행지에 저장';
                }
            };
        };
    </script>
</body>
</html>