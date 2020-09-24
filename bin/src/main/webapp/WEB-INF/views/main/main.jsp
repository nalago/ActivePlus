<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#userInfo{
	width:300px;
	height:700px;
	border:1px solid black;
	float:left;
}

#mainT{
	margin : 100px;
}

</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp"/>
	</nav>
	<section>
		<div id="userInfo">
		
		</div>
		<div id="mainT">
			<table align="left" border="1px" class="mainT">
				<tr>
					<th>안녕!</th>
				</tr>
				<tr>
					<td>반가워!</td>
				</tr>
			</table>
			<table align="right" border="1px" class="mainT">
				<tr>
					<th>안녕!!</th>
				</tr>
				<tr>
					<td>반가워!!</td>
				</tr>
			</table>
			<br><br>
			<table align="center" border="1px" class="mainT">
				<tr>
					<th>안녕!!!</th>
				</tr>
				<tr>
					<td>반가워!!!</td>
				</tr>
			</table>
		</div>
	</section>

</body>
</html>