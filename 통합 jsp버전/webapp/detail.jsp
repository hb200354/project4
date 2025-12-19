<%@ page contentType="text/html; charset=UTF-8" %>
<%
  String id = request.getParameter("id");
  if (id == null) id = "0";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>여행지 상세 | GO-MONTH</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header.jsp" />

<div class="container my-5">
  <div class="row">

    <div class="col-lg-8">
      <img id="detailImg" class="img-fluid rounded mb-4" alt="상세 이미지" />
      <h1 id="detailTitle" class="fw-bold"></h1>
      <p id="detailDesc" class="mt-3"></p>

      <button class="btn btn-outline-danger mt-3" onclick="addFavorite()">찜하기 ♡</button>
    </div>

    <div class="col-lg-4">
      <div class="card mb-4">
        <div class="card-header">여행 정보</div>
        <div class="card-body">
          <ul class="list-unstyled">
            <li><strong>추천 계절:</strong> <span id="detailSeason"></span></li>
            <li><strong>추천 월:</strong> <span id="detailMonth"></span></li>
          </ul>
        </div>
      </div>

      <div class="card mb-4">
        <div class="card-header">한 줄 팁</div>
        <div class="card-body" id="detailTip"></div>
      </div>
    </div>

  </div>
</div>

<jsp:include page="/WEB-INF/jsp/footer.jsp" />

<script>
const placeData = {
  1: { title: "부산 해운대", img: "assets/images/summer1.jpg", desc: "여름 대표 해변", season: "여름", month: "6~8월", tip: "성수기엔 오전 방문 추천" },
  2: { title: "평창 흥정계곡", img: "assets/images/summer2.jpg", desc: "시원한 계곡", season: "여름", month: "7~8월", tip: "물놀이 후 여벌옷 필수" },
  3: { title: "부산 광안리", img: "assets/images/summer3.jpg", desc: "야경이 아름다운 해변", season: "여름", month: "7월", tip: "밤 산책 추천" },
  21:{ title: "내장산", img: "assets/images/fall1.jpg", desc: "단풍 명소", season: "가을", month: "10월", tip: "주말 혼잡 주의" },
  31:{ title: "강원도 설경", img: "assets/images/winter1.jpg", desc: "눈 여행", season: "겨울", month: "1월", tip: "방한 준비 필수" }
};

const id = <%= id %>;
const data = placeData[id];

if (data) {
  document.getElementById("detailImg").src = data.img;
  document.getElementById("detailTitle").innerText = data.title;
  document.getElementById("detailDesc").innerText = data.desc;
  document.getElementById("detailSeason").innerText = data.season;
  document.getElementById("detailMonth").innerText = data.month;
  document.getElementById("detailTip").innerText = data.tip;
}

function addFavorite() {
  alert("찜 목록에 추가되었습니다 💖 (DB 연동 예정)");
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>