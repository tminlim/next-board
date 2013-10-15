<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/board">리스트</a>
	<h1>${board.title}</h1>
	<img src="/images/${board.filename}" />
	<div>${board.contents}</div>
<a href="./${id}/modify">수정</a>
<a href="./${id}/delete">삭제</a>
</body>
</html>

</body>
</html>