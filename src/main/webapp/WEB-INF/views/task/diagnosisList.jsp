<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        
        #searchwrap{
    margin-left: 750px;
    width: 500px;
}
        .search{
    margin-left: 10px;
    height: 35px;
    border-radius: 3px;
}
#searchwrap input{
    height: 30px;
}
#searchwrap button{
    width: 70px;
    background-color:  rgb(4, 163, 255);
    font-weight: bold;
    font-size: 16px;
}
#hisList {
    margin-left: 50px;
    width: 1250px;
    height: 100%;
}

#hisTable{
    text-align: center;
    margin-top: 30px;
    margin-left: 120px;
    border-radius: 3px;
    border: 1px solid black;
    border-spacing: 0;
}
#hisTable tr {
    height: 30px;
}

#hisTable th{
    background-color: lightgray;
    border:1px solid black;
    padding: 0;
    margin: 0;
}
#hisTable td{
    border-top:1px solid black;
    border-left:1px solid black; 
}
#pNo{
    width: 100px;
}
#cNo{
    width: 250px;
}
#pName{
    width: 100px;
}
#dName{
    width: 250px;
}
#dDay{
    width: 200px;
}
#status{
    width: 100px;
}
.pagingwrap{
    text-align:center;
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
	<nav id="side">
		<jsp:include page="../common/menubar.jsp"/>
	</nav>
	<jsp:include page="submenu/diagsubmenu.jsp"/>
	<section>
    <h1 id="submenuTitle">진료 기록</h1>
    <div id="searchwrap">
        <select class="search">
            <option>접수번호</option>
            <option>환자이름</option>
        </select>
        <input class="search" type="text">
        <button class="search">검색</button>
    </div>
    <div id="hisList">
        <table id="hisTable">
            <tr>
                <th id="pNo">환자번호</th>
                <th id="cNo">차트번호</th>
                <th id="pName">환자이름</th>
                <th id="dName">병명</th>
                <th id="dDay">진료일</th>
                <th id="status">상태</th>
            </tr>
            <tr>
                <td>18053013</td>
                <td>18AE-0026a</td>
                <td>김환우</td>
                <td>common cold</td>
                <td>2020-09--8</td>
                <td>외래</td>
            </tr>
            <tr>
                <td>18053013</td>
                <td>18AE-0026a</td>
                <td>김환우</td>
                <td>common cold</td>
                <td>2020-09--8</td>
                <td>외래</td>
            </tr>
            <tr>
                <td>18053013</td>
                <td>18AE-0026a</td>
                <td>김환우</td>
                <td>common cold</td>
                <td>2020-09--8</td>
                <td>외래</td>
            </tr>
            <tr>
                <td>18053013</td>
                <td>18AE-0026a</td>
                <td>김환우</td>
                <td>common cold</td>
                <td>2020-09--8</td>
                <td>외래</td>
            </tr>
            <tr>
                <td>18053013</td>
                <td>18AE-0026a</td>
                <td>김환우</td>
                <td>common cold</td>
                <td>2020-09--8</td>
                <td>외래</td>
            </tr>
        </table>
        <br>
    </div>
        <div class="pagingwrap">
            <a class="paging" href="#"><</a>
            <a class="paging" href="#">1</a>
            <a class="paging" href="#">2</a>
            <a class="paging" href="#">3</a>
            <a class="paging" href="#">4</a>
            <a class="paging" href="#">5</a>
            <a class="paging" href="#">></a>
        </div>
	</section>


</body>
</html>