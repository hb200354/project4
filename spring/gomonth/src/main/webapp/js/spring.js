const cpath = document.body.dataset.contextPath;

const springData = {
  3: {
    featured: {
      img: cpath + "/assets/images/spring1.png",
      title: "여의도 벚꽃길",
      desc: "서울에서 즐기는 대표적인 봄 벚꽃 명소",
    },
    list: [
      {
        id: "yeouido",
        title: "여의도 벚꽃길",
        img: cpath + "/assets/images/spring2.jpg",
        desc: "벚꽃 산책",
      },
      {
        id: "jeju",
        title: "제주 유채꽃",
        img: cpath + "/assets/images/spring3.jpg",
        desc: "노란 봄 풍경",
      },
    ],
  },
  4: {
    featured: {
      img: cpath + "/assets/images/spring3.jpg",
      title: "경주 보문단지",
      desc: "역사와 함께하는 봄 여행",
    },
    list: [
      {
        id: "gyeongju",
        title: "경주 보문단지",
        img: cpath + "/assets/images/spring3.jpg",
        desc: "봄 나들이",
      },
      {
        id: "damyang",
        title: "담양 메타세쿼이아길",
        img: cpath + "/assets/images/spring4.jpg",
        desc: "산책 명소",
      },
    ],
  },
  5: {
    featured: {
      img: cpath + "/assets/images/spring4.jpg",
      title: "남이섬",
      desc: "초여름을 앞둔 감성 여행지",
    },
    list: [
      {
        id: "nami",
        title: "남이섬",
        img: cpath + "/assets/images/spring4.jpg",
        desc: "자연 힐링",
      },
      {
        id: "taean",
        title: "태안 튤립축제",
        img: cpath + "/assets/images/spring5.jpg",
        desc: "봄 축제",
      },
    ],
  },
};

let currentMonth = 3;

const featuredImg = document.getElementById("featuredImg");
const featuredTitle = document.getElementById("featuredTitle");
const featuredDesc = document.getElementById("featuredDesc");
const featuredLink = document.getElementById("featuredLink");
const placeList = document.getElementById("placeList");
const searchInput = document.getElementById("searchInput");
const searchBtn = document.getElementById("searchBtn");

function renderMonth(month) {
  currentMonth = month;
  const data = springData[month];

  featuredImg.src = data.featured.img;
  featuredTitle.innerText = data.featured.title;
  featuredDesc.innerText = data.featured.desc;
  featuredLink.href = cpath + "/detail?id=" + data.list[0].id;

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
  const filtered = springData[currentMonth].list.filter((p) =>
    p.title.includes(keyword)
  );
  renderList(filtered);
};

renderMonth(3);
