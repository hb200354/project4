const cpath = document.body.dataset.contextPath;

const winterData = {
  12: {
    featured: {
      img: cpath + "/assets/images/winter1.jpg",
      title: "평창 스키장",
      desc: "겨울 스포츠의 성지, 설원 위의 즐거움"
    },
    tip: "12월은 스키 시즌 개막 시기입니다 ⛷",
    list: [
      { id: "pyeongchang", title: "평창 스키장", img: cpath + "/assets/images/winter1.jpg", desc: "겨울 스포츠" },
      { id: "gangneung", title: "강릉 바다", img: cpath + "/assets/images/winter2.jpg", desc: "겨울 바다" }
    ]
  },

  1: {
    featured: {
      img: cpath + "/assets/images/winter5.jpg",
      title: "한라산 설경",
      desc: "눈 덮인 제주, 겨울의 백미"
    },
    tip: "1월은 설경이 가장 아름다운 시기입니다 ❄️",
    list: [
      { id: "hallasan", title: "한라산", img: cpath + "/assets/images/winter5.jpg", desc: "설경 산행" },
      { id: "onsen", title: "덕구온천", img: cpath + "/assets/images/winter3.jpg", desc: "온천 힐링" }
    ]
  },

  2: {
    featured: {
      img: cpath + "/assets/images/winter6.jpg",
      title: "정동진 일출",
      desc: "겨울 바다에서 맞이하는 해돋이"
    },
    tip: "2월은 비교적 한산한 여행이 가능합니다 🌅",
    list: [
      { id: "jeongdongjin", title: "정동진", img: cpath + "/assets/images/winter6.jpg", desc: "일출 명소" },
      { id: "pyeongchang", title: "평창 스키장", img: cpath + "/assets/images/winter1.jpg", desc: "시즌 막바지" }
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

renderMonth(12);
