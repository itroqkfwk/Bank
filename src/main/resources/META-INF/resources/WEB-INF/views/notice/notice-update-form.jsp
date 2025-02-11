<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <meta name="contextPath" content="${pageContext.request.contextPath}">
    <style>
    
    body {
  		  display: flex;
		  flex-direction: column;
		  width: 100%;
		  height: 100vh;
		  justify-content: space-around;
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
    
  
		#notice-form {
		  display: flex;
		  flex-direction: column;
		  justify-content: flex-start;
		  max-width: 1200px;
		  width: 100%;
		  background: white;
		  padding: 40px;
		  border-radius: 20px;
		  margin: 2rem auto;
		}
		
		#notice-form .note-editor {
		  border-radius: 0px;
		}
		.notice-title-input {
		  padding: 5px;
		  width: 100%;
		  height: 50px;
		  border: none;
		  outline: none;
		  font-size: 1.85rem;
		  font-weight: bold;
		}
		
		.btn {
		  padding: 10px 20px;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		  font-size: 14px;
		  margin: 0 5px;
		}
		
		.button-group {
		  width: 100%;
		  display: flex;
		  justify-content: space-between;
		}
		.btn-submit {
		  background-color: #1a365d;
		  color: white;
		}
		
		.btn-submit:hover {
		  background-color: #1054b4;
		  color: white;
		}
		
		.btn-back:hover {
		  background-color: #d7d7d7;
}
    </style>
</head>
<body>
	<form:form 
		modelAttribute="RequestNoticeDTO" 
		id="notice-form"
		action="/notices/update-submit/${oldNotice.id}" 
		method="post">
	  <div>
	    <form:input 
	    	class="notice-title-input" 
	    	placeholder="제목을 입력해주세요." 
	    	value="${oldNotice.title}"
	    	type="text" 
	    	path="title"/>
	    <form:errors style="color:red; margin-bottom:1rem; display:inline-block; padding-left:5px" path="title"/>
	  </div>
	   	<form:textarea id="summernote" path="contents"/>
	  	<form:errors style="color:red; margin-bottom:1rem" path="contents"/> 	
	  <div class="button-group">
	    <button class="btn btn-submit" type="submit">등록</button>
	    <button class="btn btn-back" type="button">나가기</button>
	  </div>
	</form:form>
</body>
    <!-- JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
    <script>
    //  https://summernote.org/deep-dive/#insertnode
        $(document).ready(function () {
        	const contextPath = document.querySelector("meta[name='contextPath']").getAttribute("content");
        	
        	const backBtn = document.querySelector(".btn-back");
        	
        	backBtn.addEventListener("click",()=>{
        		window.history.back();
        	})
            

            $("#summernote").summernote({
                placeholder: "공지할 내용을 입력해주세요.",
                height: 500,
                focus: true,
                toolbar: [
                    ["fontsize", ["fontsize"]],
                    ["style", ["bold", "italic", "underline", "strikethrough", "clear"]],
                    ["color", ["color"]],
                    ["table", ["table"]],
                    ["para", ["ul", "ol", "paragraph"]],
                    ["height", ["height"]],
                    ["insert", ["picture"]]
                ],
                lang: "ko-KR",
                callbacks: {
                    onImageUpload: function (files) {
                        Array.from(files).forEach(imageUploader);
                    }
                }
            });
        	
            // JSP에서 전달한 초기값을 Summernote에 설정
            const initialContent =`${oldNotice.contents}`; // 모델에서 contents 값 가져와서 설정
            $('#summernote').summernote('code', initialContent); // Summernote에 초기값 설정

            
            function imageUploader(file) {
                const formData = new FormData();
                formData.append("file", file);

                $.ajax({
                    data: formData,
                    type: "POST",
                    url: "/notices/image-upload",
                    enctype: "multipart/form-data",
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        $("#summernote").summernote("insertImage", contextPath + data.url, function ($image) {
                            $image.css("width", "100%");
                        });
                        console.log(data);
                    },
                    error: function (xhr, status, error) {
                        console.error("이미지 업로드 실패:", error);
                    }
                });
            }
            

        });
    </script>
</html>