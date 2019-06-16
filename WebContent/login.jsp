<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
</script>
</head>
<body>
<% 
String applicantEmail = "";
String applicantPwd = "";
Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(Cookie cookie:cookies){
		if("COOKIE_APPLICANTEMAIL".equals(cookie.getName())){
			applicantEmail = cn.edu.imnu.itoffer.util.CookieEncryptTool.decodeBase64(cookie.getValue());
		}
		if("COOKIE_APPLICANTPWD".equals(cookie.getName())){
			applicantPwd =  cn.edu.imnu.itoffer.util.CookieEncryptTool.decodeBase64(cookie.getValue());
		}
	}
}
%>
<iframe src="top.jsp" width="100%" height="100"  scrolling="no" frameborder="0" ></iframe>
<div class="content">
 <div class="page_name">登录</div>
 <div class="login_content">
			<form action="ApplicantLoginServlet" method="post"
				onsubmit="return validate();">
				<div class="login_l">
					<p class="font14"">使用注册邮箱登录</p>
					<div class="span1">
						<label class="tn-form-label">邮箱：</label> 
						<input class="tn-textbox"type="text" name="email" id="email"value="<%= applicantEmail %>">
					</div>
					<div class="span1">
						<label class="tn-form-label">密码：</label> 
						<input class="tn-textbox"type="password" 
						name="password" id="password"value="<%= applicantPwd %>">
					</div>
					<div class="tn-form-row-button">
					<div class="span1">
							<input name="submit" type="submit" class="tn-button-text"
								value="登   录">
								<span class="it-register-text">
								<input checked="checked"name="rememberMe"id="rememberMe"class="tn-ccccheckbox"type="checkbox"value="true">
								<laber for="RememberPassword"style="color:gray">
								记住密码</laber></span>
						</div>
					</div>
				</div>
			</form>
		</div>
<iframe src="foot.jsp" width="100%" height="150"  scrolling="no" frameborder="0" ></iframe>         
</body>
</html>