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
        	margin:4rem auto;
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            max-height:600px;
            height:100%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 768px;
        }

        h1 {
            color: #1A365D;
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #1A365D;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input:focus {
            outline: none;
            border-color: #1A365D;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #1A365D;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        button:hover {
            background-color: #2A466D;
        }
        
        .back-link {
        	text-align:center;
        	margin-top:1.5rem;
        }

        .error {
            color: #ff0000;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

</style>
<body>
		<div class="container">
		    <h1>입금하기</h1>
		    <form action="/deposit" method="post" id="transferForm" onsubmit="return validateForm(event)">
		        <div class="form-group">
		            <label for="receiverAccount">입금 계좌</label>
		            <input type="text" id="receiverAccount" name="account_no" placeholder="입금할 계좌번호를 입력하세요" required>
		            <div class="error" id="receiverAccountError"></div>
		        </div>
		
		        <div class="form-group">
		            <label for="amount">금액</label>
		            <input type="number" id="amount" name="amount" placeholder="입금할 금액을 입력하세요" required min="1">
		            <div class="error" id="amountError"></div>
		        </div>
		
		        <div class="form-group">
		            <label for="description">메모</label>
		            <input type="text" id="description" name="description" placeholder="메모를 입력하세요" maxlength="20">
		        </div>
		
		        <button type="submit">입금하기</button>
		        <div class="back-link"><a href="/">돌아가기</a></div>
		    </form>
		</div>


</body>
</html>