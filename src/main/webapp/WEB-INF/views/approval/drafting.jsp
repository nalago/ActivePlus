<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath }/resources/approval/css/base.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/css/doc.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/css/submenu.css"/>
<link rel="stylesheet" href="${contextPath }/resources/approval/fontello/css/fontello.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="${contextPath }/resources/approval/ckeditor/ckeditor.js"></script>
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
            <jsp:include page="submenu/apvMenu.jsp"/>
            <div id="docwrap">
                <div id="doc">
                	<div id="docTop">
                    <div class="signaturewrap">
                        <div class="signature job">관리자</div>
                        <div class="signature sign"></div>
                        <div class="signature name">윤영관</div>
                        <div class="signature date"></div>
                    </div>
                    <br><br><br><br><br><br><br>
                    <hr>
                    &nbsp;
                    <input type="text" id="sign_title" placeholder="기안 제목">
                    <hr>&nbsp;
                    직위/직책 <input type="text" id="job" readonly placeholder="관리자">
                    <hr>&nbsp;
                    작성자명 <input type="text" id="name" readonly placeholder="윤영관">
                    <hr>&nbsp;
                    작성일 <input type="text" id="sign_date" readonly>
                    <hr>&nbsp;
                    기안 내용
                    </div>
                    <textarea id="editor">
                        <p>&nbsp;</p>

<table cellspacing="0" style="border-collapse:collapse; width:596px">
	<tbody>
		<tr>
			<td colspan="10" rowspan="2" style="border-bottom:.7px solid black; border-left:1px solid black; border-right:.7px solid black; border-top:1px solid black; height:94px; text-align:center; vertical-align:middle; white-space:nowrap; width:597px"><span style="font-size:24px"><strong><span style="font-family:돋움,monospace">구&nbsp;&nbsp; 매&nbsp;&nbsp; 품&nbsp;&nbsp; 의&nbsp;&nbsp; 서</span></strong></span></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:none; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:98px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td colspan="2" style="background-color:#f2f2f2; border-bottom:none; border-left:1px solid black; border-right:.7px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">구매목적</span></span></td>
			<td colspan="6" style="border-bottom:none; border-left:none; border-right:.7px solid black; border-top:1px solid black; vertical-align:middle; white-space:normal; width:435px"><span style="font-size:14px"><span style="font-family:돋움,monospace">어떤한 사유로..<br />
			아래와 같이 물품 구매를 하려고 합니다.<br />
			재가하여 주시기 바랍니다.</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:normal; width:22px"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">품번</span></span></td>
			<td colspan="4" style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:none; border-right:.7px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">품명</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">단가</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">수량</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">소계</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">1</span></span></td>
			<td colspan="4" style="border-bottom:1px solid black; border-left:none; border-right:.7px solid black; border-top:1px solid black; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">0</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">2</span></span></td>
			<td colspan="4" style="border-bottom:1px solid black; border-left:none; border-right:.7px solid black; border-top:1px solid black; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">0</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">3</span></span></td>
			<td colspan="4" style="border-bottom:1px solid black; border-left:none; border-right:.7px solid black; border-top:1px solid black; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">0</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">4</span></span></td>
			<td colspan="4" style="border-bottom:1px solid black; border-left:none; border-right:.7px solid black; border-top:1px solid black; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">0</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">5</span></span></td>
			<td colspan="4" style="border-bottom:1px solid black; border-left:none; border-right:.7px solid black; border-top:1px solid black; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">0</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><strong><span style="font-family:돋움,monospace">　</span></strong></span></td>
			<td colspan="5" style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:1px solid black; border-right:.7px solid black; border-top:1px solid black; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">합계</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">0</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">0</span></span></td>
			<td style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">0</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td rowspan="3" style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">구매처정보</span></span></td>
			<td colspan="7" rowspan="3" style="border-bottom:.7px solid black; border-left:1px solid black; border-right:.7px solid black; border-top:1px solid black; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:normal; width:22px"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:normal; width:22px"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td rowspan="3" style="background-color:#f2f2f2; border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:14px"><span style="font-family:돋움,monospace">특기사항</span></span></td>
			<td colspan="7" rowspan="3" style="border-bottom:.7px solid black; border-left:1px solid black; border-right:.7px solid black; border-top:1px solid black; vertical-align:middle; white-space:normal; width:512px"><span style="font-size:14px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:normal; width:22px"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:normal; width:22px"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td style="border-bottom:none; border-left:1px solid black; border-right:none; border-top:none; height:28px; text-align:center; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
			<td style="border-bottom:none; border-left:none; border-right:1px solid black; border-top:none; vertical-align:middle; white-space:nowrap"><span style="font-size:15px"><span style="font-family:돋움,monospace">　</span></span></td>
		</tr>
		<tr>
			<td colspan="10" rowspan="3" style="border-bottom:.7px solid black; border-left:1px solid black; border-right:.7px solid black; border-top:none; height:50px; text-align:center; vertical-align:middle; white-space:nowrap"></td>
		</tr>
		
		<tr>
		</tr>
		<tr>
		</tr>
	</tbody>
</table>

                    </textarea>
                </div>
                
                <script>
                    CKEDITOR.replace("editor",{
                        extraPlugins:"confighelper"
                    });
                </script>
                </div>
        </section>
        <div id="apvmodalwrap">
            <div id="apvmodal">
                <div id="modaltitle">
                    <h4>결재선 지정
                        <svg id="modalclose"  viewBox="0 0 16 16" class="bi bi-x-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path fill-rule="evenodd" d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                          </svg>
                    </h4>
                </div>
                <div id="modalcontent">
                    <div id="searchpersonwrap">
                        <h5>직원</h5>
                        <input id="searchperson" type="text">
                        <svg id="searchbutton" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                        </svg>
                        <div id="person">
                            <!-- 직원정보 출력하는곳 -->
                        </div>
                    </div>
                    <div id="modalbuttonwrap">
                        <button id="approverButton">결재자 등록</button>
                        <button id="consensusButton">합의자 등록</button>
                    </div>
                    <div id="procedurewrap">
                        <h5>결재선</h5>
                        <div id="procedure">
                            <!-- 직원정보에서 결재자 or 합의자 등록하면 출력 -->
                        </div>
                    </div>
                    <button id="enroll">등록</button>
                    <button id="cancel" onclick="closemodal();">취소</button>
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
                    <button id="confirmCancel" onclick="closeconfirm();">CANCEL</button>
                </div>
            </div>
        </div>
        <script>
            /* 모달창 열고 닫기 */
            function openmodal(){
                $("#apvmodalwrap").css("display","block");
            };
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
            /* confirm */
            function confirm(){
            $("#confirmwrap").css("display","block");
            }
            function closeconfirm(){
                $("#confirmwrap").css("display","none");
            }
        </script>
</body>
</html>