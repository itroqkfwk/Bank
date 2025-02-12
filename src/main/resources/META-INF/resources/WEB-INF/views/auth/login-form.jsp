<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SBank | 로그인</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
   background-color: #1a365d;
}

.container {
  display: flex;
  max-width: 1200px;
  min-width: 250px;
  width: 100%;
  max-height: 600px;
  height: 100%;
  background: white;
  border-radius: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.login-section {
  flex: 1;
  padding: 40px;
  min-width: 40%;
  width: 60%;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.image-section {
  display: flex;
  align-items: center;
  justify-content: center;
}

.image-section img {
  border-radius: 20px;
  max-width: 95%;
}

h1 {
  margin-bottom: 10px;
  color: #333;
}
p {
  margin-bottom: 2rem;
}

.input-group {
  margin-bottom: 20px;
}

input {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 5px;
  margin-top: 5px;
}

.signup-link-group {
  margin-top: 1rem;
  display: flex;
  justify-content: center;
}

.signup-link-group p {
  padding-right: 5px;
}

button {
  width: 100%;
  padding: 12px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
}

button:hover {
  background-color: #0056b3;
}

@media (max-width: 768px) {
  .container {
    width: 90%;
    height: auto;
  }

  .image-section {
    display: none;
  }

  .login-section {
    padding: 30px;
  }
}

.home-link-group{
	
	width:30px;
	height:30px;
	margin:0 auto;

}

.home-link-group a{
transition:0.5s;
}

.home-link-group a:hover{
	color:#007BFF;
}


 </style>
</head>
<body>
<div class="container">
  <div class="login-section">
    <h1>Welcome Back 🖐 </h1>
    <p>고객님의 무궁한 발전을 희망합니다. </p>
    <c:if test="${not empty error}">
    	<p> ${error} </p>
	</c:if>
    <form action="/login-page" method="post">
      <div class="input-group">
        <input name="userid" type="text" placeholder="아이디" required>
      </div>
      <div class="input-group">
        <input name="password" type="password" placeholder="비밀번호" required>
      </div>
      <button type="submit">로그인</button>
    </form>
    <div class="signup-link-group">
      <p>SBank의 회원이 아니신가요? </p>
      <a href="/signup-page">회원가입</a>
    </div>
    <div class="home-link-group">
      <a href="/" title="홈으로 가기">
      	<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
		  <path stroke-linecap="round" stroke-linejoin="round" d="m2.25 12 8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
		</svg>
      </a>
    </div>
  </div>
  <div class="image-section">
    <img src="https://picsum.photos/600/800"  width="600" height="570" />
  </div>
</div>
</body>
</html>