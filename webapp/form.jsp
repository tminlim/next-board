<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newWrite.css" />
</head>
<body role="document">
	<div class=wrap>
		<header>
			<h1 class=title>BOARD</h1>
		</header>
		<div id=formarea>
			<form action="/board/write" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${id}"><inputs
					type="hidden" name="modify" value="${modify}"><input
					type="text" name="title" placeholder="제목" value="${board.title}"><br />
				<textarea name="contents" placeholder="글자를 입력해주세요.">${board.contents}</textarea>
					<div id="file_upload">
					<input type = "file" id="upload"  onchange ="getElementById()"  name="file_upload" class = "btn_upload"></div>
				<input type="submit" value="보내기" class="btn">
<!--<input type="text" onchange="myFunction()">Execute a JavaScript when a user changes the content of an input field:
 -->
			</form>
		</div>
	</div>


</body>
</html>