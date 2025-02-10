<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 기본 스타일 및 대시보드 공통 스타일 */
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

        /* 회원정보 페이지 특정 스타일 */
        .info-group {
            margin-bottom: 20px;
            padding: 15px;
            border-bottom: 1px solid #e2e8f0;
        }

        .info-group:last-child {
            border-bottom: none;
        }

        .info-label {
            color: #4a5568;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .info-value {
            color: #2d3748;
            font-size: 16px;
            font-weight: 500;
        }

        .password-value {
            letter-spacing: 3px;
        }

        .edit-button {
            background-color: #3182ce;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 20px;
        }

        .edit-button:hover {
            background-color: #2c5282;
        }

        .info-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e2e8f0;
        }

        .info-card-title {
            font-size: 18px;
            color: #1a365d;
            font-weight: 600;
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
                <h1>회원정보</h1>
                <p>회원님의 기본 정보를 확인할 수 있습니다.</p>
            </div>

            <!-- 기본 정보 카드 -->
            <div class="card">
                <div class="info-card-header">
                    <span class="info-card-title">기본 정보</span>
                </div>

                <div class="info-group">
                    <div class="info-label">이름</div>
                    <div class="info-value">홍길동</div>
                </div>

                <div class="info-group">
                    <div class="info-label">아이디</div>
                    <div class="info-value">hong123</div>
                </div>

                <div class="info-group">
                    <div class="info-label">비밀번호</div>
                    <div class="info-value password-value">••••••••</div>
                </div>

                <div class="info-group">
                    <div class="info-label">주소</div>
                    <div class="info-value">서울특별시 강남구 테헤란로 123</div>
                </div>

                <button class="edit-button">정보 수정</button>
            </div>

            <!-- 보안 정보 카드 -->
            <div class="card">
                <div class="info-card-header">
                    <span class="info-card-title">보안 정보</span>
                </div>

                <div class="info-group">
                    <div class="info-label">최근 로그인</div>
                    <div class="info-value">2025.02.05 14:30</div>
                </div>

                <div class="info-group">
                    <div class="info-label">비밀번호 변경일</div>
                    <div class="info-value">2025.01.15</div>
                </div>
            </div>
        </div>
</body>
</html>