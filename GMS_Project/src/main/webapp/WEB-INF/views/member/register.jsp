<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>P Gallery - Sign Up</title>
        <link href="${contextPath}/resources/css/styles1.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/user.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    	<script>
    	function formValidationCheck(){
    		
    		var name = document.getElementById("name");
    		if (name.value.length == 0) {
    			alert("이름을 입력하세요.");
    			name.focus();
    			return false;
    		}
    		var id = document.getElementById("id");
    		if (id.value.length == 0) {
    			alert("아이디를 입력하세요.");
    			id.focus();
    			return false;
    		}
    		
    		var email = document.getElementById("email");
    		if (email.value.length == 0) {
    			alert("이메일을 입력하세요.");
    			email.focus();
    			return false;
    		}
    		
    		var pw = document.getElementById("pw");
    		if (pw.value.length == 0) {
    			alert("비밀번호를 입력하세요.");
    			pw.focus();
    			return false;
    		}
    		
    		return true;
    		
    	}
    	</script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <!-- Basic registration form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">회원가입</h3></div>
                                    <div class="card-body">
                                        <!-- Registration form-->
                                        <form action="register" method="post" onsubmit="return formValidationCheck()">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <!-- Form Group (first name)-->
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="name">이름</label>
                                                        <input class="form-control" id="name" name="name" type="text" autofocus/>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <!-- Form Group (last name)-->
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="id">아이디</label>
                                                        <input class="form-control" id="id" name="id" type="text" />
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Form Group (email address)            -->
                                            <div class="form-group">
                                                <label class="small mb-1" for="email">이메일</label>
                                                <input class="form-control" id="email" name="email" type="email" />
                                            </div>
                                            <!-- Form Row    -->
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <!-- Form Group (password)-->
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="pw">비밀번호</label>
                                                        <input class="form-control" id="pw" name="pw" type="password"  />
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <!-- Form Group (confirm password)-->
<!--                                                     <div class="form-group">
                                                        <label class="small mb-1" for="inputConfirmPassword">비밀번호 확인</label>
                                                        <input class="form-control" id="inputConfirmPassword" type="password" />
                                                    </div> -->
                                                </div>
                                            </div>
                                            <!-- Form Group (create account submit)-->
                                            <div class="form-group mt-4 mb-0"><input type="submit" value="회원가입" class = "btn btn-primary btn-block"></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="login">이미 회원이신가요? 로그인</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="footer mt-auto footer-dark">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
                            <div class="col-md-6 text-md-right small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
