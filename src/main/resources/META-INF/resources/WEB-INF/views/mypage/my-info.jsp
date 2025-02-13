<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        
        
        .modal-overlay{
			position: fixed;
			left:0;
			right:0;
			top:0;
			bottom:0;
			background:rgba(0,0,0,0.5);
        	transition:0.5s;
			visibility: hidden;
			opacity:0;
        }
        
        .modal {
            position: fixed;
        	max-width:650px;
        	padding:40px;
        	width:100%;
        	background:white;
        	box-shadow=0 0 20px 3px rgba(0,0,0,0.5);
			border-radius:20px;
			height:auto;
			z-index:100000000000;
        	max-height:600px;
        	left:50%;
        	top:50%;
        	transform:translate(-50%,-50%);
        }
        
		.modal-header{
			display:flex;
			justify-content: space-between;
			padding: 0 5px 0 5px;
		}
		.modal-body{
			margin-top:1rem;
		}
		
		.close-button{
			border:none;
			font-size:1.25rem;
			background:none;
		}
		
		.close-button:hover{
			cursor: pointer;
			
			
		}
		.close-button:active {
			color:gray;
		}
		.btn-cancel{
			background:tomato;
		}
		
		input::disabled {
			background:rgba(0,0,0,0.3);
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
                    <div class="info-value">
						${userInfo.username}
                    </div>
                </div>

                <div class="info-group">
                    <div class="info-label">아이디</div>
                    <div class="info-value">${userInfo.userid}</div>
                </div>

                <div class="info-group">
                    <div class="info-label">비밀번호</div>
                    <div class="info-value password-value">••••••••</div>
                </div>

                <div class="info-group">
                    <div class="info-label">주소</div>
                    <div class="info-value">${userInfo.address}</div>
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
    
    <!-- 수정 모달 -->
    
    <div 
    	class="modal-overlay" 
    	id="editModal">
        <div class="modal">
            <div class="modal-header">
                <span class="modal-title">정보 수정</span>
                <button class="close-button">×</button>
            </div>
            <div class="modal-body">
                <form:form 
                		id="editForm" 
                		modelAttribute="UserInfoUpdateDTO"
                		action="/my-info-update" 
						method="post">
                
	                <!-- 이름 -->
                    <div class="form-group">
                        <label class="form-label">이름</label>
                        <form:input 
                        		type="text" 
                        		path="username" 
                        		class="form-input"
                        		disabled="disabled" 
                        		/>
                    </div>
                    
                    <!-- 아이디 -->
                    <div class="form-group">
                        <label class="form-label">아이디</label>
                        <form:input 
                        		type="text"
                        		path="userid" 
                        		class="form-input" 
                        		disabled="disabled"
                        		/>
                    </div>
                    
                    <!-- 비밀번호 -->
                    <div class="form-group">
                        <label class="form-label">비밀번호</label>
                        <form:input 
                        		type="password" 
                        		path="password" 
                        		class="form-input" 
                        		placeholder="새 비밀번호를 입력하세요"/>
                    </div>
                    
                    <!-- 주소 -->
                    <div class="form-group">
                        <label class="form-label">주소</label>
                        <form:input 
                        		type="text"
                        		path="address" 
                        		class="form-input" 
                        		/>
                    </div>
                    <div class="modal-footer">
		                <button class="btn btn-cancel" type="reset">취소</button>
		                <button class="btn btn-save" type="submit">저장</button>
            		</div>
                </form:form>
            </div>
   </div>
   </div>  
</body>
<script>
	const userInfoEditBtn = document.querySelector(".edit-button");
	const formCloseBtn = document.querySelector(".close-button");
	
	const userinfoUpdateForm = document.querySelector(".modal-overlay");
	let isOpen = true;
	
	
	userInfoEditBtn.addEventListener("click",()=>{
		
		if(isOpen == true){
		userinfoUpdateForm.style.cssText=`
			transition:0.5s;
			visibility: visible;
			opacity:1;
		`;
		
		isOpen = false;
		} else {
			userinfoUpdateForm.style.cssText=`
				transition:0.5s;
				visibility: hidden;
				opacity:0;
			`
			
		isOpen = true;
		}
	})
	
		formCloseBtn.addEventListener("click",()=>{
		
		if(isOpen == true){
		userinfoUpdateForm.style.cssText=`
			transition:1s;
			visibility: visible;
			opacity:1;
		`
		} else {
			userinfoUpdateForm.style.cssText=`
				transition:1s;
				visibility: hidden;
				opacity:0;
			`	
		}
	})
	
</script>
</html>