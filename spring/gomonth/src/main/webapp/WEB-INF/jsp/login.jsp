<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인 | GO-MONTH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">
</head>
<body class="bg-white">
  <%@ include file="header.jsp" %>
    <%@ include file="nav.jsp" %>

    <div class="d-md-flex min-vh-100">
        <div class="col-md-6 d-none d-md-block" 
             style="background: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.2)), url('<%=request.getContextPath()%>/assets/images/login.jpg') no-repeat center center / cover;">
            <div class="h-100 d-flex flex-column justify-content-end p-5 text-white">
                <h2 class="display-5 fw-bold mb-3">GO-MONTH</h2>
                <p class="lead">가장 아름다운 계절에,<br>당신을 기다리는 여행지가 있습니다.</p>
            </div>
        </div>

        <div class="col-md-6 d-flex align-items-center justify-content-center p-5">
            <div class="w-100" style="max-width: 400px;">
                <div class="mb-5">
                    <h2 class="fw-800 text-dark">로그인</h2>
                    <p class="text-muted small">계정을 입력하고 여행을 시작하세요.</p>
                </div>

                <form action="<%=request.getContextPath()%>/login" method="post" class="auth-form">
                    <div class="mb-3">
                        <label class="small fw-bold text-secondary mb-1">ID</label>
                        <input type="text" name="userId" class="form-control form-control-lg border-0 bg-light" placeholder="아이디" required style="border-radius:15px;">
                    </div>
                    <div class="mb-4">
                        <label class="small fw-bold text-secondary mb-1">Password</label>
                        <input type="password" name="userPw" class="form-control form-control-lg border-0 bg-light" placeholder="비밀번호" required style="border-radius:15px;">
                    </div>
                    <button type="submit" class="btn btn-primary w-100 py-3 fw-bold mb-4" style="border-radius:15px;">로그인하기</button>
                    
                    <div class="text-center">
                        <span class="text-muted small">아직 계정이 없으신가요?</span>
                        <a href="<%=request.getContextPath()%>/join" class="text-primary fw-bold text-decoration-none ms-2 small">회원가입</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        const errorMsg = "${error}";
        if (errorMsg) {
            alert(errorMsg);
        }
    </script>
</body>
</html>