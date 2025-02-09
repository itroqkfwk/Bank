<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Back Start Bank</title>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 100vh;
   background-color: #1a365d;
}

li {
  list-style: none;
}

a {
  text-decoration: none;
  color: black;
}

header {
  height: 60px;
  padding: 10px 40px 10px 40px;
  width: 100%;
  background: transparent;
  display: flex;
  justify-content: space-between;
  align-items: center;
  
}

header h1 a {
  display: flex;
  align-items: center;
    color:white;
}

header .brand-icon {
  width: 30px;
  height: 30px;
  background: white;
  margin-right: 8px;
}

.navlist-group {
  display: flex;
}

.navlist-group li {
  padding: 0 1rem 3px 1rem;
}

.navlist-group li:hover{
	box-shadow:0 1px 0 0 white;
}

.navlist-group li a:active{
	color: #1054B4;
}

.navlist-group li a {
	color:white;
}
</style>
</head>
<body>
	<header>
	  <h1>
	    <a href="/">
	      <div class="brand-icon"></div>
	      <span> BS 은행</span>
	    </a>
	  </h1>
	  <nav>
	    <ul class="navlist-group">
	      <li><a href="/login-page">로그인</a></li>
	      <li><a href="/signup-page">회원가입</a></li>
	    </ul>
	  </nav>
	</header>

</body>
</html>