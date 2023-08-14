<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../../resources/css/1.main.css">
        <link rel="stylesheet" href="../../resources/css/6.notice.css">
        <link rel="stylesheet" href="../../resources/css/reset.css">
        <script src="https://kit.fontawesome.com/dbb376a4c5.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.css">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
        <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
        <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
        <title>NoticeModify</title>
        <style>
        	input[type="submit"]{
        		background-color: skyblue;
        		color : black;
        		font-weight : 900;
        		border-radius : 5px;
        		margin-right : 30px;
        		padding : 0px 40px;
        	}
        	input[type="reset"]{
        		font-weight : 900;
        		border-radius : 5px;
        		padding : 0px 20px;
        	}
        </style>
	</head>
	<body>
		<header class="sticky-top navbar navbar-expand-lg" style="padding-top: 0px;">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        </header>
        <main>
        	<div id="main_left"></div>
        	<div id="main_middle">
				<h2><b>공지사항 수정</b></h2>
				<hr>
				<form action="/notice/modify.do" method="post">
				<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
					<fieldset>
						<!-- <legend>공지사항 수정</legend> -->
						
						<label>제목</label>
						<input type="text" style="width:500px" id="" name="noticeSubject" value="${notice.noticeSubject }">
						
						<textarea rows="20" cols="70" id="summernote" name="noticeContent">${notice.noticeContent }</textarea>
						
					</fieldset>
					<div style="margin: 30px 10px">
						<input type="submit" value="수정">
						<input type="reset" value="초기화">
					</div>
				</form>
			</div>
			<div id="main_right"></div>
		</main>
		<footer class="navbar navbar-expand-lg">
            <div id="footer" class= "container-fluid">
                <div class="logo">
                    <a href="#"><img src="../../resources/images/main/logo.PNG" alt=""></a>
                </div>
                <div class="footer footer1">
                    <ul>
                        <li>회사명 : (주)코스마켓</li>
                        <li>대표이사 : 정유송</li>
                        <li>사업자등록번호 : 12-123-12345</li>
                        <li>주소 : 서울시 종로구 청계빌딩2층</li>
                    </ul>
                </div>
                <div class="footer footer2">
                    <ul>
                        <li><a href="..//admin/companyIntro.do">회사소개</a></li>
                        <li><a href="..//admin/companyHistory.do">회사연혁</a></li>
                        <li><a href="">이용약관</a></li>
                        <li><a href="">개인정보취급방침</a></li>
                    </ul>
                </div>
            </div>
        </footer>
        <script>
	        $(document).ready(function() {
	            $('#summernote').summernote({
	                    height: 300,                 // set editor height
	                    minHeight: null,             // set minimum height of editor
	                    maxHeight: null,             // set maximum height of editor
	                    focus: false                  // set focus to editable area after initializing summernote
	            });
	        });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	</body>
</html>