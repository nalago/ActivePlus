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
        display:none;
        z-index:99;
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
        margin-top: 100px;
        font-weight: bold;    
    }
    #alertText{
    	width:100%;
    	border:none;
    	text-align:center;
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
                    <h4><input id="alertText" type="text"  readonly/></h4>
                    <button type="button" id="alertCheck">확인</button>
                </div>
            </div>
        </div>
	<script>
		/* alert창 닫기*/
		$(function(){
			$("#alertCheck").on("click",function(){
				$("#alertwrap").css("display","none");
				
			});
		});
		/* alert창 열기*/
		(function(proxied) {
      	  window.alert = function(msg) {
      		 var text =  document.getElementById("alertText");
      		 $("#alertwrap").css("display","block");
            	 text.value = msg;
      	    return false;
      	  };
      })(window.alert);
		
		
	</script>
</body>
</html>