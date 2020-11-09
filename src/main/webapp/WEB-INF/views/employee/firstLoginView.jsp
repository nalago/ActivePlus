<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<title>Insert title here</title>
</head>

<body>
    <section class="login-form">
        <h1>최초로그인 하셨습니다<br>비밀번호를 변경해주세요</h1>
        <form action="passUpdate.ap" method="post" id="loginmember" onsubmit="return checkValue()">
            <div class="int-area">
                <input type="text" name="id" id="id" autocomplete="off" required value="${ employee.id }">
                <label for="id">User Name</label>
            </div>
            <div class="int-area">
                <input type="password" name="newpassword" id="pwd" autocomplete="off" required>
                <label for="id">new pass</label>
            </div>
            <div class="int-area">
                <input type="password" name="pwd" id="pwd" autocomplete="off" required>
                <label for="id">pass Check</label>
            </div>
            <input type="hidden" name="email" value="${ loginUser.email }">
            <input type="hidden" name="name" value="${ loginUser.name }">
            <input type="hidden" name="category" value="${ loginUser.category }">
            <input type="hidden" name="salary" value="${ loginUser.salary }">
            <input type="hidden" name="acc_no" value="${ loginUser.acc_no }">
            <input type="hidden" name="address" value="${ loginUser.address }">
            <input type="hidden" name="hire_date" value="${ loginUser.hire_date }">
            <input type="hidden" name="status" value="${ loginUser.status }">
            <input type="hidden" name="phone" value="${ loginUser.phone }">
            <input type="hidden" name="birth" value="${ loginUser.birth }">
            <input type="hidden" name="license_no" value="${ loginUser.license_no }">
            <input type="hidden" name="license_date" value="${ loginUser.license_date }">
            <input type="hidden" name="license" value="${ loginUser.license }">
            <br>
            <div class="btn-area">
                <button class="btn" type="submit">변경</button> 
            </div>
            <br>
            <div class="btn-area">
                <button class="btn" type="button" onclick="javascript:history.back();">취소</button>
            </div>
        </form>
       	
    </section>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
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

</body>
</html>