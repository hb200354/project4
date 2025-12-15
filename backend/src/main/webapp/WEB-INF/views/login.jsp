<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Login - Member</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Optional: 네가 만든 CSS도 적용 가능 -->
    <link rel="stylesheet" href="/com/fall.css">
</head>
<body>

<!-- 상단 네비 (블로그 템플릿 스타일 유지) -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="/">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="/contact">Contact</a></li>
                <li class="nav-item"><a class="nav-link active" href="/login">Login</a></li>
            </ul>
        </div>
    </div>
</nav>


<!-- 메인 로그인 카드 -->
<section class="py-5">
    <div class="container px-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">

                <div class="card shadow">
                    <div class="card-body p-4">

                        <h3 class="text-center mb-4">로그인</h3>

                        <!-- 로그인 폼 -->
                        <form action="/loginProc" method="post">

                            <!-- ID -->
                            <div class="mb-3">
                                <label class="form-label">아이디</label>
                                <input type="text" name="id" class="form-control" placeholder="아이디 입력" required>
                            </div>

                            <!-- PW -->
                            <div class="mb-3">
                                <label class="form-label">비밀번호</label>
                                <input type="password" name="pw" class="form-control" placeholder="비밀번호 입력" required>
                            </div>

                            <!-- 버튼 -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">로그인</button>
                            </div>
                        </form>

                        <hr>

                        <!-- 회원가입 링크 -->
                        <div class="text-center">
                            <a href="/join">아직 회원이 아니신가요? → 회원가입</a>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</section>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- http://localhost:5050/login -->
</body>
</html>
