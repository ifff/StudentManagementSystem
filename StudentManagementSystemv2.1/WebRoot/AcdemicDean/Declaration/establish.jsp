<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%String account = (String)session.getAttribute("Account");
	String accountType = (String)session.getAttribute("AccountType");
	if (account == null || "".equals(account)){
		response.sendRedirect("../../index.jsp");
	} 
%>
<head>
<title>�о�������ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript" src="../../JS/jquery-1.3.2.js"></script>
<link href="../../CSS/inner.css" rel="stylesheet" type="text/css" />
<style>
.MenuBar li a:hover,.MenuBar li a:active{border:none;color:#00B5F7;text-decoration:none;}
.MenuBar .sep{padding-top:13px;font-size:10px;color:#aeadad;float:left;height:20px;border-top:none;}
.MenuBar{position:relative;height:28px;float:left;}
.MenuBar .current{color:#008ace;}
.MenuBar .current a{color:#008ace;}
.MenuBar li{float:left;list-style:none;padding-bottom:11px;}
.MenuBar li.back{background:url(../../Images/b_slider.gif) center bottom no-repeat;width:120px;height:28px;z-index:8;position:absolute;}
.MenuBar li a{font:bold 14px arial;text-decoration:none;color:#303030;outline:none;text-align:center;top:6px;letter-spacing:0;z-index:10;display:block;float:left;height:28px;position:relative;overflow:hidden;padding:5px 20px 0 17px;font-family:"Microsoft Yahei",Arial,Helvetica,sans-serif,"΢���ź�";font-weight:normal;font-size:13px;}
</style>
</head>

<body>
<div id="Header">
	  <ul  id="1" class="MenuBar">	 
      			<li >
					<a href="../index.jsp" style="padding: 5px 30px 0;">��ҳ</a>
				</li> 
                <span class="sep">|</span>	
				<li>
					<a href="../EnrolmentInfo/index.jsp" style="padding: 5px 30px 0;">ѧ����Ϣ</a>
				</li>
				<span class="sep">|</span>		
				<li >
					<a href="../Elective/index.jsp" style="padding: 5px 30px 0;">ѡ�ΰ���</a>
				</li>
				<span class="sep">|</span>	
				<li >
					<a href="../AchievementManagement/index.jsp" style="padding: 5px 30px 0;">�ɼ�����</a>
				</li>
				<span class="sep">|</span>				
				<li class="current">
					<a href="../Declaration/index.jsp" style="padding: 5px 30px 0;">�걨ϵͳ</a>
				</li>
                <span class="sep">|</span>	
                <li >
					<a href="../EvalCourse/index.jsp" style="padding: 5px 30px 0;">�γ�����</a>
				</li>
        		<span class="sep">|</span>				
	  			<li >
					<a href="../Notification/index.jsp" style="padding: 5px 30px 0;">֪ͨ����</a>
				</li>
	 </ul>
	  <br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;��ӭ����<font color="#0000ff"><%=account%></font> &nbsp;��ǰ��ݣ�<font color="#0000ff"><%=accountType%></font>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='../../Images/Icon_Exit.gif'/><a href="../../logout.jsp">�˳�</a>
	</div>
</div>
<br/><br /><br /><br/>
<form id="form1" method="post" action="acdemicDean?action=establish">
<table width='75%'  class='TABLE_BODY' bordercolor='777777' border='1' style='border-color:#777777;border-collapse:collapse' align='center'>
 <tr class='TABLE_TH'>
    <td>��Ŀ����</td>
    <td>ָ����ʦ</td>
    <td>��Ŀ���</td>
    <td>�Ƿ���</td>
  </tr>
  <tr class='TABLE_TR_01'>
    <td><label for="proj_name"></label>
    <input type="text" name="proj_name" id="proj_name" /></td>
    <td><label for="teacher_name"></label>
    <input type="text" name="teacher_name" id="teacher_name" /></td>
    <td><label for="brief_intro"></label>
    <textarea name="brief_intro" id="brief_intro" cols="45" rows="5"></textarea></td>
    <td><input type="checkbox" name="selected" id="selected" />
    <label for="selected"></label></td>
  </tr>
  <tr class='TABLE_TR_02'>
  <td td colspan='6' align='center'><input type="submit" name="save" id="save" value="�ύ" /></td>
  </tr>
</table>
<input type="hidden" name="account" value="<%=account %>"/>
</form>
<script type="text/javascript" src="../../JS/flash.js"></script>
</body>
</html>