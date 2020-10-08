<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#alertwrap{
		top:0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        position: fixed;
        
		
	}
	#alert{
		width: 500px;
        height: 350px;
        top:50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background-color: #fff;
        position: fixed;
        border-radius: 5px;
	}
	#alerttitle{
        width: 100%;
        height: 10%;
        background-color: #63ab68;
    }
    #alertcontent{
        margin-top: 110px;
        text-align: center;
    }
    #alertCheck{
    	text-align:center;
    	color: snow;
        background-color: rgb(62, 142, 218) ;
        width: 110px;
        height: 50px;
        border: 0;
        border-radius: 8px;
        margin-top: 130px;
        font-weight: bold;    
    }
</style>
</head>
<body>
<div id="alertwrap">
            <div id="alert">
                <div id="alerttitle">
                    <h5>&nbsp;알림</h5>
                </div>
                <div id="alertcontent">
                    <h4>${msg }</h4>
                    <button id="alertCheck">확인</button>
                </div>
            </div>
        </div>
	<script>
		$(function(){
			$("#alertCheck").on("click",function(){
				$("#alertwrap").css("display","none");
			});
		});
	</script>
</body>
</html>