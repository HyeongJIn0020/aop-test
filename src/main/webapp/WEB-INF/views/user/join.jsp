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
<h3>회원가입</h3>
<input type="text" id="uiId" placeholder="아이디"><br>
<input type="password" id="uiPwd" placeholder="비밀번호"><br>
<input type="text" id="uiName" placeholder="이름"><br>
<input type="text" id="uiNickName" placeholder="닉네임"><br>
<input type="text" id="uiAddr1" placeholder="주소(기본)"><br>
<input type="text" id="uiAddr2" placeholder="주소(선택)"><br>
<input type="text" id="uiZip" placeholder="우편번호"><br>
<input type="text" id="uiPhone" placeholder="전화번호"><br>
<input type="email" id="uiEmail" placeholder="이메일"><br>
<input type="text" id="uiDesc" placeholder="자기소개"><br>
<button onclick="join()">회원가입</button>
<script>
function join(){
	const param = {
			uiId : $('#uiId').val(),
			uiPwd : $('#uiPwd').val(),
			uiName : $('#uiName').val(),
			uiNickName : $('#uiNickName').val(),
			uiAddr1 : $('#uiAddr1').val(),
			uiAddr2 : $('#uiAddr2').val(),
			uiZip : $('#uiZip').val(),
			uiPhone : $('#uiPhone').val(),
			uiEmail : $('#uiEmail').val(),
			uiDesc : $('#uiDesc').val()
	}
	/* 
	const param = $('#frm').serialize();  
	
	*/
	const data = JSON.stringify(param);
	$.ajax({
		method: 'POST',
		url: '/user/join',
		data: data,
		contentType: 'application/json',
		success: function(res){
			if(res===1){
				alert('회원가입 성공');
				location.href='/views/user/login';
			}
		}
	})
}
</script>
</body>
</html>