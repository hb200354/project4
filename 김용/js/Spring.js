document.addEventListener("DOMContentLoaded", () => {
  const mainList = document.getElementById("mainImageList");
  const buttons = document.querySelectorAll(".btn-month");
  const searchInput = document.getElementById("searchInput");
  const searchBtn = document.getElementById("searchBtn");

  // 🌸 대표 이미지 데이터 (항상 3개)
  const mainData = {
    3: [
      { title: "3월 여행지 A", img: "/imgs/spring1.png" },
      { title: "3월 여행지 B", img: "/imgs/spring2.jpg" },
      { title: "3월 여행지 C", img: "/imgs/spring3.jpg" }
    ],
    4: [
      { title: "4월 여행지 A", img: "/imgs/spring2.jpg" },
      { title: "4월 여행지 B", img: "/imgs/spring3.jpg" },
      { title: "4월 여행지 C", img: "/imgs/spring1.png" }
    ],
    5: [
      { title: "5월 여행지 A", img: "/imgs/spring3.jpg" },
      { title: "5월 여행지 B", img: "/imgs/spring1.png" },
      { title: "5월 여행지 C", img: "/imgs/spring2.jpg" }
    ]
  };

  let currentMont} =

