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
  const authArea = document.getElementById("authArea");
  const loginUser = localStorage.getItem("loginUser");

  if (!authArea) return;

  if (loginUser) {
    authArea.innerHTML = `
      <div class="dropdown">
        <button class="btn btn-outline-light dropdown-toggle"
                data-bs-toggle="dropdown">
          ${loginUser}님
        </button>
        <ul class="dropdown-menu dropdown-menu-end">
          <li><a class="dropdown-item" href="favorites.html">찜 목록</a></li>
          <li><hr class="dropdown-divider"></li>
          <li>
            <button class="dropdown-item" id="logoutBtn">로그아웃</button>
          </li>
        </ul>
      </div>
    `;

    document.getElementById("logoutBtn").addEventListener("click", () => {
      localStorage.removeItem("loginUser");
      location.reload();
    });
  }
});


