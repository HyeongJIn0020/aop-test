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
<h3>상세페이지</h3>
<table border="1">
	<tr>
		<th>번호</th>
		<td data-col="biNum"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td data-col="biTitle"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td data-col="biContent"></td>
	</tr>
	<tbody id="tBody"></tbody>
</table>
<button onclick="location.href='/views/board/update?biNum=${param.biNum}'">수정</button>
<button onclick="deleteBoard()">삭제</button>
<script>
const biNum = '${param.biNum}';	
console.log(biNum);
$(document).ready(function(){
	$.ajax({
		method: 'GET',
		url: '/boards/' + biNum,
		success: function(res){
			$('[data-col=biNum]').html(res.biNum);
			$('[data-col=biTitle]').html(res.biTitle);
			$('[data-col=biContent]').html(res.biContent);
		}
	})
})
$.ajaxSetup({
	error: function(err){
		console.log(err);
	}
})
function deleteBoard(){
	$.ajax({
		method: 'DELETE',
		url: '/boards/' + biNum,
		success: function(res){
			if(res===1){
				alert('삭제성공');
				location.href = '/views/board/list';
			} else {
				alert('이미 삭제된 게시물입니다.');
			}
			location.href = '/views/board/list';
		}
	})
}
</script>
</body>
</html>