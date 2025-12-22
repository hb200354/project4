const cpath = document.body.dataset.contextPath;

const fallData = {
  9: {
    featured: {
      img: cpath + "/assets/images/fall1.jpg",
      title: "남이섬",
      desc: "초가을에 가장 잘 어울리는 산책 여행지"
    },
    tip: "9월은 날씨가 선선해 걷기 좋은 시기입니다 🍃",
    list: [
      { id: "nami", title: "남이섬", img: cpath + "/assets/images/fall1.jpg", desc: "감성 산책" },
      { id: "gyeongju", title: "경주", img: cpath + "/assets/images/fall2.jpg", desc: "역사 여행" }
    ]
  },

  10: {
    featured: {
      img: cpath + "/assets/images/fall-main.jpg",
      title: "내장산 국립공원",
      desc: "대한민국 최고의 단풍 명소"
    },
    tip: "10월은 단풍 절정 시기입니다 🍁",
    list: [
      { id: "naejangsan", title: "내장산", img: cpath + "/assets/images/fall-main.jpg", desc: "단풍 명소" },
      { id: "seoraksan", title: "설악산", img: cpath + "/assets/images/fall3.jpg", desc: "국립공원" }
    ]
  },

  11: { 
    featured: {
      img: cpath + "/assets/images/fall3.jpg",
      title: "설악산",
      desc: "늦가을의 고요한 산행"
    },
    tip: "11월은 따뜻한 옷차림이 필요합니다 🧥",
    list: [
      { id: "seoraksan", title: "설악산", img: cpath + "/assets/images/fall3.jpg", desc: "늦가을 산행" },
      { id: "jeonju", title: "전주 한옥마을", img: cpath + "/assets/images/fall4.jpg", desc: "전통 여행" }
    ]
  }
};

let currentMonth = 9;

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
  const data = fallData[month];

  featuredImg.src = data.featured.img;
  featuredTitle.innerText = data.featured.title;
  featuredDesc.innerText = data.featured.desc;
  tipBox.innerText = data.tip;

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
  const filtered = fallData[currentMonth].list.filter(p =>
    p.title.includes(keyword)
  );
  renderList(filtered);
};

renderMonth(9);
