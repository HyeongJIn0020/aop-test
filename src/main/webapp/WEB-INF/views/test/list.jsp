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
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>소개</th>
		<th>나이</th>
	</tr>
	<tbody id="tBody"></tbody>
	<tr>
		<th colspan="4" id="pageDis">
		</th>
	</tr>
</table>
<script>
const pageSize = 10;
function getTestList(page){
	if(!page){
		page = 1;
	}
	$.ajax({
		method: 'GET',
		url : '/tests?page=' + page,
		success: function(res){
			console.log(res);
			const tests = res.list;
			const totalPage = res.total;
			
			if(tests.length===0){
				$('#tBody').html('<tr><th colspan="4">게시물이 없습니다.</th></tr>');
			} else {
				var html = '';
				for(const test of tests){
					html += '<tr>';
					html += '<td>' + test.tiNum + '</td>';
					html += '<td>'+ test.tiName + '</td>';
					html += '<td>' + test.tiDesc + '</td>';
					html += '<td>' + test.tiAge + '</td>';
					html += '</tr>';
				}
				$('#tBody').html(html);
				
				html = '';
				if(res.pageNum>=7){
					html += '<a href="javascript:void(0); getTestList(1)">[≪]</a> ';
				}
				
				for(var pageNum of res.navigatepageNums){
					html += '<a href="javascript:void(0); getTestList('+pageNum+')">['+ pageNum +']</a> ';
				}
				if(pageNum!=(totalPage/10)){
					html += '<a href="javascript:void(0); getTestList('+(totalPage/10)+')">[≫]</a> ';
				}
				$('#pageDis').html(html);
			}
		}
	})
}
$(document).ready(function(){
	getTestList();
})
</script>
</body>
</html>