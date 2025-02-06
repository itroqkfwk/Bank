<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

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
  background: #007bff;
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
  background: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

header h1 a {
  display: flex;
  align-items: center;
}

header .brand-icon {
  width: 30px;
  height: 30px;
  background: #aaabad;
  margin-right: 8px;
}

.navlist-group {
  display: flex;
}

.navlist-group li {
  padding: 0 1rem 0 1rem;
}

.container {
  width: 100%;
  height: 100%;
  display: flex;
  padding: 40px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.fast-service-title {
  color: white;
}

.card-group {
  margin-top: 1.5rem;
  border-radius: 20px;
  width: 100%;
  max-width: 1200px;
  max-height: 700px;
  height: 100%;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  flex-wrap: wrap;
  gap: 15px;
  justify-content: center;
  align-items: center;
}

.card-group .card {
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  background: #fff;
  border-radius: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 8px;
  width: 100%;
  height: 100%;
  text-align: center;
}

.card-group .card p {
  font-size: 1.35rem;
}

@media (max-width: 1020px) {
  .card-group {
    grid-template-columns: repeat(2, 1fr); /* 768px 이하: 2개 */
  }
}

@media (max-width: 768px) {
  .card-group {
    grid-template-columns: repeat(1, 1fr); /* 768px 이하: 2개 */
  }
}

</style>
<body>


<div class="container">
  <h2 class="fast-service-title">빠른 서비스</h2>
  <div class="card-group">

    <div class="card">
      <p>
        <a href="#">
          입금하기
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 0 0-2.25-2.25H15a3 3 0 1 1-6 0H5.25A2.25 2.25 0 0 0 3 12m18 0v6a2.25 2.25 0 0 1-2.25 2.25H5.25A2.25 2.25 0 0 1 3 18v-6m18 0V9M3 12V9m18 0a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 9m18 0V6a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 6v3" />
          </svg>

        </a>
      </p>
    </div>
    <div class="card">
      <p>
        <a href="#">
          출금하기
        </a>
      </p>
    </div>
    <div class="card">
      <p>
        <a href="#">
          거래내역
        </a>
      </p>
    </div>
    <div class="card">
      <p>
        <a href="#">
          계좌관리
        </a>
      </p>
    </div>
    <div class="card">
      <p>
        <a href="#">
          회원정보
        </a>
      </p>
    </div>
  </div> 
</div>
</body>
</html>