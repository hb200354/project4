<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>${place.title}</title>
  <script src="/js/summer.js"></script>
</head>
<body>

<h2>${place.title}</h2>
<p>${place.location}</p>

<img src="${place.mainImage}" width="500">

<hr>

<!-- 상세 설명 -->
<c:forEach var="desc" items="${descList}">
  <p>${desc.content}</p>
</c:forEach>

<hr>

<button onclick="goBack()">← 목록으로</button>

</body>
</html>