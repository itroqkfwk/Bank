<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SBank | 회원가입</title>
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  height: 100vh;
  background-color: white;
  display:flex;
  justify-content: center;
}

.signup-section {
  flex: 1;
  padding: 2px 40px;
  margin:2px 0;
  display: flex;
  min-width:45%;
  max-width:1200px;
  width:80%;
  flex-direction: column;
  justify-content: center;
}

h1 {
  margin-bottom: 30px;
  color: #333;
}

.input-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  color: #666;
  font-size: 14px;
}

input {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.requirements {
  font-size: 12px;
  color: #666;
  margin-top: 3px;
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
  margin-top: 10px;
}

button:hover {
  background-color: #0056b3;
}

.terms {
  margin: 15px 0;
  font-size: 14px;
  color: #666;
}

.checkbox-group {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 10px;
}

.checkbox-group input[type="checkbox"] {
  width: auto;
}

@media (max-width: 812px) {
  .container {
    width: 90%;
    height: auto;
    max-height: 90vh;
  }

  .image-section {
    display: none;
  }

  .signup-section {
    padding: 30px;
  }
}
 .login-link{
 	text-align:center;
 	margin-top:2rem;
 }
 </style>
</head>
<body>
  <div class="signup-section">
    <h1>회원가입</h1>
    <form action="/auth/register" method="post">
      <div class="input-group">
        <label>아이디</label>
        <input name="userid" type="text" required>
        <div class="requirements">영문, 숫자 조합 6-20자</div>
      </div>

      <div class="input-group">
        <label>비밀번호</label>
        <input type="password" required>
        <div class="requirements">영문, 숫자, 특수문자 조합 8-20자</div>
      </div>

      <div class="input-group">
        <label>비밀번호 확인</label>
        <input type="password" required>
      </div>

      <div class="input-group">
        <label>이름</label>
        <input type="text" required>
      </div>

      <div class="input-group">
        <label>이메일</label>
        <input type="email" required>
      </div>
      <div class="input-group">
      	<input type="text" id="sample6_postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">
      </div>

      <div class="terms">
        <div class="checkbox-group">
          <input type="checkbox" id="all-agree">
          <label for="all-agree">전체 동의</label>
        </div>
        <div class="checkbox-group">
          <input type="checkbox" id="terms-agree">
          <label for="terms-agree">이용약관 동의 (필수)</label>
        </div>
        <div class="checkbox-group">
          <input type="checkbox" id="privacy-agree">
          <label for="privacy-agree">개인정보 수집 및 이용 동의 (필수)</label>
        </div>
        <div class="checkbox-group">
          <input type="checkbox" id="marketing-agree">
          <label for="marketing-agree">마케팅 정보 수신 동의 (선택)</label>
        </div>
      </div>

      <button type="submit">가입하기</button>
      <div class="login-link" >회원이신가요? <a href="/login-page">로그인</a> </div>
    </form>
  </div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>