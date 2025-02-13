<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<%
    String userid = (String) session.getAttribute("userid");
%>
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
  align-items: center;
}

.navlist-group li {
  padding: 0 0.25rem 3px 0.25rem;
}

.navlist-group li a:active{
	color: #1054B4;
}

.navlist-group li a {
	color:white;
}
.welcome-message {
	color:white;
	margin-right:1.2rem;
	padding-bottom:3px;
}

.li-icon-con{
	transition:0.5s;
	svg{
		width:24px;
		height:24px;
		color:white;
	}
}

.li-icon-con:hover{
 	svg {
 		color:#007BFF;
 	}
}


</style>
</head>
<body>
	<header>
	  <h1>
	    <a href="/">
	      <div class="brand-icon"></div>
	      <span> SBank</span>
	    </a>
	  </h1>
	  <nav>
	    <ul class="navlist-group">
	    
	    	<!-- 로그인 후 -->
	        <c:if test="${not empty username}">
    			<p class="welcome-message"> 환영합니다. ${username}님</p>
    			
    			<li class="li-icon-con">
    			<a class="mypage-link" href="/mypage" title="마이페이지">
    				<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
					  <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
					</svg>
    			</a>
    			
    			</li>
	      		<li class="li-icon-con">
	      		<a href="/logout" class="logout-link" title="로그아웃">
	      			<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
					  <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 9V5.25A2.25 2.25 0 0 1 10.5 3h6a2.25 2.25 0 0 1 2.25 2.25v13.5A2.25 2.25 0 0 1 16.5 21h-6a2.25 2.25 0 0 1-2.25-2.25V15m-3 0-3-3m0 0 3-3m-3 3H15" />
					</svg>
	      		</a>
	      		
	      		</li>
    		</c:if>
    		
    		<!-- 로그인 전 -->
	        <c:if test="${empty userid}">
	      		<li><a href="/login-page">로그인</a></li>
	      		<li><a href="/signup-page">회원가입</a></li>
			</c:if>
	    </ul>
	  </nav>
	</header>

</body>
</html>