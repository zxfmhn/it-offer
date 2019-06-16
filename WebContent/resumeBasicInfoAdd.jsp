<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/base.css"type="text/css"rel="stylesheet"/>
<link href="css/my_resume.css"type="text/css"rel="stylesheet"/>
<script src="../js/Calendar6.js"type="text/javascript"language="javascript"></script>
<script type="text/javascript">
function validate(){
	var realname = document.getElementById("realname");
	var telephone = document.getElementById("telephone");
	var email = document.getElementById("email");
	var emailPattern = /^([a-zA-z0-9_-])+@([a-zA-z0-9_-])+(.[a-zA-z0-9_-])+/;
	var phonePattern = /^(((13[0-9]{1})|159|153)+\d{8})$/;
	if(realname.value == ""){
		alert("姓名不能为空！");
		realname.focus();
		return false;
	}
	if(telephone.value == ""){
		alert("手机号不能为空！");
		telephone.focus();
		return false;
	}else if(!phonePattern.test(telephone.value)){
		alert("手机号格式不正确！");
		telephone.focus();
		return false;
	}
	if(email.value == ""){
		alert("邮箱不能为空！");
		email.focus();
		return false;
	}else if(!emailPattern.test(email.value)){
		alert("邮箱格式不正确！");
		email.focus();
		return false;
	}
	return true;
}

</script>
</head>
<body>
<iframe src="top.jsp" width="100%" height="100"  scrolling="no" frameborder="0" ></iframe>

<div class="resume_con">
	<!--tab设置-->
	<div class="user_operate">
		<ul style="float:left">
			<li><a href="resume.jsp" class="active">我的简历</a></li>
			<li><a href="jobApply.jsp">我的申请</a></li>
			<div class="clear"></div>
		</ul>
		<div class="clear"></div>
	</div>
    <!--主体部分-->
    <div class="resume_main">
    	<!--左边-->
	    <div class="resume_left">
			<div class="resume_title">
				<div style="float:left">基本信息</div></div>
			<div class="all_resume"style="text-align: center;"align="center">
			<form action="ResumeBasicinfoServlet?type=add"method="post"onsubmit="return validate();">
				<div class="table_style">
					<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">姓名：</th>
					    <td bgcolor="#F8F8F8"align="left">
					    <input type="text" id="realname" name="realName">
					     <font style="color:red">*</font></td>
					  </tr>
					</table>
					<div class="he"></div>
					<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">性别：</th>
					    <td bgcolor="#F8F8F8"align="left">
					    <input type="radio" name="gender" checked="checked"value="男">男
					    <input type="radio" name="gender" value="女">女</td>
					  </tr>
					</table>
					<div class="he"></div>
					<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">出生日期：</th>
					    <td bgcolor="#F8F8F8"align="left">
					    <input name="birthday" type="text" id="birthday" /></td>
					  </tr>
					</table>
					<div class="he"></div>
					<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
					   <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">当前所在地：</th>
					    <td bgcolor="#F8F8F8"align="left">
					    <input type="text" name="currentLoc"></td>
					  </tr></table>
					<div class="he"></div>
					<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
					   <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">户口所在地：</th>
					    <td bgcolor="#F8F8F8"align="left">
					    <input type="text" name="residentLoc"></td>
					    <tr></table>
					<div class="he"></div>
					<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">手机：</th>
					    <td bgcolor="#F8F8F8"align="left">
					    <input type="text" id="telephone" name="telephone">
					     <font style="color:red">*</font></td>
					  </tr>
					</table>
					<div class="he"></div>
					<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">邮件：</th>
					    <td bgcolor="#F8F8F8"align="left">
					    <input type="text" id="email" name="email" >
					     <font style="color:red">*</font></td>
					  </tr>
					</table>
					<div class="he"></div>
					<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">求职意向：</th>
					    <td bgcolor="#F8F8F8"align="left">
					    <input type="text" name="jobIntension"></td>
					  </tr>
					</table>
					<div class="he"></div>
					<table width="300" border="0" cellpadding="3" cellspacing="1" bgcolor="#EEEEEE">
					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">工作经验：</th>
					    <td bgcolor="#F8F8F8"align="left">
					    <select name="jobExperience">
					    <option value="0">请选择</option>
					    <option value="刚刚参加工作">刚刚参加工作</option>
					    <option value="已工作一年">已工作一年</option>
					    <option value="已工作两年">已工作两年</option>
					    <option value="已工作三年">已工作三年</option>
					    <option value="已工作三年以上">已工作三年以上</option>
					    </select></td>
		            </tr>
					</table>
					<div class="he"></div>
					<div align="center">
				    <input name="" type="submit" class="save1" value="保存"> 
					<input name="" type="reset" class="cancel2" value="取消"></div>
				</div>
				<div style="float:right" class="uploade"><img src="../images/person_img.jpg">
					<div align="center">
						<a href="#" class="uploade_btn">更换照片</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
	    </div>
    	<!--右边-->
		<iframe src="resume_right.jsp" width="290" height="650"  scrolling="no" frameborder="0"></iframe>
		<div style="clear:both"></div>
	</div>
</div>

<iframe src="foot.jsp" width="100%" height="150"  scrolling="no" frameborder="0" ></iframe>
</body>
</html>
