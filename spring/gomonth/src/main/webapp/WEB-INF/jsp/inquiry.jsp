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

    <header style="background-color: #111; position: fixed; width: 100%; top: 0; z-index: 1000;">
        <%@ include file="nav.jsp" %>
    </header>

    <div class="container inquiry-wrapper">
        <div class="inquiry-main-card card">
            
            <div class="inq-header-section text-center">
                <h1 class="display-4 fw-bold mb-3">
                    ${sessionScope.loginUser.role == 'ADMIN' ? 'Management Center' : 'Customer Support'}
                </h1>
                <p class="text-muted lead">
                    ${sessionScope.loginUser.role == 'ADMIN' ? '모든 사용자의 문의 내역을 관리하고 답변합니다.' : '궁금하신 점을 남겨주시면 정성껏 답변해 드립니다.'}
                </p>
            </div>

            <c:if test="${sessionScope.loginUser.role != 'ADMIN'}">
                <div class="inquiry-form-card shadow-sm">
                    <h4 class="fw-bold mb-4"><i class="fa-solid fa-pen-to-square me-2"></i>새 문의 작성</h4>
                    <form action="<%=cpath%>/inquiry/insert" method="post">
                        <input type="text" name="title" class="form-control form-control-lg border-0 bg-white mb-3 shadow-sm" placeholder="제목을 입력하세요" required>
                        <textarea name="content" class="form-control border-0 bg-white mb-4 shadow-sm" rows="6" placeholder="내용을 상세히 입력해 주세요" required></textarea>
                        <button type="submit" class="btn btn-dark btn-lg w-100 py-3 fw-bold rounded-pill">등록하기</button>
                    </form>
                </div>
            </c:if>

            <div class="inq-list-container">
                <h4 class="fw-bold mb-4">
                    <i class="fa-solid fa-list-ul me-2"></i>
                    ${sessionScope.loginUser.role == 'ADMIN' ? '전체 문의 데이터' : '나의 문의 기록'}
                </h4>
                
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
                                        <label class="text-muted small fw-bold text-uppercase mb-2 d-block">Question</label>
                                        <div class="fs-5 text-dark">${inq.content}</div>
                                        <div class="text-muted mt-3 small">
                                            <i class="fa-regular fa-clock me-1"></i> 
                                            <fmt:formatDate value="${inq.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                                        </div>
                                    </div>

                                    <c:if test="${not empty inq.ansContent}">
                                        <div class="admin-answer-zone">
                                            <h6 class="fw-bold text-primary mb-3"><i class="fa-solid fa-comment-dots me-2"></i>GO-MONTH Answer</h6>
                                            <div class="fs-5">${inq.ansContent}</div>
                                            <div class="text-muted mt-3 small">답변일: <fmt:formatDate value="${inq.answeredAt}" pattern="yyyy-MM-dd HH:mm"/></div>
                                        </div>
                                    </c:if>

                                    <c:if test="${sessionScope.loginUser.role == 'ADMIN'}">
                                        <div class="mt-5 pt-4 border-top">
                                            <textarea id="replyText${inq.inqId}" class="form-control border-0 bg-light p-4 mb-3" rows="4" placeholder="답변을 입력하세요">${inq.ansContent}</textarea>
                                            <div class="text-end">
                                                <button class="btn btn-primary px-5 py-2 fw-bold rounded-pill" onclick="saveReply(${inq.inqId})">답변 저장</button>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${sessionScope.loginUser.userId == inq.userId && inq.status == '접수'}">
                                        <div class="text-end mt-4">
                                            <button class="btn btn-outline-secondary btn-sm px-3 rounded-pill me-2" onclick="openEditModal(${inq.inqId}, '${inq.title}', '${inq.content}')">수정</button>
                                            <button class="btn btn-outline-danger btn-sm px-3 rounded-pill" onclick="deleteInq(${inq.inqId})">삭제</button>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty myInqList}">
                        <div class="text-center py-5">
                            <p class="text-muted">내역이 존재하지 않습니다.</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg" style="border-radius: 25px;">
                <div class="modal-body p-5">
                    <h4 class="fw-bold mb-4">문의 수정하기</h4>
                    <input type="hidden" id="editInqId">
                    <input type="text" id="editTitle" class="form-control mb-3 p-3 bg-light border-0" placeholder="제목">
                    <textarea id="editContent" class="form-control p-3 bg-light border-0" rows="5" placeholder="내용"></textarea>
                    <div class="mt-4 d-flex gap-2">
                        <button class="btn btn-dark w-100 py-3 fw-bold rounded-pill" onclick="updateInq()">수정완료</button>
                        <button class="btn btn-light w-100 py-3 fw-bold rounded-pill" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function saveReply(id) {
            const reply = $("#replyText" + id).val();
            if(!reply) return alert("내용을 입력하세요.");
            $.post("<%=cpath%>/inquiry/answer", { inqId: id, reply: reply }, function(res) {
                if(res === "success") { alert("성공적으로 저장되었습니다."); location.reload(); }
            });
        }
        function openEditModal(id, title, content) {
            $("#editInqId").val(id); $("#editTitle").val(title); $("#editContent").val(content);
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