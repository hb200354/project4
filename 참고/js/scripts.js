/*!
* Start Bootstrap - Blog Home v5.0.9 (https://startbootstrap.com/template/blog-home)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-blog-home/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project
// ===============================
// 로그인 영역 UI (연결 대기 상태)
// ===============================

document.addEventListener("DOMContentLoaded", () => {
  /* =========================
     로그인 영역 처리
  ========================= */
  const authArea = document.getElementById("authArea");
  const loginUser = localStorage.getItem("loginUser");

  if (authArea) {
    if (loginUser) {
      authArea.innerHTML = `
        <div class="dropdown">
          <button class="btn btn-outline-light dropdown-toggle"
                  data-bs-toggle="dropdown">
            ${loginUser}
          </button>
          <ul class="dropdown-menu dropdown-menu-end">
            <li>
              <a class="dropdown-item" href="favorites.html">찜 목록</a>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li>
              <button class="dropdown-item" id="logoutBtn">로그아웃</button>
            </li>
          </ul>
        </div>
      `;

      document
        .getElementById("logoutBtn")
        ?.addEventListener("click", () => {
          localStorage.removeItem("loginUser");
          location.reload();
        });
    }
  }

  /* =========================
     가을 월별 필터 처리
  ========================= */
  const monthButtons = document.querySelectorAll(".btn-month");
  const travelItems = document.querySelectorAll(".travel-item");

  if (monthButtons.length && travelItems.length) {
    monthButtons.forEach(btn => {
      btn.addEventListener("click", () => {
        // 버튼 스타일
        monthButtons.forEach(b => {
          b.classList.remove("btn-dark", "active");
          b.classList.add("btn-outline-dark");
        });

        btn.classList.remove("btn-outline-dark");
        btn.classList.add("btn-dark", "active");

        const selectedMonth = btn.dataset.month;

        travelItems.forEach(item => {
          const months = item.dataset.month;

          if (selectedMonth === "all") {
            item.style.display = "block";
            return;
          }

          if (months && months.split(",").includes(selectedMonth)) {
            item.style.display = "block";
          } else {
            item.style.display = "none";
          }
        });
      });
    });
  }
});



