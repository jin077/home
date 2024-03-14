<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
  $(document).ready(function(){
	    $("#search").click(function(){          
	        var checkbox = $("#checkbox").val();
	        if(checkbox==""){
	            alert("책 제목을 입력하세요");
	            return false;    
	        }
	        $.ajax({
	            type: "get",
	            url: "https://dapi.kakao.com/v3/search/book?target=title",
	            headers: { "Authorization": "KakaoAK 75eb7b8000d3620e7310083095d2f3fe" },
	            data: {"query": checkbox}, // 수정: "search" -> "query"
	            dataType: "json",
	            success: successes,
	            error: function(){ alert("error"); }
	        });
	    });

	    function successes(data){
	        var listHtml="<table class='table table-bordered'>";
	        listHtml+="<tr>";
	        listHtml+="<td>이미지</td>";
	        listHtml+="<td>가격</td>";
	        listHtml+="</tr>";

	        if (data.documents.length > 0) {
	            $.each(data.documents, function(index, obj){
	                var price = obj.price;  
	                var thumbnail = obj.thumbnail;
	                listHtml+="<tr>";
	                listHtml+="<td><img src='"+thumbnail+"' width='50px' height='60px'></td>";
	                listHtml+="<td>"+price+"</td>";
	                
	                listHtml+="</tr>"; 
	            });
	        } else {
	            listHtml+="<tr>";
	            listHtml+="<td>검색 결과가 없습니다.</td>";
	            listHtml+="</tr>";
	        }

	        listHtml+="</table>";
	        $("#a").html(listHtml);
	    }
	});
	</script>
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>  
<div class="container">
  <h3>예야</h3>
  <p>In this example, the navigation bar is hidden on small screens and replaced by a button in the top right corner (try to re-size this window).
  <p>Only when the button is clicked, the navigation bar will be displayed.</p>
</div>

<div class="container">
  <h2>Basic Table</h2>
  <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>            
  <table class="table">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td><input id="checkbox" name="namme" class="form-control" type="text" /></td>
        <td><input id="search" name="search" type="button" class="btn btn-primary btn-sm pull-left" value="검색"/></td>
        <div class="container">
  	  		<h2>검색 결과</h2>
   			 <div id="a"></div>
			</div>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>


</body>
</html>
