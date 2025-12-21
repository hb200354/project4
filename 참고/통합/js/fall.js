const fallData = {
  9: {
    featured: {
      img: "./assets/images/fall1.jpg",
      title: "담양 메타세쿼이아길",
      desc: "초가을에 걷기 좋은 대표 산책 코스"
    },
    tip: "9월은 선선해서 트레킹하기 좋아요 🍁",
    list: [
      { id: "damyang", title: "담양 메타세쿼이아길", img: "./assets/images/fall1.jpg", desc: "가을 산책" },
      { id: "anbandegi", title: "강릉 안반데기", img: "./assets/images/fall2.jpg", desc: "가을 감성" }
    ]
  },

  10: {
    featured: {
      img: "./assets/images/fall-main.jpg",
      title: "내장산 국립공원",
      desc: "대한민국 단풍의 상징"
    },
    tip: "10월 말이 단풍 절정입니다 🍂",
    list: [
      { id: "naejangsan", title: "내장산 국립공원", img: "./assets/images/fall-main.jpg", desc: "단풍 1위" },
      { id: "seorak", title: "설악산", img: "./assets/images/fall3.jpg", desc: "가장 빠른 단풍" }
    ]
  },

  11: {
    featured: {
      img: "./assets/images/fall4.jpg",
      title: "제주 오름",
      desc: "늦가을에 가장 좋은 힐링 코스"
    },
    tip: "11월은 한적한 여행이 좋아요 ☕",
    list: [
      { id: "jejuoreum", title: "제주 오름", img: "./assets/images/fall4.jpg", desc: "늦가을 힐링" },
      { id: "gangcheong", title: "강천산 군립공원", img: "./assets/images/fall5.jpg", desc: "11월 단풍" }
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
  const filtered = fallData[currentMonth].list.filter(p =>
    p.title.includes(keyword)
  );
  renderList(filtered);
};

// 초기 실행
renderMonth(9);
