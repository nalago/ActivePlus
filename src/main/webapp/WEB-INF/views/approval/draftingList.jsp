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
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    
<title>Insert title here</title>
<style>

    #ListWrap{
        display: inline-block;
        width: 65%;
        height: 70%;
        margin-left: 50px;
        margin-top:100px;
        position: absolute;
        border: 1px solid black;
    }
    #docList{
        width: 100%;
        border: 1px solid black;
        border-radius: 3px;
    }
    #docList *{
        padding: 0;
        margin: 0;
        border: 1px solid black;
    }
    .doctitle{
        width: 30%;
    }
    .doccontent{
        width: 70%;
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
    
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<section>
        <jsp:include page="submenu/topMenu.jsp"/>
            <script>
                $(function(){
                    $("#listButtonopen").on("click",function(){
                        console.log($("#doctypeList"));
                       $("#doctypeList").css("display","inline-block");
                       $(this).css("display","none");
    
                    });
                    $("#listButtonclose").on("click",function(){
                        $("#doctypeList").css("display","none");
                        $("#listButtonopen").css("display","inline-block");
                    });
                });
            </script>
            <jsp:include page="submenu/docTypeList.jsp"/>
            
           <div id="ListWrap">
               <br>
               <h3>공통 양식</h3>
               <br>
                <table id="docList">
                    <tr>
                        <th class="doctitle">양식명</th>
                        <th class="doccontent">설명</th>
                    </tr>
                    <tr>
                    <c:url var="docDetail" value="docDetail.ap"/>
                        <td class="doctitle"><a href="${docDetail }">휴가신청서</a></td>
                        <td class="doccontent">휴가 작성 양식</td>
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
           <script>
           		
           </script>
    </section>

</body>
</html>