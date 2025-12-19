<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="UTF-8"/> 
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/com/bootstrap.min.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/com/jquery-3.7.1.js"></script>
<script src="${path}/com/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#regBtn").click(function(){
			location.href="inquiryInsert"
		})
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
	<h2>문의 리스트</h2>

</div>
<%-- 
검색되는 값 where 조건 ==> 요청값 groupName, fandomName ==> DTO (A04Group)
	<input name="groupName"	<input name="fandomName"
출력하는 데이터 ==> 테이블에 리스트 ==> DTO List
	테이블의 타이틀명 : 그룹번호 그룹명 데뷰날짜 팬그룹이름

--%>
<div class="container">
	<form id="frm01" class="form">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="질문유형입력" name="inquiryType" value="${param.inquiryType}" class="form-control mr-sm-2" />
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-success" id="regBtn"
	        type="button">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="10%">
   	<col width="20%">
   	<col width="45%">
   	<col width="15%">
    <thead>
    
      <tr class="table-success text-center">
        <th>문의번호</th>
        <th>회원ID</th>
        <th>질문유형</th>
        <th>내용</th>
        <th>등록일자</th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="inq" items="${inqList}">
    	<tr><td>${inq.inquiryId}</td><td>${inq.userId}</td><td>${inq.inquiryType}</td><td>${inq.content}</td><td><fmt:formatDate value="${inq.regDate}"/></td></tr>
    	</c:forEach>
    </tbody>
	</table>    
    
</div>
</body>
</html>