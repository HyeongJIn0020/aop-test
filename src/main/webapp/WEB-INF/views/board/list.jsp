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
<h3>게시판</h3>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<tbody id="tBody"></tbody>
</table>
<script>
$(document).ready(function(){
	$.ajax({
		method: 'GET',
		url: '/boards',
		success: function(res){
			console.log(res);
			if(res.length===0){
				$('#tBody').html('<tr><th colspan="4">게시물이 없습니다.</th></tr>');
			} else {
				var html = '';
				for(const board of res){
					html += '<tr>';
					html += '<td>' + board.biNum + '</td>';
					html += '<td>' + board.biTitle + '</td>';
					html += '<td>' + board.uiNickName + '</td>';
					html += '<td>' + board.credat + '</td>';
					html += '</tr>';
				}
				$('#tBody').html(html);
			}
		}
	})
});
</script>
</body>
</html>