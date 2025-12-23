// ============================
// 1) 월별 데이터
// ============================
const MONTH_DATA = {
  /* =========================
     3월
  ========================= */
  3: {
    featured: {
      badge: "SPRING PICK",
      img: "assets/images/spring1.PNG",
      alt: "3월 봄대표 이미지",
      title: "3월 봄 대표 여행지",
      desc: "산수유·매화·유채꽃으로 봄의 시작을 알리는 여행",
      link: "detail.html?season=spring&id=100"
    },
    subs: [
      {
        img: "assets/images/03_gurye.jpg",
        title: "구례 산수유 마을",
        desc: "노란 산수유 꽃이 마을 전체를 물들이는 3월 대표 봄꽃 여행지",
        link: "detail.html?season=spring&id=101"
      },
      {
        img: "assets/images/03_jeju.jpg",
        title: "제주도 유채꽃 시즌",
        desc: "푸른 바다와 노란 유채꽃이 어우러지는 제주 봄 풍경",
        link: "detail.html?season=spring&id=102"
      },
      {
        img: "assets/images/03_gwangya.jpg",
        title: "광양 매화마을",
        desc: "매화 향기 가득한 봄 축제와 사진 명소",
        link: "detail.html?season=spring&id=103"
      }
    ]
  },

  /* =========================
     4월
  ========================= */
  4: {
    featured: {
      badge: "APRIL PICK",
      img: "assets/images/spring2.jpg",
      alt: "4월 봄대표 이미지",
      title: "4월 봄 대표 여행지",
      desc: "벚꽃이 절정을 이루는 완연한 봄 여행",
      link: "detail.html?season=spring&id=200"
    },
    subs: [
      {
        img: "assets/images/04_gyeongju.jpg",
        title: "경주 영지 둘레길",
        desc: "역사 유적과 벚꽃길을 함께 즐길 수 있는 산책 코스",
        link: "detail.html?season=spring&id=201"
      },
      {
        img: "assets/images/04_jinhae.jpg",
        title: "진해 군항제",
        desc: "전국 최대 규모의 벚꽃 축제로 유명한 봄 축제 명소",
        link: "detail.html?season=spring&id=202"
      },
      {
        img: "assets/images/04_damyang.jpg",
        title: "담양 죽녹원",
        desc: "대나무 숲에서 느끼는 조용한 힐링 산책 여행",
        link: "detail.html?season=spring&id=203"
      }
    ]
  },

  /* =========================
     5월
  ========================= */
  5: {
    featured: {
      badge: "MAY PICK",
      img: "assets/images/spring3.jpg",
      alt: "5월 봄대표 이미지",
      title: "5월 봄 대표 여행지",
      desc: "초록이 가장 아름다운 계절, 자연 속 힐링 여행",
      link: "detail.html?season=spring&id=300"
    },
    subs: [
      {
        img: "assets/images/05_boseong.jpg",
        title: "보성 녹차밭",
        desc: "끝없이 펼쳐진 녹차밭과 초록 물결이 인상적인 여행지",
        link: "detail.html?season=spring&id=301"
      },
      {
        img: "assets/images/05_damyang.jpg",
        title: "담양 메타세콰이어길",
        desc: "산책과 드라이브 모두 좋은 감성 가득한 길",
        link: "detail.html?season=spring&id=302"
      },
      {
        img: "assets/images/05_jeju.jpg",
        title: "한라산 철쭉",
        desc: "5월에만 만날 수 있는 철쭉 군락과 봄 산행",
        link: "detail.html?season=spring&id=303"
      }
    ]
  }
};

// ============================
// DOM 유틸
// ============================
function $(sel) { return document.querySelector(sel); }
function $all(sel) { return document.querySelectorAll(sel); }

// ============================
// 렌더링
// ============================
function renderFeatured(data) {
  $(".featured-img").src = data.img;
  $("#featuredBadge").textContent = data.badge;
  $("#featuredTitle").textContent = data.title;
  $("#featuredDesc").textContent = data.desc;
  $("#featuredLink").href = data.link;
}

function renderSubs(list) {
  const area = $("#subArea");
  area.innerHTML = list.map(item => `
    <div class="col-lg-6">
      <div class="card mb-4">
        <img class="card-img-top" src="${item.img}">
        <div class="card-body">
          <h5>${item.title}</h5>
          <p>${item.desc}</p>
          <a href="${item.link}" class="btn btn-primary">자세히 보기 →</a>
        </div>
      </div>
    </div>
  `).join("");
}

function renderMonth(month) {
  const data = MONTH_DATA[month];
  if (!data) return;
  renderFeatured(data.featured);
  renderSubs(data.subs);
}

// ============================
// 초기 실행
// ============================
document.addEventListener("DOMContentLoaded", () => {
  renderMonth(3);

  $all(".btn-month").forEach(btn => {
    btn.addEventListener("click", () => {
      renderMonth(Number(btn.dataset.month));
    });
  });
});
