<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="UTF-8"/> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 페이지</title>
    <link rel="stylesheet" href="${path}/css/inquiries.css" >
	<link rel="stylesheet" href="${path}/com/bootstrap.min.css" >
	<script src="${path}/com/jquery-3.7.1.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		let msg = "${msg}" // 모델에 등록 성공 메시지를 가져올 때 처리 하는 내용..
		if(msg!=''){ // 초기 등록화면과 구분하기 위해..
			if(confirm(msg+"\n조회화면 이동하시겠습니까?")){
				location.href="inquiryList"
			}
		}
		$("#lstBtn").click(function(){
			location.href="inquiryList"
		})
	});
	</script>
</head>
<body>
    <div class="form-container">
        <h2>문의 하기</h2>
        <!-- form 요소의 action 속성에는 데이터가 전송될 서버 측 URL을 지정합니다 -->
        <form method="POST" >
            <div class="form-group">
                <label for="title">유형:</label>
                <!-- 제목 입력 필드 -->
                <input type="text" id="inquiryType" name="inquiryType" required>
            </div>
            <div class="form-group">
                <label for="content">내용:</label>
                <!-- 내용 입력 필드 -->
                <textarea id="content" name="content" rows="10" required></textarea>
            </div>
            <div class="button-group">
                <!-- 제출 버튼: 클릭 시 form 데이터가 서버로 전송됩니다 -->
                <button type="submit">제출</button>
                <!-- 취소 버튼 (reset): 클릭 시 form 내의 모든 입력 필드가 초기화됩니다 -->
                <button type="reset">취소</button>
                <!-- 또는 <input type="submit" value="제출">, <input type="reset" value="취소"> 사용 가능 -->
				<button id="lstBtn" type="button" class="btn btn-info">메인</button>              
            </div>
        </form>
    </div>

</body>
</html>