<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" media="screen" type="text/css"
	href="/stylesheets/newWrite.css" />

<title>GGP</title>
<script>
	function countComments() {
		var numComment = document.querySelectorAll(".commentList");
		//alert(numComment.length);
		for (var i = 0; i < numComment.length; i++) {
			var currentNode = numComment[i];
			var nListCount = currentNode.querySelectorAll(".comCont").length;
			var parent = currentNode.parentNode;
			parent.querySelector('.countComment > span').innerText = nListCount;
		}
	}

	function registerEvents() {
		var lists = document.getElementsByClassName('showComment');
		for (var i = 0; i < lists.length; i++) {
			lists[i].addEventListener('click', switchComment, false);
		}

/* 		var btns = document.querySelectorAll('.commentBox [type = submit]');
		for (var i = 0; i < btns.length; i++) {
			btns[i].addEventListener('click', addComments, false);
		} */

		var formList = document
				.querySelectorAll('.commentBox input[type=submit]');
		for (var j = 0; j < formList.length; j++) {
			formList[j].addEventListener('click', writeComments, false);
		}

	}

	function switchComment(e) {
		e.preventDefault();
		var currentComments = e.target.nextElementSibling;
		var oStyleInfo = document.defaultView.getComputedStyle(currentComments);
		var style = oStyleInfo.display;

		currentComments.style.display = (style != 'block' ? 'block' : 'none');
	}

/* 	function addComments(e) {
		e.preventDefault();
		var eleForm = e.currnetTarget.form;

	} */
	
	function writeComments(e) {
		e.preventDefault();
		var submitButton = e.currentTarget;
		var commentArea = submitButton.parentElement.querySelector('textarea');
		var comment = commentArea.value;
		var commentBox = submitButton.parentElement.parentElement;
		var countComment = commentBox.nextElementSibling;
		var commentList = countComment.nextElementSibling.nextElementSibling;
		// 댓글 수 1 더함
		var currentCount = parseInt(countComment.innerText);
		countComment.innerHTML = '<span>' + (currentCount + 1) + '</span>';
		// 댓글 목록에 내 댓글 추가
		commentList.innerHTML += '<div class="comCont">' + comment + '</div>\n<hr>';
		// 서버에 전송
        var eleForm = submitButton.form;
        var oFormData = new FormData(eleForm);
        
        var sID = eleForm[0].value;
        var url = "/board/" + sID + "/comment.json";
        
        var request = new XMLHttpRequest();
        request.open("POST", url, true);
        
        request.send(oFormData);
        // 댓글창 청
        commentArea.value = '';
	}

	function init() {
		countComments();
		registerEvents();
	}
	window.onload = init;
</script>
</head>
<body>
	<div class="wrap">
		<div class="container">

			<!-- 글쓰는 폼start  -->
			<div class=formarea>
				<header>
				<h1 class=title>BOARD</h1>
				</header>

				<form action="/board/write" method="POST"
					enctype="multipart/form-data">

					<input type="hidden" name="id" value="${id}"> <input
						type="hidden" name="modify" value="${modify}"> <input
						type="text" name="title" placeholder="제목" value="${board.title}"><br />
					<textarea name="contents" placeholder="세부내용은....">${board.contents}</textarea>

					<div id="file_upload">
						<input type="file" id="upload" name="file" class="btn_upload">
					</div>
					<input type="submit" value="보내기" class="btn">
				</form>
			</div>
			<!-- 글쓰는 폼end  -->

			<!-- lists start  -->
			<div class="boards">
				<c:forEach var="board" items="${list}">
					<div class="frameList">
						<div class="listWrap">
							<div class="title" style="margin-bottom:8px;">
								<a href="/board/${board.id }">
								<h2 style="background: #d8d8d8; margin-bottom: 5px; text-align: center;">${board.title}</h2></a>
							</div>

							<div class="detail">${board.contents}</div>
							<div class="pics">
								<c:if test="${board.filename != null}">
									<a href="/board/${board.id }"><img
										src="/images/${board.filename}" width="100" height="100" /></a>
								</c:if>
							</div>
							<%-- 						<div class = "btns">
								<a href="/board/${board.id}/modify"><input type = "submit" class = "btn" value= "수정" style = "border-style:none;"></a>
								<a href="/board/${board.id}/delete"><input type = "submit" class = "btn02" value= "삭제" style = "border-style:none;"></a>
							</div> --%>
						</div>
						<div class="listWrap02">
							<div class="comments">
								<div class="commentBox">
									<form action="/board/${board.id}/comment" method="POST">
									<input type="hidden" name="id" value="${board.id}">
										<textarea name="contents" placeholder="댓글입력해요 "
											class="commentarea"></textarea>
										<input type="submit" name="submit" value="댓글" class="btn" />
									</form>
								</div>
								<div class="countComment">
									<span></span>
								</div>
								<a href=# class="showComment">Show Comment</a>
								<div class="commentList">
									<c:forEach items="${board.comments}" var="comment">
										<div class="comCont">${comment.contents}</div>
										<hr />
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- lists end -->
		</div>

	</div>
</body>
</html>