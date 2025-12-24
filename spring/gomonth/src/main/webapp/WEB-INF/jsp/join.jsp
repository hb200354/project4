<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입 | GO-MONTH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet">
</head>
<body class="bg-white">
  <%@ include file="header.jsp" %>
    <%@ include file="nav.jsp" %>

    <div class="d-md-flex min-vh-100">
        <div class="col-md-6 d-none d-md-block" 
             style="background: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.2)), url('<%=request.getContextPath()%>/assets/images/join.jpg') no-repeat center center / cover;">
            <div class="h-100 d-flex flex-column justify-content-end p-5 text-white">
                <h2 class="display-5 fw-bold mb-3">GO-MONTH</h2>
                <p class="lead">당신만의 계절을 찾아서,<br>GO-MONTH와 함께 떠나보세요.</p>
            </div>
        </div>

        <div class="col-md-6 d-flex align-items-center justify-content-center p-5">
            <div class="w-100" style="max-width: 450px;">
                <div class="mb-5">
                    <h2 class="fw-800 text-dark">회원가입</h2>
                    <p class="text-muted small">필요한 정보를 입력하여 계정을 만들어보세요.</p>
                </div>

                <form action="<%=request.getContextPath()%>/join" method="post">
                    <div class="mb-3">
                        <input type="text" name="userId" class="form-control border-0 bg-light py-3" placeholder="아이디" required style="border-radius:12px;">
                    </div>
                    
                    <div class="mb-3">
                        <input type="text" name="userName" class="form-control border-0 bg-light py-3" placeholder="사용할 닉네임" required style="border-radius:12px;">
                    </div>

                    <div class="row mb-3">
                        <div class="col-6">
                            <input type="password" name="userPw" id="userPw" class="form-control border-0 bg-light py-3" placeholder="비밀번호" required style="border-radius:12px;">
                        </div>
                        <div class="col-6">
                            <input type="password" id="userPwConfirm" class="form-control border-0 bg-light py-3" placeholder="비밀번호 확인" required style="border-radius:12px;">
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <input type="email" name="email" class="form-control border-0 bg-light py-3" placeholder="이메일 주소" required style="border-radius:12px;">
                    </div>
                    
                    <button type="submit" class="btn btn-primary w-100 py-3 fw-bold mb-4" style="border-radius:12px;">회원가입</button>
                    
                    <div class="text-center text-muted small">
                        이미 회원이신가요? <a href="<%=request.getContextPath()%>/login" class="text-primary fw-bold text-decoration-none ms-1">로그인</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>