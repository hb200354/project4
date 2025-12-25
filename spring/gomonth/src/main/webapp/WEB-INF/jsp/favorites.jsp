<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <title>내 찜 목록 | GO-MONTH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="bg-light">
    <%@ include file="nav.jsp" %>

    <div class="container py-5">
        <div class="row">
            <div class="col-lg-8">
                <div class="card shadow-sm border-0 p-4" style="border-radius:15px;">
                    <h4 class="fw-bold mb-4">❤️ ${sessionScope.loginUser.userName}님의 찜 목록</h4>
                    
                    <c:choose>
                        <c:when test="${empty favoritePlaces}">
                            <div class="text-center py-5">
                                <p class="text-muted">아직 찜한 여행지가 없습니다.</p>
                                <a href="${pageContext.request.contextPath}/spring" class="btn btn-primary">여행지 보러가기</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="place" items="${favoritePlaces}">
                                <div class="d-flex align-items-center justify-content-between mb-3 pb-3 border-bottom fav-item-${place.placeId}">
                                    <div class="d-flex align-items-center gap-3">
                                        <img src="${pageContext.request.contextPath}/assets/images/${place.seasonType}/${place.listImg}" 
                                            style="width:100px; height:75px; object-fit:cover; border-radius:10px;"
                                            onerror="this.src='${pageContext.request.contextPath}/assets/images/default_list.jpg'">
                                        <div>
                                            <div class="fw-bold fs-5">${place.title}</div>
                                            <div class="small text-muted text-truncate" style="max-width: 300px;">${place.summary}</div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex align-items-center gap-2">
                                        <a href="${pageContext.request.contextPath}/detail?id=${place.placeId}" class="btn btn-sm btn-outline-primary rounded-pill px-3">상세보기</a>
                                        
                                        <button type="button" class="btn btn-link text-danger p-0" onclick="deleteFav('${place.placeId}')" title="찜 해제">
                                            <i class="fa-solid fa-heart fa-2xl"></i>
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>

                            <script>
                            function deleteFav(pId) {
                                if(!confirm("찜 목록에서 제거할까요?")) return;
                                
                                $.post("${pageContext.request.contextPath}/favorites/delete", { placeId: pId }, function(res) {
                                    if(res === "success") {
                                        // 해당 항목 부드럽게 삭제
                                        $(".fav-item-" + pId).fadeOut(400, function() {
                                            $(this).remove();
                                            // 만약 모두 삭제했다면 새로고침해서 빈 화면 보여주기
                                            if($(".border-bottom").length === 0) {
                                                location.reload();
                                            }
                                        });
                                    } else {
                                        alert("삭제에 실패했습니다. 다시 시도해 주세요.");
                                    }
                                });
                            }
                            </script>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>


            <div class="col-lg-4">
                <div class="card border-0 shadow-sm mb-4" style="border-radius:15px;">
                    <div class="card-header bg-white fw-bold py-3 border-0">바로가기</div>
                    <div class="card-body d-grid gap-2 pt-0">
                        <a class="btn btn-primary py-2 fw-bold" href="${pageContext.request.contextPath}/spring">🌸 봄 여행지</a>
                        <a class="btn btn-success py-2 fw-bold" href="${pageContext.request.contextPath}/summer">🌿 여름 여행지</a>
                        <a class="btn py-2 fw-bold text-white" href="${pageContext.request.contextPath}/fall" style="background-color: #fd7e14;">🍁 가을 여행지</a>
                        <a class="btn btn-info py-2 fw-bold text-white" href="${pageContext.request.contextPath}/winter">❄️ 겨울 여행지</a>
                        <hr class="my-2">
                        <a class="btn btn-outline-secondary py-2" href="${pageContext.request.contextPath}/inquiry">문의하기</a>
                    </div>
                </div>

                <div class="card border-0 shadow-sm" style="border-radius:15px; background-color: #f8f9fa;">
                    <div class="card-body">
                        <p class="small text-muted mb-0">
                            <i class="fa-solid fa-circle-info me-1"></i> 찜 목록은 최근 등록순으로 표시됩니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>