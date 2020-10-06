<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/resources/approval/css/base.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/css/submenu.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/fontello/css/fontello.css">
<link rel="stylesheet" href="${contextPath }/resources/approval/css/docTypeList.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
#docListwrap{
        width: 1165px;
        height: 70%;
        float: right;
        display: inline-block;
        
    }

    #docList{
        margin-top:5%;
        margin-left: 13%;
        padding: 0;
        border: 1px solid black;
        border-radius: 5%;
        width: 80%;
    }
    #docList td,th{
        border: 1px solid black;
    }

    #drftitle{
        width: 15%;
    }
    #drfname{
        width: 15%;
    }
    #drfdate{
        width: 20%;
    }
    #apvname{
        width: 15%;
    }
    #apvdate{
        width: 20%;
    }
    #apvstatus{
        width: 10%;
    }
    .pagingwrap{
        text-align: center;
       
}
.paging{
    margin-left: 5px;
    width: 50px;
    height: 30px;
    background-color: white;
    font-weight: bold;
    color:black;
    text-decoration: none;
}
#modalwrap{
        
        top:0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.5);
        position: fixed;
        display: none;
}
#modal{
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
    #modalcontent{
        width: 100%;
        height: 92%;
    }
    #modalclose{
        width: 3.5%;
        height: 5%;
        float: right;
        cursor: pointer;
    }
    #doc {
        top: 8%;
        left: 0%;
        width: 700px;
        height: 92%;
        overflow-y: scroll;
        display: inline-block;
        position: fixed;
    }
    #docmenu{
        top:8%;
        right: 0%;
        width: 30%;
        height: 92%;
        background-color: rgb(236, 228, 228);
        display: inline-block;
        position: fixed;
    }
    #doc_acceptButton, #doc_cancelButton{
        width: 177px;
        border: 0;
        border-radius: 5%;
    }

    #doc_acceptButton{
        color: snow;
        background-color: rgb(62, 142, 218) ;
    }
    #apvprocedure{
        border: 1px solid black;
        width: 100%;
        height: 35%;
    }
    #apvcomment{
        border: 1px solid black;
        width: 100%;
        height: 35%;
    }
    #apvfile{
        width: 100%;
        height: 23%;
        border: 1px solid black;
    }
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
<jsp:include page="../common/menubar.jsp"/>
		<section>
        <jsp:include page="submenu/topMenu.jsp"/>
            <jsp:include page="submenu/docTypeList.jsp"/>
            
            <div id="docListwrap">
                <h4>결재 받을 문서</h4>
                <table id="docList">
                    <tr>
                        <th id="doctitle">문서명</th>
                        <th id="drfname">기안자</th>
                        <th id="drfdate">기안일</th>
                        <th id="apvname">최종결재자</th>
                        <th id="apvdate">최종결재일</th>
                        <th id="apvstatus">상태</th>
                    </tr>
                    <tr>
                        <td>휴가 신청서</td>
                        <td>윤영관</td>
                        <td>2020-10-01</td>
                        <td>최나라</td>
                        <td></td>
                        <td>결재중</td>
                    </tr>
                </table>
                <br><br>
                <div class="pagingwrap">
                    <a class="paging" href="#"><</a>
                    <a class="paging" href="#">1</a>
                    <a class="paging" href="#">2</a>
                    <a class="paging" href="#">></a>
                </div>
            </div>

    </section>
    <div id="modalwrap">
        <div id="modal">
            <div id="modaltitle">
                <h4>양식명
                    <svg id="modalclose"  viewBox="0 0 16 16" class="bi bi-x-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                        <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                      </svg>
                </h4>
            </div>
            <div id="modalcontent">
                <div id="doc">
                	<div id="docTop"></div>
                	<div id="docContent"></div>
                </div>
                <div id="docmenu">
                    <!--승인 버튼 -->
                    <button id="doc_acceptButton" onclick="confirm();">
                        <svg width="40px" color="snow" viewBox="0 0 16 16" class="bi bi-file-earmark-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path d="M4 0h5.5v1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h1V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/>
                            <path d="M9.5 3V0L14 4.5h-3A1.5 1.5 0 0 1 9.5 3z"/>
                            <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                        </svg>
                        승인
                    </button>
                    <!--반려 버튼-->
                    <button id="doc_cancelButton">
                        <svg width="40px" color="gray" viewBox="0 0 16 16" class="bi bi-file-earmark-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path d="M4 0h5.5v1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h1V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"/>
                            <path d="M9.5 3V0L14 4.5h-3A1.5 1.5 0 0 1 9.5 3z"/>
                            <path fill-rule="evenodd" d="M6.146 7.146a.5.5 0 0 1 .708 0L8 8.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 9l1.147 1.146a.5.5 0 0 1-.708.708L8 9.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 9 6.146 7.854a.5.5 0 0 1 0-.708z"/>                            
                        </svg>
                        반려
                    </button>
                    <div id="apvprocedure">
                        결재 순서
                    </div>
                    <div id="apvcomment">
                        의견
                    </div>
                    <div id="apvfile">
                        첨부파일
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="confirmwrap">
        <div id="confirm">
            <div id="confirmtitle">
                <h5>&nbsp;알림</h5>
            </div>
            <div id="confirmcontent">
                <h4>승인하시겠습니까?</h4>
                <button id="confirmOk">OK</button>
                <button id="confirmCancel">CANCEL</button>
            </div>
        </div>
    </div>
 
    <script>
        function confirm(){
            $("#confrimwrap").css("display","block");
        }
        
    </script>

</body>
</html>