<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/board">리스트</a>
	<h1>${board.title}</h1>
	<c:if test="${board.filename != null}">
		이미지: <img src="/images/${board.filename}" />
	</c:if>
	<div>${board.contents}</div>
	<a href="./${id}/modify">수정</a>
	<a href="./${id}/delete">삭제</a>
	
	
	<div>
		<form action="/board/${board.id}/comment" method="POST">
		<textarea name="contents" rows = "5" cols="50" placeholder ="댓글입력해요 "></textarea>
		<input type ="submit" name="submit" value="댓글입력"/>
		</form>
	</div>
	<c:forEach items="${board.comments}" var="comment">
	<div>${comment.contents}
	</div>
	<hr/>
	
	
	
	
	
	</c:forEach>


</body>
</html>

</body>
</html>