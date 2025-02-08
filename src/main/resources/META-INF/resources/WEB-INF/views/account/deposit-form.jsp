<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #1A365D;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            max-height:700px;
            height:100%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
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
        <form id="transferForm" onsubmit="return validateForm(event)">

            <div class="form-group">
                <label for="receiverBank">입금 은행</label>
                <input type="text" id="receiverBank" placeholder="입금 은행을 입력해주세요." required>
            </div>

            <div class="form-group">
                <label for="receiverAccount">입금 계좌</label>
                <input type="text" id="receiverAccount" placeholder="입금할 계좌번호를 입력하세요" required>
                <div class="error" id="receiverAccountError"></div>
            </div>

            <div class="form-group">
                <label for="amount">금액</label>
                <input type="number" id="amount" placeholder="입금할 금액을 입력하세요" required min="1">
                <div class="error" id="amountError"></div>
            </div>

            <div class="form-group">
                <label for="description">메모</label>
                <input type="text" id="description" placeholder="메모를 입력하세요" maxlength="20">
            </div>
            <input type="text" value="입금" style="display:none">
            <button type="submit">입금하기</button>
             <div class="back-link"><a href="/">돌아가기</a></div>
        </form>
    </div>

</body>
</html>