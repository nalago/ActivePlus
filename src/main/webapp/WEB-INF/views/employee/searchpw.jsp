<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Active Plus</title>
<style>
@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#userInfo {
	margin-left:10%;
	width: 300px;
	height: 370px;
	border: 3px solid white;
	background:#fafafa;
	margin-top:100px;
	float: left;
}

#mainT {
	margin: 30px;
	margin-left:40%;
}
h3{
	margin-top:70px;
	border-bottom:2px solid #63ab68;
	color:#2f2f2f;
}
.mainT{
	width:700px;
}
tbody{
	text-align:center;
	color:#4f4f4f;
}
thead {
}
/*유저 정보 */
#basic {
	border:1px solid #93d097;
	background:#93d097;
	width : 200px;
	height: 300px;
	margin:auto;
	margin-top:30px;
}
#picture{
	width:170px;
	height:200px;
	margin:auto;
	margin-top:20px;
	background:white;
}
.user{
	width:200px;
	text-align:center;
	margin-top:20px;
	
}
#TNA{
	width:300px;
	height:50px;
	margin-left:10%;
}
#work{
	width:250px;
	height:40px;
	margin-left:25px;
	margin-top:5px;
	color:#ff4d4d;
}
.TNABtn{
	background:none;
	color:#2f2f2f;
	border:none;
	
	/* border-radius:10px; */
	font-size:15px;
}
.TNABtn:hover{
	cursor:pointer;
}
.half{
	width:125px;
	height:50px;
}
#tt th{
	font-weight:500;
	color:#2f2f2f;
}
#tt td{
	font-weight:500;
	color:#8d8d8d;
}
.mainT th, td, h3, section a{
	font-family:'S-CoreDream-3Light', serif;
}
a{
	text-decoration:none;
	color:#2f2f2f;
	font-weight:500;
}
table a:hover{
	text-decoration:underline;
}

</style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp" />
	</nav> 
	
	<script type="text/javascript">
      function search(){
         if((pwsearch.id.value!=null)&&(pwsearch.email.value!=null)){
            pwsearch.submit();
         }else if(pwsearch.id.value==null) {
            alert("아이디를 입력하세요.")
         }else if(pwsearch.email.value==null) {
            alert("이메일주소를 입력하세요.")
         }
      
      }function showMsg(m){
         
         if(m==0){
            
         }else if(m==1){
            alert("입력하신 정보가 등록하신 정보와 다릅니다.");
            window.open("searchpw.ap","_self", "" );
         }
      }function login(){
         window.open("login.ap","_self","");
      }
   
   </script>
   
</head>
<body onload="showMsg(${msg})">

<h2 align="center">비밀번호 찾기</h2>
<div align="center">
<p >아이디와 이메일 주소를 입력해 주세요.</p>
<form action="sendpw.ap" name="pwsearch" method="post" >
   <table border="1" >
      
      <tr>
         <td>아이디</td>
         <td>e-mail</td>
      </tr>
      <tr>
         <td><input type="text" name="id"/></td>
         <td><input type="email" name="email" /></td>
      </tr>
      <tr align="center">
         <td colspan="2"><input type="button" value="비밀번호 찾기 " onclick="search()" /></td>  
      </tr>
   </table>

</form>
<c:url var="login" value="loginform.ap"/>
</div> 
<p align="center">로그인 페이지로 가시려면 <a href="${ login }"> &nbsp;[로그인페이지] &nbsp;</a>를 클릭하세요.</p>
</body>
</html>