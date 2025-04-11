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
<h3>게시글 작성</h3>
<input type="text" id="biTitle"><br>
<textarea id="biContent"></textarea><br>
<button onclick="insertBoard()">등록</button>
<script>
function insertBoard(){
	const param = {
			biTitle: $('#biTitle').val(),
			biContent: $('#biContent').val()
	}
	$.ajax({
		method: 'POST',
		url: '/boards',
		contentType: 'application/json',
		data: JSON.stringify(param),
		success: function(res){
			console.log(res);
		},
		error: function(err){
			console.log(err);
			if(err.responseJSON.msg){
				alert(err.responseJSON.msg)
			}
			if(err.status===401){
				location.href = '/views/user/login';
			}
		}
	});
}
</script>
</body>
</html>