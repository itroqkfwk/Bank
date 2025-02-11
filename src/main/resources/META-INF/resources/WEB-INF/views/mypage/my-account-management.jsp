<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SBank | 계좌 관리</title>
<style>
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
        
		.no-account-message {
		    background: linear-gradient(135deg, #1a365d 0%, #2c4a7c 100%); /* 어두운 파란색 계열 */
		    border: 1px solid #e2e8f0; /* 얇은 경계선 */
		    padding: 10px 10px; /* 여백 */
		    border-radius: 10px; /* 둥근 모서리 */
		    text-align: center; /* 텍스트 중앙 정렬 */
		    margin-top: 20px; /* 위쪽 여백 */
		    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
		    color: white; /* 글자 색을 흰색으로 */
		}
		
		.no-account-message h3 {
		    color: white; /* 글자 색을 흰색으로 변경 */
		    font-size: 24px; /* 큰 글자 크기 */
		    font-weight: 600; /* 두꺼운 글씨 */
		    margin: 0; /* 여백 없애기 */
		    line-height: 1.5; /* 줄 간격 조정 */
		}

        .card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            margin-top: 40px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .account-card {
            background: #f8fafc;
            color: #1a365d;
            padding: 25px;
            border-radius: 15px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .account-number {
            font-size: 18px;
            margin-bottom: 20px;
        }
        
	        .pagination {
			    display: flex;
			    justify-content: center;
			    gap: 10px;
			    margin-top: 20px;
			}
			
			.pagination .btn {
			    padding: 10px 20px;
			    background-color: #3182ce;
			    color: white;
			    text-decoration: none;
			    border-radius: 5px;
			    cursor: pointer;
			}
			
			.pagination .btn.active {
			    background-color: #2c4a7c; 
			}
			
			.pagination .btn:hover {
			    opacity: 0.9;
			    
			}

        .account-balance {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }

        .action-button {
            background: white;
            border: 1px solid #e2e8f0;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }

        .action-button:hover {
            background: #f8fafc;
            transform: translateY(-2px);
        }

        .transaction-list {
            list-style: none;
        }

        .transaction-item {
            display: flex;
            justify-content: space-between;
            padding: 15px 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .transaction-info {
            display: flex;
            flex-direction: column;
        }

        .transaction-amount {
            font-weight: bold;
        }

        .deposit {
            color: #38a169;
        }

        .withdraw {
            color: #e53e3e;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #1a365d;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #e2e8f0;
            border-radius: 5px;
            font-size: 14px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-primary {
            background-color: #3182ce;
            color: white;
        }

        .btn-danger {
            background-color: #e53e3e;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-1px);
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

            .account-summary {
                grid-template-columns: 1fr;
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
                <h1>계좌 관리</h1>
                <p>계좌 현황 및 거래 내역을 확인할 수 있습니다.</p>
            </div>

            <!-- 계좌 요약 -->
				<div class="account-summary">
				    <c:if test="${not empty accounts}">
					    <c:forEach var="account" items="${accounts}">
					        <div class="account-card">
					            <div class="account-number">${account.account_no}</div>
					            <div class="account-balance">₩${account.money}</div>
					            <div>${account.account_name}</div>
					        </div>
					    </c:forEach>
					</c:if>
					
					<c:if test="${empty accounts}">
					    <div class="no-account-message">
					        <h3>계좌가 없습니다. 계좌를 개설해주세요.</h3>
					    </div>
					</c:if>
				</div>
				
				<!-- 페이징 처리 -->
				<c:if test="${not empty totalPages}">
				    <div class="pagination">
				        <c:if test="${currentPage > 0}">
				            <a href="/mypages?page=${currentPage - 1}" class="btn btn-secondary">이전</a>
				        </c:if>
				        <c:forEach var="i" begin="0" end="${totalPages - 1}" step="1">
				            <a href="/mypages?page=${i}" class="btn btn-secondary ${currentPage == i ? 'active' : ''}">${i + 1}</a>
				        </c:forEach>
				        <c:if test="${currentPage < totalPages - 1}">
				            <a href="/mypages?page=${currentPage + 1}" class="btn btn-secondary">다음</a>
				        </c:if>
				    </div>
				</c:if>

			



            
			            <!-- 계좌 개설 폼 -->
						<div class="card">
						    <h2 style="margin-bottom: 20px;">계좌 개설</h2>
						    <form action="/add" method="post">
						        <div class="form-group">
						            <label for="account_name">계좌 이름</label>
						            <input type="text" id="account_name" name="account_name" placeholder="계좌 이름" required>
						        </div>
						        <div class="form-group">
						            <label for="account_no">계좌 번호</label>
						            <input type="text" id="account_no" name="account_no" placeholder="계좌 번호" required>
						        </div>
						        <div class="form-group">
						            <label for="money">초기 금액</label>
						            <input type="number" id="money" name="money" placeholder="초기 금액" required>
						        </div>
						        <button type="submit" class="btn btn-primary">계좌 개설</button>
						    </form>
						</div>
						</div>

</body>
</html>