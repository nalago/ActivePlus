<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #user{
    padding-left: 10px;
    width: 150px;
    font-size: 17px;
    color : black;
    
}
#buttonwrap{
    width: 100%;
}
#logo{
    box-sizing: border-box;
    height: 55px;
    width: 150px;
    float: right;
    margin-right: 20px;
}
#info{
    margin-left: 15px;
    text-decoration: none;
    color : black;
}

    .profile{
        height: 100px;
    }
    .buttonwrap{
        margin-top:40px;
        margin-left:250px;
    }
    .buttonwrap button{
        color:black;
        background-color: white;
        border: none;
        font-size: 20px;
        font-weight: bold;
        padding-left: 15px;
    }
</style>
</head>
<body>
	
    <div class="topnav">
        <div class="topmenu">
            <div class="profile">
                <span id="user" class="profile">@${ loginUser.category } @${ loginUser.name }님</span>
                <span><a id="info" class="profile" href="#">개인정보</a></span>
                <img id="logo" src="img/active.png">
                <div class="buttonwrap">
                       <button>진료</button>
                       <button>진료기록</button>
                   </div>
            </div>
           </div>
    </div>
    
</body>
</html>