<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/board/write_ok" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${id}"> <input
			type="hidden" name="modify" value="${modify}"> 제목 : <input
			type="text" name="title" size=40 value="${board.title}"><br />

		<textarea name="contents" rows="10" cols="50"
			placeholder="글자를 입력해주세요.">${board.contents}</textarea>

		<br />
		<input type="file" name="file" /><br> <input type="submit"
			value="보내기">
	</form>
</body>
</html>