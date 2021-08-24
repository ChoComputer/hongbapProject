<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
	<h1>게시물목록</h1>
	<!--  테이블 형태로 작성해보기
	출력할 자료들은
	
	글번호, 글제목,글쓴이,글쓴날짜,조회수 순으로 테이블에 출력하기
	JSTL의 forEach구문을 쓰되 items속성에 "${boardList }"를 넣어주면됨
-->
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>글쓴이</th>
				<th>쓴날자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td>${board.bId }</td>
					<td><a href ="/hongbapProject/boardDetail.do?bId=${board.bId}">${board.bTitle }</a></td>
					<td>${board.bName }</td>
					<td>${board.bDate }</td>
					<td>${board.bHit }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%-- 페이징 버튼 만들기 --%>
	<c:if test="${pageDTO.hasBoard()}">
	<%-- 표현할 글이 있다면 부트스트랩 페이징처리적용. --%>
	<ul class="pagination justify-content-center">
		<%-- 뒤로가기 버튼을 표시할지 말지 결정하는 부분 --%>
		<c:if test="${pageDTO.startPage>10 }">
		<%-- 1보다 크기만 해도 상관은없지만 직관적으로 표현하기위해 뒤로가기 링크를 10이상 으로 해놧음--%>
			<li class="page-item"><a class="page-link" href="/hongbapProject/boardSelect.do?page=${pageDTO.startPage-10 }">«</a></li>
		</c:if>
		
		<%--페이지 번호 10개 묶음을 깔아주는 부분 --%>
		<c:forEach var="pNo" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
			<li class="page-item"><a class="page-link" href="//hongbapProject/boardSelect.do?page=${pNo}">${pNo}</a></li>
		</c:forEach>
		
		<%-- 다음으로 가기 버튼을 표시할지 말지 결정하는 부분 --%>
		<c:if test="${pageDTO.endPage<pageDTO.totalPages }">
			<li class="page-item"><a class="page-link" href="/hongbapProject/boardSelect.do?page=${pageDTO.startPage+10 }">»</a></li>
		</c:if>
		
		</ul><%--페이징네이션 종료 --%>
	</c:if>
	<%-- 페이징 버튼 부분 끝 --%>
	<br/>
	<a href ="http://localhost:8181/hongbapProject/board/boardWrite.jsp"><input type="button"value="글쓰기"></a>
	<a href="/hongbapProject/logout.do"><input type="button" value="로그아웃"></a>
</body>
</html>