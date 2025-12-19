// ============================
// 1) 월별 데이터 (여기만 바꾸면 내용 바뀜)
// ============================
const MONTH_DATA = {
  3: {
    featured: {
      badge: "SPRING PICK",
      img: "assets/images/spring1.PNG",
      alt: "3월 봄대표 이미지",
      title: "3월 봄 대표 여행지",
      desc: "3월 추천: 벚꽃 개화 시작, 산책 코스",
      link: "detail.html?month=3&pick=featured"
    },
    subs: [
      {
        img: "assets/images/spring2.jpg",
        alt: "3월 서브 이미지 A",
        title: "3월 테마 여행지 A",
        desc: "3월 테마: 벚꽃길/야외 산책",
        link: "detail.html?month=3&pick=a"
      },
      {
        img: "assets/images/spring3.jpg",
        alt: "3월 서브 이미지 B",
        title: "3월 테마 여행지 B",
        desc: "3월 테마: 봄꽃 명소/포토 스팟",
        link: "detail.html?month=3&pick=b"
      }
    ]
  },

  4: {
    featured: {
      badge: "APRIL PICK",
      img: "assets/images/spring2.jpg",
      alt: "4월 봄대표 이미지",
      title: "4월 봄 대표 여행지",
      desc: "4월 추천: 벚꽃 절정, 축제/야간명소",
      link: "detail.html?month=4&pick=featured"
    },
    subs: [
      {
        img: "assets/images/spring1.PNG",
        alt: "4월 서브 이미지 A",
        title: "4월 테마 여행지 A",
        desc: "4월 테마: 축제/드라이브 코스",
        link: "detail.html?month=4&pick=a"
      },
      {
        img: "assets/images/spring3.jpg",
        alt: "4월 서브 이미지 B",
        title: "4월 테마 여행지 B",
        desc: "4월 테마: 봄 감성 사진/야경",
        link: "detail.html?month=4&pick=b"
      }
    ]
  },

  5: {
    featured: {
      badge: "MAY PICK",
      img: "assets/images/spring3.jpg",
      alt: "5월 봄대표 이미지",
      title: "5월 봄 대표 여행지",
      desc: "5월 추천: 신록/초록, 피크닉/트레킹",
      link: "detail.html?month=5&pick=featured"
    },
    subs: [
      {
        img: "assets/images/spring1.PNG",
        alt: "5월 서브 이미지 A",
        title: "5월 테마 여행지 A",
        desc: "5월 테마: 피크닉/공원/초록",
        link: "detail.html?month=5&pick=a"
      },
      {
        img: "assets/images/spring2.jpg",
        alt: "5월 서브 이미지 B",
        title: "5월 테마 여행지 B",
        desc: "5월 테마: 트레킹/자연/힐링",
        link: "detail.html?month=5&pick=b"
      }
    ]
  }
};

// 검색 풀(간단히 title/desc에 키워드 포함이면 매칭)
const SEARCH_POOL = [
  ...Object.entries(MONTH_DATA).flatMap(([month, data]) => {
    const m = Number(month);
    const list = [];

    list.push({
      month: m,
      badge: data.featured.badge,
      img: data.featured.img,
      alt: data.featured.alt,
      title: data.featured.title,
      desc: data.featured.desc,
      link: data.featured.link
    });

    data.subs.forEach((s, idx) => {
      list.push({
        month: m,
        badge: "검색 결과",
        img: s.img,
        alt: s.alt,
        title: s.title,
        desc: s.desc,
        link: s.link
      });
    });

    return list;
  })
];

// ============================
// 2) DOM 유틸
// ============================
function $(sel) { return document.querySelector(sel); }
function $all(sel) { return document.querySelectorAll(sel); }

function scrollToMain() {
  const target = document.getElementById("mainArea");
  if (!target) return;
  target.scrollIntoView({ behavior: "smooth", block: "start" });
}

function setActiveMonthBtn(month) {
  $all(".btn-month").forEach(btn => {
    btn.classList.remove("btn-dark", "active");
    btn.classList.add("btn-outline-dark");
  });

  const active = document.querySelector(`.btn-month[data-month="${month}"]`);
  if (active) {
    active.classList.remove("btn-outline-dark");
    active.classList.add("btn-dark", "active");
  }
}

// ============================
// 3) 렌더링
// ============================
function renderFeatured(featured) {
  const img = $(".featured-img");
  const badge = $("#featuredBadge");
  const title = $("#featuredTitle");
  const desc = $("#featuredDesc");
  const link = $("#featuredLink");

  if (!img || !badge || !title || !desc || !link) return;

  img.src = featured.img;
  img.alt = featured.alt || "대표 이미지";
  badge.textContent = featured.badge || "";
  title.textContent = featured.title || "";
  desc.textContent = featured.desc || "";
  link.href = featured.link || "detail.html";
}

function renderSubs(subs, month) {
  const area = document.getElementById("subArea");
  if (!area) return;

  area.innerHTML = "";

  // 서브 2개 기준으로 만들었음 (원하면 3개도 가능)
  area.innerHTML = subs.map(item => `
    <div class="col-lg-6">
      <div class="card mb-4">
        <img class="card-img-top" src="${item.img}" alt="${item.alt || (month + "월 서브 이미지")}">
        <div class="card-body">
          <div class="small text-muted">봄 테마</div>
          <h2 class="card-title h4">${item.title}</h2>
          <p class="card-text">${item.desc}</p>
          <a class="btn btn-primary" href="${item.link}">자세히 보기 →</a>
        </div>
      </div>
    </div>
  `).join("");
}

function renderMonth(month) {
  const data = MONTH_DATA[month];
  if (!data) return;

  renderFeatured(data.featured);
  renderSubs(data.subs, month);
  setActiveMonthBtn(month);

  // URL month 유지
  const url = new URL(window.location.href);
  url.searchParams.set("month", String(month));
  history.replaceState(null, "", url.toString());
}

// ============================
// 4) 검색
// ============================
function search(keyword) {
  const kw = (keyword || "").trim().toLowerCase();
  if (!kw) return;

  const found = SEARCH_POOL.find(x =>
    (x.title || "").toLowerCase().includes(kw) ||
    (x.desc || "").toLowerCase().includes(kw)
  );

  if (!found) {
    alert("검색 결과가 없습니다.");
    return;
  }

  // 해당 월로 화면 맞추고
  renderMonth(found.month);

  // 찾은 결과를 메인(대표 카드)에 올려 보여주기
  renderFeatured({
    badge: found.badge,
    img: found.img,
    alt: "검색 결과 이미지",
    title: found.title,
    desc: `검색 결과: ${found.desc}`,
    link: found.link
  });

  scrollToMain();
}

// ============================
// 5) 이벤트 연결 + 초기 실행
// ============================
document.addEventListener("DOMContentLoaded", () => {
  // 월 버튼 클릭
  $all(".btn-month").forEach(btn => {
    btn.addEventListener("click", () => {
      const month = Number(btn.dataset.month);
      renderMonth(month);
      scrollToMain();
    });
  });

  // 검색
  const input = document.getElementById("searchInput");
  const btn = document.getElementById("searchBtn");

  if (btn && input) {
    btn.addEventListener("click", () => search(input.value));
    input.addEventListener("keydown", (e) => {
      if (e.key === "Enter") search(input.value);
    });
  }

  // 초기 월(쿼리스트링 있으면 그걸로)
  const params = new URLSearchParams(location.search);
  const startMonth = Number(params.get("month")) || 3;
  renderMonth(startMonth);
});
