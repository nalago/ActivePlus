<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 /* confirm */
    #confirmwrap{
        top:0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        position: fixed;
        display: none;
    }
    #confirm{
        width: 500px;
        height: 350px;
        top:50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background-color: #fff;
        position: fixed;
        border-radius: 5px;
    }
    #confirmtitle{
        width: 100%;
        height: 10%;
        background-color: #63ab68;
    }
    #confirmcontent{
        margin-top: 110px;
        text-align: center;
    }
    #confirmOk, #confirmCancel{
        width: 110px;
        height: 50px;
        border: 0;
        border-radius: 8px;
        margin-top: 50px;
        font-weight: bold;    
        
    }
    #confirmOk{
        color: snow;
        background-color: rgb(62, 142, 218) ;
        margin-right: 20px;
    }
</style>
</head>
<body>
<div id="confirmwrap">
            <div id="confirm">
                <div id="confirmtitle">
                    <h5>&nbsp;알림</h5>
                </div>
                <div id="confirmcontent">
                    <h4>기안하시겠습니까?</h4>
                    <button id="confirmOk">OK</button>
                    <button id="confirmCancel" onclick="closeconfirm();">CANCEL</button>
                </div>
            </div>
        </div>


<script>
/* confirm */
window.confirm = function(message){
    $("#confirmwrap").css("display","block");
    
    
	
    $("#confirmOk").on("click", function () {
        return true;
    });

}

function closeconfirm(){
    $("#confirmwrap").css("display", "none");
}
</script>

</body>
</html>