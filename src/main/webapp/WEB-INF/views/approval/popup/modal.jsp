<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 /* modal */
    #apvmodalwrap{
        top:0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        position: fixed;
        display: none;
    }

    #apvmodal{
        width: 1200px;
        height: 650px;
        top:50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background-color: #fff;
        position: fixed;
       
    }
    #modaltitle{
        
        width: 100%;
        height: 8%;
        background-color: #63ab68;
    }
    #modalclose{
        width: 3.5%;
        height: 50%;
        float: right;
        cursor: pointer;
    }
    #modalcontent{
        width: 100%;
        height: 92%;
    }
    #searchpersonwrap{
        width: 35%;
        height: 70%;
        background-color: rgba(10, 20, 15, 0.1);
        left: 7%;
        top:15%;
        display: inline-block;
        position: fixed;
    }
    #procedurewrap{
        width: 35%;
        height: 70%;
        background-color: rgba(10, 20, 15, 0.1);
        display: inline-block;
        position: fixed;
        right: 7%;
        top:15%;
    }
    #modalbuttonwrap{
        width: 100px;
        height: 100px;
        display: inline-block;
        position: fixed;
        top:25%;
        left: 46%;
    }
    #approverButton, #consensusButton{
        height: 35%;
        background-color: rgb(62, 142, 218);
        border: 0;
        border-radius: 5%;
    }
    #approverButton{
        margin-bottom: 5px;
    }

    #searchperson{
        width: 50%;
        margin-left: 75px;
    }
    #searchbutton{
        margin-bottom: 3px;
        width: 35px;
        height: 32px;
        border: 1px solid black;
        background-color:rgb(236, 228, 228);
        cursor: pointer;
    }
    #procedure, #person{
        margin-left: 10%;
        width: 80%;
        height: 80%;
        border: 1px solid black;
    }
    #enroll, #cancel{
        border: 0;
        width: 70px;
        height: 35px;
        display: inline-block;
        position: fixed;
        border-radius: 10%;
    }
    #cancel{
        bottom : 5%;
        right: 5%;
    }
    #enroll{
        background-color: rgb(62, 142, 218);
        bottom : 5%;
        right: 13%;
    }
</style>
</head>
<body>
<div id="modalwrap">
            <div id="modal">
                <div id="modaltitle">
                    <h4>
                        <svg id="modalclose"  viewBox="0 0 16 16" class="bi bi-x-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                          </svg>
                    </h4>
                </div>
                <div id="modalcontent">
                    
                    <button id="enroll">등록</button>
                    <button id="cancel" onclick="closemodal();">취소</button>
                </div>
            </div>
        </div>
        <script>
        /*취소버튼*/
        function closemodal(){
            $("#apvmodalwrap").css("display","none");
        }
        /* X 버튼 */
        $(function(){
            $("#modalclose").on("click",function(){
                $("#apvmodalwrap").css("display","none");
            });
        });
        </script>
</body>
</html>