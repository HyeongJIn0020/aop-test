<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
<h3>로그인</h3>
<input type="text" id="uiId"><br>
<input type="password" id="uiPwd"><br>
<button onclick="login()">로그인</button>
<script>
function login(){
	const param = {
			uiId : $('#uiId').val(),
			uiPwd : $('#uiPwd').val(),
	}
	const data = JSON.stringify(param);
	$.ajax({
		method: 'POST',
		url: '/user/login',
		data: data,
		contentType : 'application/json',
		success : function(res){
			if(res===''){
				alert('아이디나 비밀번호를 확인해주세요.');
				return;
			}
			alert(res.uiName + '님 반갑습니다.');
			location.href = '/';
		}
	})
}
</script>
</body>
</html>