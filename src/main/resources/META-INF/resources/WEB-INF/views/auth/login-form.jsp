<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  max-height: 800px;
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


 </style>
</head>
<body>
<div class="container">
  <div class="login-section">
    <h1>Welcome Back 🖐 </h1>
    <p>고객님의 무궁한 발전을 희망합니다. </p>
    <form action="/auth/login" method="post">
      <div class="input-group">
        <input type="text" placeholder="아이디" required>
      </div>
      <div class="input-group">
        <input type="password" placeholder="비밀번호" required>
      </div>
      <button type="submit">로그인</button>
    </form>
    <div class="signup-link-group">
      <p>SBank의 회원이 아니신가요? </p>
      <a href="/signup-page">회원가입</a>
    </div>
  </div>
  <div class="image-section">
    <img src="https://picsum.photos/600/800"  width="600" height="750" />
  </div>
</div>
</body>
</html>