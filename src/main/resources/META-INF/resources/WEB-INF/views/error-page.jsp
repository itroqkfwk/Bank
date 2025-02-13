<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SBank | 에러⚠/title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #1054B4;
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .error-container {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 600px;
            width: 90%;
        }

        .error-icon {
            font-size: 4rem;
            margin-bottom: 1.5rem;
            color: #FFD700;
        }

        .error-title {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: #ffffff;
        }

        .error-message {
            background-color: rgba(255, 255, 255, 0.15);
            padding: 1rem;
            border-radius: 8px;
            margin: 1.5rem 0;
            font-family: monospace;
            white-space: pre-wrap;
            text-align: left;
            color: #E0E0E0;
        }

        .error-details {
            color: #E0E0E0;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .home-button {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background-color: #FFD700;
            color: #1054B4;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: transform 0.2s, background-color 0.2s;
        }

        .home-button:hover {
            background-color: #FFC800;
            transform: translateY(-2px);
        }

        .error-code {
            position: absolute;
            top: 1rem;
            right: 1rem;
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.6);
        }
    </style>
</head>
<body>
  <div class="error-container">
        <div class="error-icon">⚠️</div>
        <h1 class="error-title">오류가 발생했습니다</h1>
        <div class="error-details">
            죄송합니다. 요청하신 작업을 처리하는 중에 문제가 발생했습니다.<br>
            잠시 후 다시 시도해 주시기 바랍니다.
            <p>${error}</p>
        </div>
        
        <a href="/" class="home-button">메인으로 돌아가기</a>
    </div>
    
    <div class="error-code">
        Error Code: <%= response.getStatus() %>
    </div>
</body>
</html>