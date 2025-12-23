const cpath = document.body.dataset.contextPath;

const summerData = {
  6: {
    featured: { id: "gangneung", title: "강릉 경포대", desc: "초여름 바다 여행", img: cpath + "/assets/images/summer-main.jpg" },
    tip: "6월은 성수기 전이라 가장 여유롭습니다 ☀️",
    list: [
      { id: "gangneung", title: "강릉 경포대", img: cpath + "/assets/images/summer-main.jpg", desc: "초여름 바다" },
      { id: "haeundae", title: "부산 해운대", img: cpath + "/assets/images/summer1.jpg", desc: "여름 대표 해변" },
      { id: "heungjeong", title: "평창 흥정계곡", img: cpath + "/assets/images/summer2.jpg", desc: "시원한 계곡" },
      { id: "hyeopjae", title: "제주 협재해변", img: cpath + "/assets/images/summer3.jpg", desc: "에메랄드빛 바다" }
    ]
  },
  7: {
    featured: { id: "sangso", title: "대전 상소동 산림욕장", desc: "숲 힐링", img: cpath + "/assets/images/July1.jpg" },
    tip: "7월은 숲·야간 여행이 좋아요 🌙",
    list: [
      { id: "sangso", title: "상소동 산림욕장", img: cpath + "/assets/images/July2.jpg", desc: "숲 힐링" },
      { id: "yukbaek", title: "육백마지기", img: cpath + "/assets/images/July3.jpg", desc: "초원 풍경" },
      { id: "ulleung", title: "울릉도", img: cpath + "/assets/images/July4.jpg", desc: "섬 여행" },
      { id: "hajodae", title: "하조대해수욕장", img: cpath + "/assets/images/July5.jpg", desc: "동해 바다" }
    ]
  },
  8: {
    featured: { id: "pinocchio", title: "피노키오와 다빈치", desc: "늦여름 감성", img: cpath + "/assets/images/August1.jpg" },
    tip: "8월은 여유 있는 감성 여행 🍃",
    list: [
      { id: "pinocchio", title: "피노키오와 다빈치", img: cpath + "/assets/images/August2.jpg", desc: "감성 여행" },
      { id: "jangho", title: "장호항", img: cpath + "/assets/images/August3.jpg", desc: "맑은 바다" },
      { id: "morningcalm", title: "아침고요수목원", img: cpath + "/assets/images/August4.jpg", desc: "정원 산책" },
      { id: "sunflower", title: "태백 해바라기축제", img: cpath + "/assets/images/August5.jpg", desc: "여름 마무리" }
    ]
  }
};

let currentMonth = 6;

// 2. 렌더링 함수
function renderMonth(month) {
  const data = summerData[month];
  if (!data) return;

  // 상단 추천 영역 (요소가 존재할 때만 업데이트)
  const fImg = document.getElementById("featuredImg");
  const fTitle = document.getElementById("featuredTitle");
  const fDesc = document.getElementById("featuredDesc");
  const fLink = document.getElementById("featuredLink");
  const tBox = document.getElementById("tipBox");

  if(fImg) fImg.src = data.featured.img;
  if(fTitle) fTitle.textContent = data.featured.title;
  if(fDesc) fDesc.textContent = data.featured.desc;
  if(fLink) fLink.href = cpath + "/detail?id=" + data.featured.id;
  if(tBox) tBox.textContent = data.tip;

  renderList(data.list);
}

function renderList(list) {
  placeList.innerHTML = "";
  list.forEach((p) => {
    placeList.innerHTML += `
      <div class="col-lg-6 mb-4">
        <div class="card h-100">
          <img src="${p.img}" class="card-img-top">
          <div class="card-body">
            <h5>${p.title}</h5>
            <p>${p.desc}</p>
            <a href="${cpath}/detail?id=${p.id}&img=${encodeURIComponent(p.img)}" class="btn btn-primary btn-sm">
              자세히 보기 →
            </a>
          </div>
        </div>
      </div>
    `;
  });
}

// 3. 실행 및 이벤트
document.addEventListener('DOMContentLoaded', () => {
  // 초기 렌더링
  renderMonth(6);

  // 탭 버튼 클릭
  document.querySelectorAll(".btn-month").forEach((btn) => {
    btn.onclick = () => {
      document.querySelectorAll(".btn-month").forEach(b => b.classList.remove("active"));
      btn.classList.add("active");
      renderMonth(btn.dataset.month);
    };
  });

  // 검색 버튼
  const searchBtn = document.getElementById("searchBtn");
  const searchInput = document.getElementById("searchInput");
  if(searchBtn && searchInput) {
    searchBtn.onclick = () => {
      const keyword = searchInput.value.trim();
      const filtered = summerData[currentMonth].list.filter(p => p.title.includes(keyword));
      renderList(filtered);
    };
  }
});