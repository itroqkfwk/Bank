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
            width:100%;
            margin: 3rem auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .board-header {
            padding: 20px;
        }

        .board-header h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .board-content {
            padding: 20px;
        }

        .notice-list {
            width: 100%;
            border-collapse: collapse;
        }

        .notice-list th {
            background-color: #f8f9fa;
            padding: 12px;
            text-align: left;
            border-bottom: 2px solid #1A365D;
            color: #1A365D;
        }

        .notice-list td {
            padding: 12px;
            border-bottom: 1px solid #dee2e6;
        }

        .notice-list tr:hover {
            background-color: #f8f9fa;
        }

        .title-cell {
            color: #1A365D;
            font-weight: 500;
        }

        .date-cell {
            color: #6c757d;
            font-size: 14px;
        }

        .view-cell {
            text-align: center;
            color: #6c757d;
        }

        .write-btn {
            float: right;
            margin: 20px;
            padding: 8px 16px;
            background-color: #1A365D;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .write-btn:hover {
            background-color: #152c4e;
        }
        
        .write-btn a {
        	color:white;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin: 20px 0;
            gap: 5px;
        }

        .pagination a {
            padding: 8px 12px;
            border: 1px solid #dee2e6;
            color: #1A365D;
            text-decoration: none;
            border-radius: 4px;
        }

        .pagination a.active {
            background-color: #1A365D;
            color: white;
            border-color: #1A365D;
        }

        .pagination a:hover:not(.active) {
            background-color: #f8f9fa;
        }

</style>
</head>

<body>
    <div class="notice-board">
        <div class="board-header">
            <h1>공지사항</h1>
        </div>
        <div class="board-content">
            <table class="notice-list">
                <thead>
                    <tr>
                        <th style="width: 10%">번호</th>
                        <th style="width: 50%">제목</th>
                        <th style="width: 15%">작성자</th>
                        <th style="width: 15%">작성일</th>
                        <th style="width: 10%">조회</th>
                    </tr>
                </thead>
                <tbody>
            
                	<c:forEach
                		var="notice"
                		items="${notices}"
                	>
	                	<tr>
	                	  
	                        <td>${notice.id}</td>
	                        <td class="title-cell"><a href="/notice-page/${notice.id}?page=${pageInfo.page}&pageSize=${pageInfo.pageSize}">${notice.title}</a></td>
	                        <td>${notice.admin.username}</td>
	                        <td class="date-cell">${notice.createdAt}</td>
	                        <td class="view-cell">${notice.views} </td>
	                    </tr>
                	</c:forEach>
                	<c:if test="${empty notices}">
                 		<p class="text-align:center">공지사항이 존재하지 않습니다.</p>
                     </c:if>
                </tbody>
            </table>
            <button class="write-btn">
            	<a href="/notice-editor-page">글쓰기</a>
            </button>
            <div class="pagination">
	            <c:if test="${pageInfo.page>1}">
	            	<a href="/notice-page?page=${pageInfo.page-1}&pageSize=${5}">&laquo;</a>
	            </c:if>
	            <c:if test="${pageInfo.page>1}">
	            </c:if>
	            
	            	<c:forEach begin="${pageInfo.firstPage}" end="${pageInfo.lastPage}" var="i" >
		            	<a class="${pageInfo.page == i ? 'active' : 'inactive' }" href="/notice-page?page=${i}&pageSize=${5}">${i}</a>
	            	</c:forEach>
	           
	           
	          	<c:if test="${pageInfo.totalPage != pageInfo.page}">
	            	<a href="/notice-page?page=${pageInfo.page+1}&pageSize=${5}">&raquo;</a>
	            </c:if>
	            
	            <c:if test="${pageInfo.totalPage == pageInfo.page}">
	            </c:if>
            </div>
        </div>
    </div>
</body>
</html>