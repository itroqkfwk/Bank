<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!-- 기본 정보 카드 -->
    <div class="card">
        <div class="info-card-header">
            <span class="info-card-title">기본 정보</span>
        </div>

        <div class="info-group">
            <div class="info-label">이름</div>
            <div class="info-value">홍길동</div>
        </div>

        <div class="info-group">
            <div class="info-label">아이디</div>
            <div class="info-value">hong123</div>
        </div>

        <div class="info-group">
            <div class="info-label">비밀번호</div>
            <div class="info-value">••••••••</div>
        </div>

        <div class="info-group">
            <div class="info-label">주소</div>
            <div class="info-value">서울특별시 강남구 테헤란로 123</div>
        </div>

        <button class="edit-button" onclick="openModal()">정보 수정</button>
    </div>

    <!-- 수정 모달 -->
    <div class="modal-overlay" id="editModal">
        <div class="modal">
            <div class="modal-header">
                <span class="modal-title">정보 수정</span>
                <button class="close-button" onclick="closeModal()">&times;</button>
            </div>
            <div class="modal-body">
                <form id="editForm">
                    <div class="form-group">
                        <label class="form-label">이름</label>
                        <input type="text" class="form-input" value="홍길동" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">아이디</label>
                        <input type="text" class="form-input" value="hong123" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">비밀번호</label>
                        <input type="password" class="form-input" placeholder="새 비밀번호를 입력하세요">
                    </div>
                    <div class="form-group">
                        <label class="form-label">주소</label>
                        <input type="text" class="form-input" value="서울특별시 강남구 테헤란로 123" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-cancel" onclick="closeModal()">취소</button>
                <button class="btn btn-save" onclick="saveChanges()">저장</button>
            </div>
</body>
</html>