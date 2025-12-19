<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>로그인 | GO-MONTH</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header.jsp" />

<div class="container my-5" style="max-width: 420px;">
  <h1 class="fw-bold mb-4 text-center">로그인</h1>

  <form action="#" method="post">
    <div class="mb-3">
      <label class="form-label">아이디</label>
      <input type="text" class="form-control" name="username" placeholder="아이디 입력" required />
    </div>

    <div class="mb-3">
      <label class="form-label">비밀번호</label>
      <input type="password" class="form-control" name="password" placeholder="비밀번호 입력" required />
    </div>

    <button type="submit" class="btn btn-primary w-100">로그인</button>
  </form>

  <div class="text-center mt-3">
    <a href="join.jsp">회원가입</a>
  </div>
</div>

<jsp:include page="/WEB-INF/jsp/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>