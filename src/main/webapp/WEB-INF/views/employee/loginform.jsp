<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.js"
     integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM="
     crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<section class="login-form">
        <h1>ActivePlus에 로그인해주세요</h1>
        <form action="login.ap" method="post" id="loginmember">
            <div class="int-area">
                <input type="text" name="id" id="id" autocomplete="off" required>
                <label for="id">User Name</label>
            </div>
            <div class="int-area">
                <input type="password" name="pwd" id="pwd" autocomplete="off" required>
                <label for="pwd">User Pass</label>
            </div>
            <div class="btn-area">
                <button id="btn" type="submit">Login</button>
            </div>
        </form>
       	<c:url var="searchpw" value="searchpw.ap"/>
        <div class="caption">
            <a href="${ searchpw }">Forgot Password?</a>
        </div>
    </section>
   

    <script>
        let id = $('#id');
        let pwd = $('#pwd');
        let btn = $('#btn');

        $(btn).on('click', function(){
            if($(id).val() == "") {
                $(id).next('label').addClass('warning');
                setTimeout(function(){
                    $('label').removeClass('warning');
                },1500);
            }
            else if($(pwd).val() == ""){
                $(pwd).next('label').addClass('warning');
                setTimeout(function(){
                    $('label').removeClass('warning');
                },1500);
            }
        });
        
        var message = '${msg}';
        var returnUrl = '${url}';
        alert(msg);
        document.location.href = returnUrl;
    </script>
</body>
</html>