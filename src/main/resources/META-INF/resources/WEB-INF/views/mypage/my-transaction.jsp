<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      /* 이전 대시보드의 기본 스타일 유지 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            background-color: #f5f7fb;
            min-height: 100vh;
        }

        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #1a365d;
            color: white;
            padding: 20px;
            position: fixed;
            height: 100vh;
        }

        .sidebar-header {
            padding: 20px 0;
            text-align: center;
            border-bottom: 1px solid #2c4a7c;
            margin-bottom: 20px;
        }

        .profile-image {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #2c4a7c;
            margin: 0 auto 10px;
        }

        .menu-items {
            list-style: none;
        }

        .menu-item {
            padding: 15px;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 5px;
            transition: background-color 0.3s;
        }

        .menu-item:hover {
            background-color: #2c4a7c;
        }

        .menu-item.active {
            background-color: #3182ce;
        }

        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 30px;
        }

        .content-header {
            margin-bottom: 30px;
        }

        .content-header h1 {
            color: #1a365d;
            font-size: 24px;
            margin-bottom: 10px;
        }

        .card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        /* 거래내역 페이지 특정 스타일 */
        .filter-options {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .filter-button {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            background-color: #f0f4f8;
            color: #4a5568;
            cursor: pointer;
            transition: all 0.3s;
        }

        .filter-button.active {
            background-color: #3182ce;
            color: white;
        }

        .transaction-table {
            width: 100%;
            border-collapse: collapse;
        }

        .transaction-table th {
            padding: 12px;
            text-align: left;
            color: #4a5568;
            font-weight: 600;
            border-bottom: 2px solid #e2e8f0;
        }

        .transaction-table td {
            padding: 12px;
            border-bottom: 1px solid #e2e8f0;
        }

        .transaction-date {
            color: #718096;
            font-size: 14px;
        }

        .transaction-amount.deposit {
            color: #38a169;
            font-weight: 600;
        }

        .transaction-amount.withdraw {
            color: #e53e3e;
            font-weight: 600;
        }

        .transaction-amount.transfer {
            color: #3182ce;
            font-weight: 600;
        }

        .transaction-badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
        }

        .badge-deposit {
            background-color: #c6f6d5;
            color: #276749;
        }

        .badge-withdraw {
            background-color: #fed7d7;
            color: #c53030;
        }

        .badge-transfer {
            background-color: #bee3f8;
            color: #2c5282;
        }

        @media (max-width: 768px) {
            .dashboard {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .main-content {
                margin-left: 0;
            }

            .filter-options {
                flex-direction: column;
            }
        }
</style>
</head>
<body>
			 <script>
		        window.onload = function() {
		            var message = '${message}';  // 전달된 메시지 가져오기
		            if (message) {
		                alert(message);  // 메시지를 팝업으로 띄운다
		            }
		        }
		    </script>

        <!-- 메인 콘텐츠 -->
		<div class="main-content">
		    <div class="content-header">
		        <h1>거래내역</h1>
		        <p>계좌의 입출금 및 이체 내역을 조회할 수 있습니다.</p>
		    </div>
		
		    <table class="transaction-table">
		        <thead>
		            <tr>
		                <th>거래일시</th>
		                <th>거래유형</th>
		                <th>설명</th>
		                <th>금액</th>
		            </tr>
		        </thead>
		        <tbody>
		            <!-- 거래내역이 없으면 "거래내역이 없습니다." 메시지 출력 -->
		            <c:if test="${empty transactions}">
		                <tr><td colspan="4">거래내역이 없습니다.</td></tr>
		            </c:if>
		
		            <!-- 거래내역이 있을 경우 출력 -->
		            <c:forEach var="transaction" items="${transactions}">
					    <tr>
					        <td>${transaction.created_at}</td>
					        <td>${transaction.transaction_type}</td>
					        <td>${transaction.description}</td>
					        <td>
					            <c:choose>
					                <c:when test="${transaction.transaction_type == 'DEPOSIT'}">
					                    +${transaction.cost} 원
					                </c:when>
					                <c:otherwise>
					                    -${transaction.cost} 원
					                </c:otherwise>
					            </c:choose>
					        </td>
					    </tr>
					</c:forEach>
		        </tbody>
		    </table>
		</div>
		</body>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script> 
<script>
$(document).ready(function () {
	$(".filter-button").on('click', function(){
		let index = $(this).index();
		
		$('.filter-button').removeClass("active");
		$(this).addClass("active")
	})
		
})
</script>
</html>