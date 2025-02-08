<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
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
  transition:0.5s;
}

.card:hover{
 
 box-shadow:0 0 30px 0 #1a365d;
 color:white;
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
        <a href="/deposit-page">
          입금하기
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a2.25 2.25 0 0 0-2.25-2.25H15a3 3 0 1 1-6 0H5.25A2.25 2.25 0 0 0 3 12m18 0v6a2.25 2.25 0 0 1-2.25 2.25H5.25A2.25 2.25 0 0 1 3 18v-6m18 0V9M3 12V9m18 0a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 9m18 0V6a2.25 2.25 0 0 0-2.25-2.25H5.25A2.25 2.25 0 0 0 3 6v3" />
          </svg>

        </a>
      </p>
    </div>
    <div class="card">
      <p>
        <a href="/withdrawal-page">
          출금하기
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
		  <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m-3-2.818.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
		</svg>
		          
        </a>
      </p>
    </div>
    <div class="card">
      <p>
        <a href="/mypage">
          마이페이지
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M15 9h3.75M15 12h3.75M15 15h3.75M4.5 19.5h15a2.25 2.25 0 0 0 2.25-2.25V6.75A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25v10.5A2.25 2.25 0 0 0 4.5 19.5Zm6-10.125a1.875 1.875 0 1 1-3.75 0 1.875 1.875 0 0 1 3.75 0Zm1.294 6.336a6.721 6.721 0 0 1-3.17.789 6.721 6.721 0 0 1-3.168-.789 3.376 3.376 0 0 1 6.338 0Z" />
</svg>
          
        </a>
      </p>
    </div>
  </div> 
</div>
</body>
</html>