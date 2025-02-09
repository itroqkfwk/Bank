<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .notice-board {
            max-width: 1200px;
            margin: 0 auto;
            width:100%;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow: hidden;
            max-height:800px;
            height:100%;
        }


        .board-content {
            padding: 20px;
        }

        /* View Page Styles */
        .post-header {
            border-bottom: 2px solid #1A365D;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }

        .post-title {
            font-size: 24px;
            color: #1A365D;
            margin-bottom: 15px;
        }

        .post-info {
            display: flex;
            justify-content: space-between;
            color: #6c757d;
            font-size: 14px;
        }

        .post-info-left, .post-info-right {
            display: flex;
            gap: 20px;
        }

        .post-content {
            min-height: 200px;
            line-height: 1.6;
            color: #333;
            padding: 20px 0;
            border-bottom: 1px solid #dee2e6;
        }

        .attachment-section {
            margin: 20px 0;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 4px;
        }

        .attachment-title {
            color: #1A365D;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .attachment-list {
            list-style: none;
        }

        .attachment-item {
            padding: 5px 0;
        }

        .attachment-item a {
            color: #1A365D;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .attachment-item a:hover {
            text-decoration: underline;
        }

        .button-group {
            margin-top: 30px;
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        
        .btn a {
        	color:white;
        }

        .btn-list {
            background-color: #1A365D;
            color: white;
        }

        .btn-list:hover {
            background-color: #152c4e;
        }

        .btn-modify, .btn-delete {
            background-color: #6c757d;
            color: white;
            margin-left: 10px;
        }

        .btn-modify:hover, .btn-delete:hover {
            background-color: #5a6268;
        }

        .navigation-posts {
            margin-top: 30px;
            border-top: 1px solid #dee2e6;
        }

        .nav-item {
            display: flex;
            justify-content: space-between;
            align-items:center;
            padding: 10px 0;
            border-bottom: 1px solid #dee2e6;
        }

        .nav-label {
        	text-align:center;
            color: #1A365D;
            min-width: 100px;
        }

        .nav-title {
            color: #333;
            text-decoration: none;
            flex-grow: 1;
            margin-left: 20px;
        }

        .nav-title:hover {
            text-decoration: underline;
        }

</style>
</head>
<body>
   <div class="notice-board">
        <div class="board-content">
            <div class="post-header">
                <h2 class="post-title">${mainNotice.title}</h2>
                <div class="post-info">
                    <div class="post-info-left">
                        <span>작성자: ${mainNotice.admin.username}</span>
                        <span>작성일: ${mainNotice.createdAt}</span>
                    </div>
                    <div class="post-info-right">
                        <span>조회수: ${mainNotice.views}</span>
                    </div>
                </div>
            </div>

            <div class="post-content">${mainNotice.contents}</div>

            <div class="attachment-section">
                <div class="attachment-title">첨부파일</div>
                <ul class="attachment-list">
                    <li class="attachment-item">
                        <a href="#">
                            📎 시스템_점검_세부일정.pdf (2.5MB)
                        </a>
                    </li>
                    <li class="attachment-item">
                        <a href="#">
                            📎 우회접속방법_안내.pdf (1.8MB)
                        </a>
                    </li>
                </ul>
            </div>

            <div class="button-group">
                <button class="btn btn-list">
                	<a href="/notice-page?page=${page}&pageSize=${pageSize}">목록</a>
                </button>
                <div>
                    <button class="btn btn-modify">수정</button>
                    <button class="btn btn-delete" data-id="${mainNotice.id}">삭제</button>
                </div>
            </div>


            <div class="navigation-posts">
            	<c:forEach var="notice" items="${prevAndNextNotices}">
            		<div class="nav-item">
	                    <span class="nav-label">${notice.id}</span>
	                    <a href="/notice-page/${notice.id}" class="nav-title">${notice.title}</a>
                	</div>
            	</c:forEach>
            </div>
        </div>
    </div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
<script>
$(document).ready(function () {
	$(".btn-delete").click(function(e){
		const isDelete = confirm(e.target.dataset.id+"번 게시글을 정말로 삭제하시겠습니까?");
		if(isDelete){
	    $.ajax({
	        type : 'DELETE',
	        url : '/notice-page/'+e.target.dataset.id ,
	        success: function(result){
					alert("삭제 되었습니다.")
					location.replace("/notice-page?page=1&pageSize=5");
	        },
	        error: function (xhr, status, error) {
	            console.log("삭제 실패:: 서버 측에서 문제 발생", error);
	        }
	      })
		}
		
	})
})

</script>
</html>