<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SBank | 마이페이지</title>
</head>
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
        
        .taps.open {
        	display:block;
       	}
       	.taps {
       		display:none;
       	}
       	
       	.home-link {
       		text-align:center;
       	}
       	.home-link a {
       		color:white;
       	}
       	
       	.sidebar-body {
       		max-height:70%;
       		height:100%;
       		display:flex;
       		flex-direction: column;
       		justify-content: space-between;
       		
       	}
</style>
<body>
<div class="container">
	        <!-- 사이드바 -->
        <div class="sidebar">
            <div class="sidebar-header">
                <div class="profile-image"></div>
                <h2>홍길동님</h2>
                <p>일반회원</p>
            </div>
            <div class="sidebar-body">
            <ul class="menu-items">
                <li class="menu-item active">계좌관리</li>
                <li class="menu-item">거래내역</li>
                <li class="menu-item">회원정보</li>
            </ul>
            <div class="home-link"><a href="/">홈으로</a></div>
            </div>
        </div>
        
	    <div class="taps open">
			<jsp:include page="mypage/my-account-management.jsp" flush="true"/>
		</div>
		<div class="taps">
			<jsp:include page="mypage/my-transaction.jsp" flush="true"/>
		</div>
		<div class="taps">
			<jsp:include page="mypage/my-info.jsp" flush="true"/>
		</div>
	 
	
</div>
</body>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>  
<script>
$(document).ready(function () {
	  $('.menu-item').on("click", function () {
	    let index = $(this).index(); // 클릭한 메뉴의 인덱스를 가져옴

	    $('.menu-item').removeClass("active"); // 모든 메뉴에서 active 제거
	    $(this).addClass("active"); // 클릭한 메뉴에 active 추가

	    $('.taps').removeClass("open"); // 모든 탭에서 open 제거
	    $('.taps').eq(index).addClass("open"); // 클릭한 메뉴의 인덱스에 해당하는 탭에 open 추가
	  });
	});


	
</script>
</html>