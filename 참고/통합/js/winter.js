const winterData = {
  12: {
    featured: {
      img: "./assets/images/winter1.jpg",
      title: "대관령 양떼목장",
      desc: "눈꽃으로 덮인 겨울 대표 풍경"
    },
    tip: "12월은 눈꽃 풍경이 가장 아름다워요 ❄️",
    list: [
      { id: "daegwallyeong", title: "대관령 양떼목장", img: "./assets/images/winter1.jpg", desc: "설경 명소" },
      { id: "pyeongchang", title: "평창 스키장", img: "./assets/images/winter2.jpg", desc: "겨울 스포츠" }
    ]
  },

  1: {
    featured: {
      img: "./assets/images/winter3.jpg",
      title: "설악산 눈꽃",
      desc: "한겨울에만 볼 수 있는 절경"
    },
    tip: "1월은 방한 준비 필수예요 🧤",
    list: [
      { id: "seorak", title: "설악산", img: "./assets/images/winter3.jpg", desc: "눈꽃 산행" },
      { id: "onsen", title: "덕산 온천", img: "./assets/images/winter4.jpg", desc: "겨울 온천" }
    ]
  },

  2: {
    featured: {
      img: "./assets/images/winter5.jpg",
      title: "한라산 설경",
      desc: "겨울 제주에서만 가능한 경험"
    },
    tip: "2월은 비교적 한적한 여행이 좋아요 ☃️",
    list: [
      { id: "hallasan", title: "한라산", img: "./assets/images/winter5.jpg", desc: "설산 트레킹" },
      { id: "jejuwinter", title: "제주 겨울 바다", img: "./assets/images/winter6.jpg", desc: "겨울 감성" }
    ]
  }
};

let currentMonth = 12;

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
  const data = winterData[month];

  featuredImg.src = data.featured.img;
  featuredTitle.innerText = data.featured.title;
  featuredDesc.innerText = data.featured.desc;
  tipBox.innerText = data.tip;

  featuredLink.href = "detail.html?id=" + data.list[0].id;

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
            <a href="detail.html?id=${p.id}" class="btn btn-primary btn-sm">
              자세히 보기 →
            </a>
          </div>
        </div>
      </div>
    `;
  });
}

document.querySelectorAll(".btn-month").forEach(btn => {
  btn.onclick = () => {
    document.querySelectorAll(".btn-month").forEach(b =>
      b.classList.replace("btn-dark", "btn-outline-dark")
    );
    btn.classList.replace("btn-outline-dark", "btn-dark");
    renderMonth(btn.dataset.month);
  };
});

searchBtn.onclick = () => {
  const keyword = searchInput.value.trim();
  const filtered = winterData[currentMonth].list.filter(p =>
    p.title.includes(keyword)
  );
  renderList(filtered);
};

// 초기 실행
renderMonth(12);
