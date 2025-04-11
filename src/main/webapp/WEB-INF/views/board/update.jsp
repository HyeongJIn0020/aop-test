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
<h3>게시글 수정</h3>
<input type="text" id="biTitle" data-col="biTitle"><br>
<textarea id="biContent" data-col="biContent"></textarea><br>
<button onclick="updateBoard()">수정</button>
<script>
const biNum = '${param.biNum}';
$(document).ready(function(){
	$.ajax({
		method: 'GET',
		url: '/boards/' + biNum,
		success: function(res){
			var html = '';
			console.log(res);
			for(const key in res){
				if(document.querySelector('[data-col=' + key + ']')){
					document.querySelector('[data-col=' + key + ']').value = res[key];
				}
			}
		}
	})
})
function updateBoard(){
	const param = {
			biTitle: $('#biTitle').val(),
			biContent: $('#biContent').val()
	}
	$.ajax({
		method: 'PUT',
		url: '/boards/' + biNum,
		contentType: 'application/json',
		data: JSON.stringify(param),
		success: function(res){
			if(res===1){
				alert('수정 성공');
				location.href='/views/board/view?biNum=' + biNum;
			}
		}
	})
}
</script>
</body>
</html>