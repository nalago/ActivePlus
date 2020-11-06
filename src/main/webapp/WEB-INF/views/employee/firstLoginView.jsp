<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
    
        // 회원가입 화면의 입력값들을 검사한다.
        function checkValue()
        {
            var form = document.userInfo;

            if(!form.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }

            if(!form.newpassword.value){
                alert("새로운 비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(form.newpassword.value != form.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }    
        }
        
           
   </script>
<body>
<br><br>
        <b><font size="6" color="black">최초로그인 하셨습니다<br>비밀번호를 변경해주세요</font></b>
        <br><br><br>
        
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
        <form method="post" action="passUpdate.ap" 
                name="userInfo" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" id="userid" maxlength="50" value="${ employee.id }" readonly>
                    </td>
                </tr>
                <!-- <tr>
                    <td id="title">현재 비밀번호</td>
                    <td>
                        <input type="password" name="originpassword" maxlength="50">
                    </td>
                </tr> -->
                <tr>
                    <td id="title">변경 비밀번호</td>
                    <td>
                        <input type="password" name="newpassword" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">비밀번호 확인</td>
                    <td>
                        <input type="password" name="pwd" maxlength="50">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="변경">  
            <input type="button" value="취소" onclick="javascript:history.back();">
        </form>
 

</body>
</html>