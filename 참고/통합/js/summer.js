const summerData = {
  6: {
    featured: {
      img: "./assets/images/summer-main.jpg",
      title: "강릉 경포대",
      desc: "초여름에 가장 잘 어울리는 바다 여행지"
    },
    tip: "6월은 습도가 낮아 여행하기 쾌적한 시기입니다 ☀️",
    list: [
      { id: "haeundae", title: "부산 해운대", img: "./assets/images/summer1.jpg", desc: "여름 대표 해변" },
      { id: "valley", title: "평창 흥정계곡", img: "./assets/images/summer2.jpg", desc: "시원한 계곡" },
      { id: "hyupjae", title: "제주 협재해변", img: "./assets/images/summer3.jpg", desc: "에메랄드빛 바다" },
      { id: "hangang", title: "한강 야경", img: "./assets/images/summer4.jpg", desc: "밤 산책" }
    ]
  },

  7: {
    featured: {
      img: "./assets/images/summer3.jpg",
      title: "부산 광안리",
      desc: "한여름 밤, 가장 빛나는 바다"
    },
    tip: "7월에는 밤 여행 코스를 추천해요 🌙",
    list: [
      { id: "gwangalli", title: "부산 광안리", img: "./assets/images/summer3.jpg", desc: "야경 명소" },
      { id: "hyupjae", title: "제주 협재해변", img: "./assets/images/summer4.jpg", desc: "에메랄드빛 바다" }
    ]
  },

  8: {
    featured: {
      img: "./assets/images/summer4.jpg",
      title: "한강 야경",
      desc: "늦여름 밤, 도심 속 산책"
    },
    tip: "8월은 평일 여행이 좋아요 🍃",
    list: [
      { id: "hangang", title: "한강 야경", img: "./assets/images/summer4.jpg", desc: "밤 산책" },
      { id: "valley", title: "흥정계곡", img: "./assets/images/summer2.jpg", desc: "여름 마무리" }
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
  const filtered = summerData[currentMonth].list.filter(p =>
    p.title.includes(keyword)
  );
  renderList(filtered);
};

// 초기 실행
renderMonth(6);
