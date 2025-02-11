<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SBank | 로그인</title>
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
	<jsp:include page="auth/login-form.jsp" flush="true"/>
</body>
</html>