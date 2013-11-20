<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newWrite.css" />
<title>GGP</title>
</head>
<body>
	<div class=sub_wrap>
		<header>
			<h1 class=title>Login</h1>
		</header>
		<div id=formarea>
			<form action="/user/login_check" method="POST" enctype = "multipart/form-data">
				<div style = "padding-top:10px;">
					Email <input type="text" name="email" placeholder = "email" class = "insert01"><br>
					Password <input type="password" name="password" placeholder = "password" class = "insert02"><br>
					<input type="submit" name="login" value="login" class = "btn_wide">
				</div>
			</form>
		</div>
	</div>
</body>
</html>


