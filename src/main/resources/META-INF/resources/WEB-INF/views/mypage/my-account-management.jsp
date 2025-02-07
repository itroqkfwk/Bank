<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        .card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .account-summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .account-card {
            background: linear-gradient(135deg, #1a365d 0%, #2c4a7c 100%);
            color: white;
            padding: 25px;
            border-radius: 15px;
            position: relative;
            overflow: hidden;
        }

        .account-number {
            font-size: 18px;
            margin-bottom: 20px;
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
	        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <div class="content-header">
                <h1>계좌 관리</h1>
                <p>계좌 현황 및 거래 내역을 확인할 수 있습니다.</p>
            </div>

            <!-- 계좌 요약 -->
            <div class="account-summary">
                <div class="account-card">
                    <div class="account-number">123-456-789012</div>
                    <div class="account-balance">₩1,500,000</div>
                    <div>입출금계좌</div>
                </div>
            </div>

            <!-- 빠른 메뉴 -->
            <div class="quick-actions">
                <div class="action-button">
                    입금내역
                </div>
                <div class="action-button">
                    계좌개설
                </div>
            </div>

            <!-- 최근 거래내역 -->
            <div class="card">
                <h2 style="margin-bottom: 20px;">최근 거래내역</h2>
                <ul class="transaction-list">
                    <li class="transaction-item">
                        <div class="transaction-info">
                            <span style="font-weight: 500;">급여</span>
                            <span style="color: #718096;">2025-02-05</span>
                        </div>
                        <span class="transaction-amount deposit">+500,000원</span>
                    </li>
                    <li class="transaction-item">
                        <div class="transaction-info">
                            <span style="font-weight: 500;">식비</span>
                            <span style="color: #718096;">2025-02-04</span>
                        </div>
                        <span class="transaction-amount withdraw">-150,000원</span>
                    </li>
                    <li class="transaction-item">
                        <div class="transaction-info">
                            <span style="font-weight: 500;">환불</span>
                            <span style="color: #718096;">2025-02-03</span>
                        </div>
                        <span class="transaction-amount deposit">+100,000원</span>
                    </li>
                </ul>
            </div>

            <!-- 회원정보 -->
            <div class="card">
                <h2 style="margin-bottom: 20px;">회원정보</h2>
                <form>
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" value="홍길동" readonly>
                    </div>
                    <div class="form-group">
                        <label>이메일</label>
                        <input type="email" value="hong@example.com" readonly>
                    </div>
                    <div class="form-group">
                        <label>휴대폰 번호</label>
                        <input type="tel" value="010-1234-5678" readonly>
                    </div>
                </form>
            </div>

            <!-- 보안 설정 -->
            <div class="card">
                <h2 style="margin-bottom: 20px;">보안 설정</h2>
                <div style="display: flex; gap: 10px;">
                    <button class="btn btn-primary">비밀번호 변경</button>
<!--                     <button class="btn btn-primary">보안카드 관리</button> -->
                    <button class="btn btn-danger">회원 탈퇴</button>
                </div>
            </div>
        </div>
</body>
</html>