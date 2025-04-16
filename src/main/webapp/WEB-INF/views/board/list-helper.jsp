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
<form id="searchForm">
	<input type="text" id="biTitle" placeholder="제목"><button type="button" onclick="getBoards(1)">검색</button>
</form>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
	</tr>
	<tbody id="tBody"></tbody>
	<tr>
		<th colspan="4" id="pageDis">
		</th>
	</tr>
</table>
<script>
const pageSize = 10;
function getBoards(page){
	if(!page){
		page = 1;
		
	}
	var param = 'page=' + page;
	param += '&biTitle=' + $('#biTitle').val();
	$.ajax({
		method: 'GET',
		url: '/boards/helper?' + param,
		success: function(res){
			const boards = res.list;
			const totalPage = res.pages;
			
			console.log(res);
			if(boards.length===0){
				$('#tBody').html('<tr><th colspan="4">게시물이 없습니다.</th></tr>');
			} else {
				var html = '';
				for(const board of boards){
					html += '<tr>';
					html += '<td>' + board.biNum + '</td>';
					html += '<td><a href="/views/board/view?biNum=' + board.biNum + '">' + board.biTitle + '</a></td>';
					html += '<td>' + board.uiNickName + '</td>';
					html += '<td>' + board.credat + '</td>';
					html += '</tr>';
				}
				$('#tBody').html(html);
				
				html = '';
				html += '<a href="javascript:void(0); getBoards(1)">[<<]</a> ';
				for(var pageNum of res.navigatepageNums){
					html += '<a href="javascript:void(0); getBoards('+pageNum+')">['+ pageNum +']</a> ';
				}
				html += '<a href="javascript:void(0); getBoards('+totalPage+')">[>>]</a> ';
				$('#pageDis').html(html);
			}
		}
	})
}
$(document).ready(function(){
	getBoards();
});
</script>
</body>
</html>