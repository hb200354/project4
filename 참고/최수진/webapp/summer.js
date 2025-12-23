/* =========================
   여름 페이지 공통 JS
   ========================= */

/* 월별 페이지 이동 */
function goMonth(month) {
  location.href = "/summer?month=" + month;
}

/* 여행지 상세 페이지 이동 */
function goDetail(placeId) {
  location.href = "/summer/detail?placeId=" + placeId;
}

/* 뒤로 가기 */
function goBack() {
  history.back();
}