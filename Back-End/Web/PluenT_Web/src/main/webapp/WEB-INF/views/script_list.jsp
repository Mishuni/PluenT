<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
					"http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>나의 발표관리</title>

</head>

<body>
	
	<header>
		<img id="logo" alt="" 
		src="https://mblogthumb-phinf.pstatic.net/20160622_73/hhtthh82_1466581509899OrBaG_PNG/%B3%D7%C0%CC%B9%F6-%B7%CE%B0%ED-%B0%ED%C8%AD%C1%FA.png?type=w800"
		width="5%">

		<a href="mypage">마이페이지</a> 
		<a href="logout">로그아웃</a>
	</header>

	<nav > 		
		<ul  id="topMenu">
			<li><a class="menuLink" href="newscript">스크립트번역</a></li>
			<li><a class="menuLink" href="#">발표연습</a></li>
			<li><a class="menuLink" href="alllecture">강의보기</a></li>
			<li><a class="menuLink" href="scriptlist">나의 발표관리</a></li>
		</ul>
	</nav>

	<section>
		
		<table>
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>발표예상시간(s)</th>
				<th>저장일</th>
			</tr>
			<c:forEach items="${scriptlist }" var="vo">
				<tr> 
				<td><a href="/plt/onescript?script_id=${vo.script_id }">${vo.script_id }</a></td>
				<td>  ${vo.title}</td>
				<td> ${vo.pttime /1000} </td>
				<td> ${vo.regdate} </td>
				</tr>
			</c:forEach>
		</table>
	</section>
	
	<section>

	</section>

	<footer>
	회사소개
	</footer>
</body>

</html>