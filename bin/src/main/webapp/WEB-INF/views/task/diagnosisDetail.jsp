<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
       

        th{
            background-color: lightgray;
            font-weight: bold;
            width: 70px;
        }
        
        #charttop{
            float: right;
            margin-right: 50px;
        }
        #charttop td{
            width: 100px;
        }
        #charttop th, #charttop td {
            border:1px solid black;
        }
        /* 차트 환자정보 */
        #chartcontent{
            margin-left: 100px;
            text-align:center;
            border: 1px solid black;
            border-spacing: 0;
        }
        #chartcontent th{
            width: 100px;
            border-right: 1px solid black;
            border-bottom: 1px solid gray;
        }
        

        #chartcontent td{
            width: 300px;
            padding: 0;
            box-sizing: content-box;
            border-bottom: 1px solid gray;
        }
        /* 보험체크박스 */
        #local, #job{
            display: none;
        }
        h2{
            margin-left: 100px;
            margin-bottom: 5px;
        }
        /* 조치 */
        #actionDetailWrap{
            float: left;
            width: 500px;
        }
        #actionDetail{
            width:450px;
            height: 200px;
            margin-left: 100px;
        }
        /* 처방 */
        #prescription{
        	
            overflow-x: hidden;
            overflow-y: scroll;
            float: left;
            width: 750px;
            height: 290px;
        }
        /* 처방 추가 버튼 */
        #pluspre{
            margin-left: 705px;
        }

        #prescriptList{
            margin-left: 100px;
            text-align: center;
            height: 200px;
        }
        #preNo{
            width: 50px;
        }
        #preName{
            width: 250px;
        }
        #preDay{
            width: 130px;
        }
        #preTotal{
            width: 80px;
        }
        #usage{
            width: 80px;
        }
        /*환자메모*/
        #patientMemoWrap{
            float: left;
            width: 500px;
        }
        #patientMemo{
            margin-left: 100px;
            width: 450px;
            height: 150px;
        }
        /* 과거력 */
        #historyWrap{
            float: left;
            width: 700px;
        }
        #patienthistory{
            margin-left: 100px;
            width: 450px;
            height: 150px;
        }
        /* 등록, 취소버튼 */
        #submit,#cancle{
            width: 80px;
            height: 40px;
            border-radius: 5px;
            border-style: none;
            font-weight: 900;
            font-size: 17px;
        }
        #submit{
            margin-top: 30px;
            margin-left: 580px;
            background-color: rgb(4, 163, 255);
            margin-right: 25px;
        }
        /* input 태그 속성조절 (전체) */
        input{
            padding: 0;
            border: none;
            font-size: 15px;
            width: 100%;
            height: 100%;
            text-align: center;
        }
        textarea{
            /* 크기조절 막기 */
            resize: none;
        }
        #submenuTitle{
        	margin-bottom : 0;
        }
    </style>
</head>
<body>
	<nav id="side">
		<jsp:include page="../common/menubar.jsp"/>
	</nav>
	<div id="subMenu">
			<a class="menu" href="#">진료</a>
			<a class="menu" href="#">진료기록</a>
			<a class="menu" href="#">예약조회</a>
			<br><br>
	</div>
	<section>
    <h1 id="submenuTitle">진료</h1>
	<table id="charttop">
        <tr>
            <th>차트번호</th>
            <td><input type="text"placeholder="18AE-0026a"></td>
            <th>병명</th>
            <td><input type="text" placeholder="common cold"></td>
        </tr>
        <tr>
            <th>담당의</th>
            <td><input type="text" placeholder="김건희"></td>
            <th>작성일</th>
            <td><input type="text" placeholder="2020-09-11"></td>
        </tr>
    </table>

    <br><br><br>
    <table id="chartcontent">
        <tr>
            <th>환자번호</th>
            <td><input type="text" placeholder="18051301"></td>
            <th>주소</th>
            <td><input type="text" placeholder="서울시 강남구 테헤란로"></td>
            <th>장애구분</th>
            <td><input type="text" placeholder="무"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input type="text"placeholder="김환우"></td>
            <th>전화번호</th>
            <td><input type="text" placeholder="010-4151-2315"></td>
            <th>최초방문일</th>
            <td><input type="text" placeholder="2020-09-11"></td>
        </tr>
        <tr>
            <th>주민등록번호</th>
            <td><input type="text" placeholder="901210-1014123"></td>
            <th>보험자격</th>
            <td class="check">
                <!-- 클릭 시 체크박스 체크되고, css 속성 바뀌도록 작성하기 -->
                <label for="local" class="insurance">
                    <input type="radio" id="local" name="insurance" value="local">
                    지역가입자
                </label>/
                <label for="job" class="insurance">
                    <input type="radio" id="job" name="insurance" value="job">
                    직장가입자
                </label>
            </td>
            <th>최종방문일</th>
            <td><input type="text" placeholder="2020-09-11"></td>
        </tr>
    </table>
    <div id="actionDetailWrap">
        <h2>조치내용</h2>
        <textarea id="actionDetail"></textarea>
    </div>
    <div id="prescription">
        <h2>처방내용</h2><button id="pluspre">+</button>
        
        <table id="prescriptList">
            <tr id="preRow">
                <th>코드</th>
                <th>명칭</th>
                <th>일일투여량(mg)</th>
                <th>총투여량</th>
                <th>용법/용량</th>
            </tr>
            <tr>
                <td><input type="text" placeholder="151" id="preNo"></td>
                <td><input type="text" placeholder="삐콤정" id="preName"></td>
                <td><input type="text" placeholder="1000" id="preDay"></td>
                <td><input type="text" placeholder="3" id="preTotal"></td>
                <td><input type="text" placeholder="1/1,000" id="usage"></td>
            </tr>
            <tr>
                <td><input type="text" placeholder="151" id="preNo"></td>
                <td><input type="text" placeholder="삐콤정" id="preName"></td>
                <td><input type="text" placeholder="1000" id="preDay"></td>
                <td><input type="text" placeholder="3" id="preTotal"></td>
                <td><input type="text" placeholder="1/1,000" id="usage"></td>
            </tr>
            <tr>
                <td><input type="text" placeholder="151" id="preNo"></td>
                <td><input type="text" placeholder="삐콤정" id="preName"></td>
                <td><input type="text" placeholder="1000" id="preDay"></td>
                <td><input type="text" placeholder="3" id="preTotal"></td>
                <td><input type="text" placeholder="1/1,000" id="usage"></td>
            </tr>
            <tr>
                <td><input type="text" placeholder="151" id="preNo"></td>
                <td><input type="text" placeholder="삐콤정" id="preName"></td>
                <td><input type="text" placeholder="1000" id="preDay"></td>
                <td><input type="text" placeholder="3" id="preTotal"></td>
                <td><input type="text" placeholder="1/1,000" id="usage"></td>
            </tr>
            <tr>
                <td><input type="text" placeholder="151" id="preNo"></td>
                <td><input type="text" placeholder="삐콤정" id="preName"></td>
                <td><input type="text" placeholder="1000" id="preDay"></td>
                <td><input type="text" placeholder="3" id="preTotal"></td>
                <td><input type="text" placeholder="1/1,000" id="usage"></td>
            </tr>
            <tr>
                <td><input type="text" placeholder="151" id="preNo"></td>
                <td><input type="text" placeholder="삐콤정" id="preName"></td>
                <td><input type="text" placeholder="1000" id="preDay"></td>
                <td><input type="text" placeholder="3" id="preTotal"></td>
                <td><input type="text" placeholder="1/1,000" id="usage"></td>
            </tr>
            <tr>
                <td><input type="text" placeholder="151" id="preNo"></td>
                <td><input type="text" placeholder="삐콤정" id="preName"></td>
                <td><input type="text" placeholder="1000" id="preDay"></td>
                <td><input type="text" placeholder="3" id="preTotal"></td>
                <td><input type="text" placeholder="1/1,000" id="usage"></td>
            </tr>
            <tr>
                <td><input type="text" placeholder="151" id="preNo"></td>
                <td><input type="text" placeholder="삐콤정" id="preName"></td>
                <td><input type="text" placeholder="1000" id="preDay"></td>
                <td><input type="text" placeholder="3" id="preTotal"></td>
                <td><input type="text" placeholder="1/1,000" id="usage"></td>
            </tr>
            
        </table>
   
    </div>
    <div id="patientMemoWrap">
        <h2>환자 메모</h2>
        <textarea id="patientMemo"></textarea>
    </div>
    <div id="historyWrap">
        <h2>과거 병력</h2>
        <textarea id="patienthistory"></textarea>
    </div>
    <br><br>
    <br><br>
    <button id="submit">등록</button>
    <button id="cancle">취소</button>
    <br>
    </section>
    <script>
        $(function(){
            $("#local").click(function(){
                console.log($(this).parent().eq(0));
                console.log(this.value);
                $(this).parent().eq(0).css("color","lightblue");
                $(this).parent().parent().children().eq(1).css("color","black");
            });
        })
        $(function(){
            $("#job").click(function(){
                console.log(this.value);
                console.log($(this).parent().parent().children().eq(1));
                $(this).parent().eq(0).css("color","lightblue");
                $(this).parent().parent().children().eq(0).css("color","black");
            });
        })
    </script>

</body>
</html>