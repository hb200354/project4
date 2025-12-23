<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>여름 여행지</title>
  <script src="/js/summer.js"></script>
</head>
<body>

<h2>여름 여행지</h2>

<!-- 월 버튼 -->
<div>
  <button onclick="goMonth(6)">6월</button>
  <button onclick="goMonth(7)">7월</button>
  <button onclick="goMonth(8)">8월</button>
</div>

<hr>

<!-- 여행지 리스트 -->
<div>
  <c:forEach var="place" items="${list}">
    <div style="border:1px solid #ccc; padding:10px; margin:10px; cursor:pointer;"
         onclick="goDetail(${place.placeId})">

      <img src="${place.subImage}" width="200"><br>

      <strong>${place.title}</strong><br>
      <span>${place.location}</span><br>
      <small>${place.recommendSeason}</small>

    </div>
  </c:forEach>
</div>

</body>
</html>