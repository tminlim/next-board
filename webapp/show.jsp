<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GGP</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newWrite.css" />
</head>
<body>
	<div class = "wrap">
		<h1 class ="title">
			<a href="/board">리스트</a>
		</h1>


						<div class = "listWrap" style = "padding-top:50px; width: 350px;">
							<div class = "title"><h2>${board.title}</h2></div>
					
							<div class = "detail">${board.contents}</div>
							<div class = "pics">
								<c:if test="${board.filename != null}">
									<a href = "/board/${board.id }"><img src="/images/${board.filename}" width="100" height="100" /></a>
								</c:if>
							</div>		
							<div class = "btns" style = "margin-top: 15px;">
<%-- 											<a href="./${id}/modify">수정</a>
											<a href="./${id}/delete">삭제</a> --%>
								<a href="/board/${board.id}/modify"><input type = "submit" class = "btn" value= "수정" style = "border-style:none; float: left; margin-right:10px;"></a>
								<a href="/board/${board.id}/delete"><input type = "submit" class = "btn02" value= "삭제" style = "border-style:none;"></a>
							</div>
						</div>
						<div class = "listWrap02">
							<div class = "comments">
								<div class = "commentBox">
									<form action="/board/${board.id}/comment" method="POST">
										<textarea name="contents" placeholder="댓글입력해요 " class = "commentarea"></textarea>
										<input type="submit" name="submit" value="댓글" class = "btn"/>
									</form>
								</div>
								<div class = "countComment">
								 	<span></span>
								</div>
								<a href = # class = "showComment">Show Comment</a>
								<div class = "commentList">
									<c:forEach items="${board.comments}" var="comment">
										<div class ="comCont">${comment.contents}</div>
										<hr />
									</c:forEach>
								</div>
							</div>
						</div>
					</div>


</body>
</html>

<%-- 		<h1>${board.title}</h1>
	
		<div>${board.contents}</div>
	
		<c:if test="${board.filename != null}">
			이미지: <img src="/images/${board.filename}" width="100" height="100" />
		</c:if>
		<div>
			<a href="./${id}/modify">수정</a>
			<a href="./${id}/delete">삭제</a>
		</div>
		<div>
			<form action="/board/${board.id}/comment" method="POST">
				<textarea name="contents" rows="5" cols="50" placeholder="댓글입력해요 "></textarea>
				<input type="submit" name="submit" value="댓글입력" />
			</form>
		</div>
			
		<c:forEach items="${board.comments}" var="comment">
			<div>${comment.contents}</div>
			<hr />
		</c:forEach> --%>


