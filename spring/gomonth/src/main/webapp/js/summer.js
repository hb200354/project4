const cpath = document.body.dataset.contextPath;

const summerData = {
  6: {
    featured: {
      img: cpath + "/assets/images/summer-main.jpg",
      title: "강릉 경포대",
      desc: "초여름에 가장 잘 어울리는 바다 여행지"
    },
    tip: "6월은 습도가 낮아 여행하기 쾌적한 시기입니다 ☀️",
    list: [
      { id: "haeundae", title: "부산 해운대", img: cpath + "/assets/images/summer1.jpg", desc: "여름 대표 해변" },
      { id: "valley", title: "평창 흥정계곡", img: cpath + "/assets/images/summer2.jpg", desc: "시원한 계곡" },
      { id: "hyupjae", title: "제주 협재해변", img: cpath + "/assets/images/summer4.jpg", desc: "에메랄드빛 바다" },
      { id: "hangang", title: "한강 야경", img: cpath + "/assets/images/summer4.jpg", desc: "밤 산책" }
    ]
  },

  7: {
    featured: {
      img: cpath + "/assets/images/summer3.jpg",
      title: "부산 광안리",
      desc: "한여름 밤, 가장 빛나는 바다"
    },
    tip: "7월에는 밤 여행 코스를 추천해요 🌙",
    list: [
      { id: "gwangalli", title: "부산 광안리", img: cpath + "/assets/images/summer3.jpg", desc: "야경 명소" },
      { id: "hyupjae", title: "제주 협재해변", img: cpath + "/assets/images/summer4.jpg", desc: "에메랄드빛 바다" }
    ]
  },

  8: {
    featured: {
      img: cpath + "/assets/images/summer4.jpg",
      title: "한강 야경",
      desc: "늦여름 밤, 도심 속 산책"
    },
    tip: "8월은 평일 여행이 좋아요 🍃",
    list: [
      { id: "hangang", title: "한강 야경", img: cpath + "/assets/images/summer4.jpg", desc: "밤 산책" },
      { id: "valley", title: "흥정계곡", img: cpath + "/assets/images/summer2.jpg", desc: "여름 마무리" }
    ]
  }
};

let currentMonth = 6;

const featuredImg   = document.getElementById("featuredImg");
const featuredTitle = document.getElementById("featuredTitle");
const featuredDesc  = document.getElementById("featuredDesc");
const featuredLink  = document.getElementById("featuredLink");
const placeList     = document.getElementById("placeList");
const searchInput   = document.getElementById("searchInput");
const searchBtn     = document.getElementById("searchBtn");
const tipBox        = document.getElementById("tipBox");

function renderMonth(month) {
  currentMonth = month;
  const data = summerData[month];

  featuredImg.src = data.featured.img;
  featuredTitle.innerText = data.featured.title;
  featuredDesc.innerText = data.featured.desc;
  tipBox.innerText = data.tip;

  featuredLink.href = cpath + "/detail?id=" + data.list[0].id;
  renderList(data.list);
}

function renderList(list) {
  placeList.innerHTML = "";
  list.forEach(p => {
    placeList.innerHTML += `
      <div class="col-lg-6 mb-4">
        <div class="card h-100">
          <img src="${p.img}" class="card-img-top">
          <div class="card-body">
            <h5>${p.title}</h5>
            <p>${p.desc}</p>
            <a href="${cpath}/detail?id=${p.id}" class="btn btn-primary btn-sm">
              자세히 보기 →
            </a>
          </div>
        </div>
      </div>
    `;
  });
}

// 버튼 클릭 이벤트 설정
document.querySelectorAll(".btn-month").forEach((btn) => {
  btn.onclick = () => {
    // 1. 모든 버튼에서 'active' 클래스를 제거 (기존 강조 해제)
    document.querySelectorAll(".btn-month").forEach((b) => {
      b.classList.remove("active");
    });
    
    // 2. 클릭한 버튼에만 'active' 클래스 추가 (새로운 강조)
    btn.classList.add("active");

    // 3. 해당 월의 데이터로 화면 갱신
    renderMonth(btn.dataset.month);
  };
});

// 페이지 로드 시 처음 선택된 버튼(3월 등)의 데이터를 화면에 뿌려줌
window.addEventListener('load', () => {
  const activeBtn = document.querySelector(".btn-month.active");
  if (activeBtn) {
    renderMonth(activeBtn.dataset.month);
  }
});

searchBtn.onclick = () => {
  const keyword = searchInput.value.trim();
  const filtered = summerData[currentMonth].list.filter(p =>
    p.title.includes(keyword)
  );
  renderList(filtered);
};

renderMonth(6);
