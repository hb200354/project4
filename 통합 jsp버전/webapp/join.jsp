<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>회원가입 | GO-MONTH</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="/WEB-INF/jsp/header.jsp" />

<div class="container my-5" style="max-width: 500px;">
  <h1 class="fw-bold mb-4 text-center">회원가입</h1>

  <form action="#" method="post">
    <div class="mb-3">
      <label class="form-label">아이디</label>
      <input type="text" class="form-control" name="username" placeholder="아이디 입력" required />
    </div>

    <div class="mb-3">
      <label class="form-label">비밀번호</label>
      <input type="password" class="form-control" name="password" placeholder="비밀번호 입력" required />
    </div>

    <div class="mb-3">
      <label class="form-label">비밀번호 확인</label>
      <input type="password" class="form-control" name="passwordConfirm" placeholder="비밀번호 재입력" required />
    </div>

    <div class="mb-3">
      <label class="form-label">이메일</label>
      <input type="email" class="form-control" name="email" placeholder="example@email.com" required />
    </div>

    <button type="submit" class="btn btn-primary w-100">회원가입</button>
  </form>

  <div class="text-center mt-3">
    <a href="login.jsp">이미 계정이 있으신가요? 로그인</a>
  </div>
</div>

<jsp:include page="/WEB-INF/jsp/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
