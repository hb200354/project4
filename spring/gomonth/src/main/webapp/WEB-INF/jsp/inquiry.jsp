<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cpath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문의관리 | GO-MONTH</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=cpath%>/css/styles.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body class="bg-light">

    <header style="background-color: #111;">
        <%@ include file="nav.jsp" %>
    </header>

    <div class="container inquiry-container">
        <div class="inquiry-card card p-4 p-md-5">
            <div class="d-flex justify-content-between align-items-center mb-5">
                <h2 class="fw-bold mb-0">
                    <i class="fa-solid fa-comments me-2 text-primary"></i>
                    ${sessionScope.loginUser.role == 'ADMIN' ? '관리자 문의 센터' : '고객 센터'}
                </h2>
                <span class="text-muted small">홈 > 고객지원</span>
            </div>

            <c:if test="${sessionScope.loginUser.role != 'ADMIN'}">
                <div class="inquiry-form-section shadow-sm">
                    <h5 class="fw-bold mb-3">새 문의하기</h5>
                    <form action="<%=cpath%>/inquiry/insert" method="post">
                        <input type="text" name="title" class="form-control mb-3" placeholder="제목을 입력하세요" required>
                        <textarea name="content" class="form-control mb-3" rows="4" placeholder="문의 내용을 상세히 작성해주세요" required></textarea>
                        <button type="submit" class="btn btn-dark w-100 py-3 fw-bold">문의 등록</button>
                    </form>
                </div>
            </c:if>

            <div class="inq-list-container">
                <h4 class="fw-bold mb-4">내역 리스트</h4>
                <div class="accordion accordion-flush" id="inquiryAccordion">
                    <c:forEach var="inq" items="${myInqList}">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${inq.inqId}">
                                    <span class="status-badge-custom ${inq.status == '접수' ? 'bg-warning text-dark' : 'bg-primary text-white'}">
                                        ${inq.status}
                                    </span>
                                    <c:if test="${sessionScope.loginUser.role == 'ADMIN'}">
                                        <span class="text-primary fw-bold me-2">[${inq.userId}]</span>
                                    </c:if>
                                    <span class="text-dark fw-bold">${inq.title}</span>
                                </button>
                            </h2>
                            <div id="collapse${inq.inqId}" class="accordion-collapse collapse" data-bs-parent="#inquiryAccordion">
                                <div class="accordion-body inq-content-box">
                                    <div class="mb-5">
                                        <label class="text-muted small fw-bold mb-2 d-block">CONTENT</label>
                                        <div class="fs-5">${inq.content}</div>
                                        <div class="text-muted mt-3 small"><fmt:formatDate value="${inq.createdAt}" pattern="yyyy-MM-dd HH:mm"/></div>
                                    </div>

                                    <c:if test="${not empty inq.ansContent}">
                                        <div class="admin-answer-zone">
                                            <h6 class="fw-bold text-primary mb-3">관리자 답변</h6>
                                            <div class="fs-5">${inq.ansContent}</div>
                                            <div class="text-muted mt-3 small">답변일: <fmt:formatDate value="${inq.answeredAt}" pattern="yyyy-MM-dd HH:mm"/></div>
                                        </div>
                                    </c:if>

                                    <c:if test="${sessionScope.loginUser.role == 'ADMIN'}">
                                        <div class="mt-5 pt-4 border-top">
                                            <textarea id="replyText${inq.inqId}" class="form-control border-0 bg-light p-4 mb-3" rows="4">${inq.ansContent}</textarea>
                                            <div class="text-end">
                                                <button class="btn btn-primary px-5 py-2 fw-bold rounded-pill" onclick="saveReply(${inq.inqId})">답변 저장</button>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${sessionScope.loginUser.userId == inq.userId && inq.status == '접수'}">
                                        <div class="text-end mt-4">
                                            <button class="btn btn-link text-muted me-2" onclick="openEditModal(${inq.inqId}, '${inq.title}', '${inq.content}')">수정</button>
                                            <button class="btn btn-link text-danger" onclick="deleteInq(${inq.inqId})">삭제</button>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty myInqList}"><div class="text-center py-5">내역이 없습니다.</div></c:if>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg" style="border-radius: 20px;">
                <div class="modal-header border-0 pb-0"><h5 class="fw-bold">문의 수정</h5></div>
                <div class="modal-body p-4">
                    <input type="hidden" id="editInqId">
                    <input type="text" id="editTitle" class="form-control mb-3 p-3 bg-light border-0" placeholder="제목">
                    <textarea id="editContent" class="form-control p-3 bg-light border-0" rows="5" placeholder="내용"></textarea>
                </div>
                <div class="modal-footer border-0 pt-0">
                    <button class="btn btn-dark px-4" onclick="updateInq()">수정 완료</button>
                    <button class="btn btn-light px-4" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function saveReply(id) {
            const reply = $("#replyText" + id).val();
            if(!reply) return alert("답변을 입력하세요.");
            $.post("<%=cpath%>/inquiry/answer", { inqId: id, reply: reply }, function(res) {
                if(res === "success") location.reload();
            });
        }
        function openEditModal(id, title, content) {
            $("#editInqId").val(id);
            $("#editTitle").val(title);
            $("#editContent").val(content);
            new bootstrap.Modal(document.getElementById('editModal')).show();
        }
        function updateInq() {
            const data = { inqId: $("#editInqId").val(), title: $("#editTitle").val(), content: $("#editContent").val() };
            $.post("<%=cpath%>/inquiry/update", data, function(res) {
                if(res === "success") location.reload();
            });
        }
        function deleteInq(id) {
            if(confirm("정말 삭제하시겠습니까?")) {
                $.post("<%=cpath%>/inquiry/delete", { inqId: id }, function(res) {
                    if(res === "success") location.reload();
                });
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>