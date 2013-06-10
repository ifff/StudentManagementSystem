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
.tablehead {
	font-size: 18px;
	font-weight: bold;
}
</style>
<script language="javascript">
	function check(form) {
		if (form.user.value=="") {
			alert("�û�������Ϊ�գ�");
			form.account.focus();
			return false;
		}
		if (form.pwd.value == "") {
			alert("���벻��Ϊ�գ�");
			form.pwd.focus();
			return false;
		}
		if (form.college_name.value == "") {
			alert("Ժϵ���Ʋ���Ϊ��!");
			form.college_name.focus();
			return false;
		}
	}
</script>
</head>

<body>

<div id="Header">
	  <ul  id="1" class="MenuBar">	 
      	<span class="sep">|</span>	 
		<li >
			<a href="../index.jsp" style="padding: 5px 30px 0;">��ҳ</a>
		</li> 
        <span class="sep">|</span>	
		<li >
			<a href="../StudentManagement/index.jsp" style="padding: 5px 30px 0;">Ժϵѧ������</a>
		</li>
		<span class="sep">|</span>		
		<li>
			<a href="../AchievementManagement/index.jsp" style="padding: 5px 30px 0;">Ժϵ�ɼ�����</a>
		</li>
		<span class="sep">|</span>	
		<li>
			<a href="../CourseManagement/index.jsp" style="padding: 5px 30px 0;">Ժϵ�γ̹���</a>
		</li>
        <span class="sep">|</span>				
		<li class="current">
			<a href="../AcdemicDeanInfo/index.jsp" style="padding: 5px 30px 0;">����Ա��Ϣ����</a>
		</li>
		<span class="sep">|</span>
		<li>
			<a href="../NotificationManagement/index.jsp" style="padding: 5px 30px 0;">֪ͨ����</a>
		</li>
	 </ul>
	<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;��ӭ����<font color="#0000ff"><%=account%></font> &nbsp;��ǰ��ݣ�<font color="#0000ff"><%=accountType%></font>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='../../Images/Icon_Exit.gif'/><a href="../../logout.jsp">�˳�</a>
	</div>
	
<br/><br /><br /><br/>

<form id="form1" method="post" action="admin?action=addAcdemicDean">
<table width='35%'  class='TABLE_BODY' bordercolor='777777' border='1' style='border-color:#777777;border-collapse:collapse' align='center'>
  <tr class='TABLE_TH'>
    <td colspan="2" align="center" class="tablehead">��ӽ���Ա��Ϣ</td>
  </tr>
  <tr class='TABLE_TR_01'>
    <td align="center">�û�����</td>
    <td ><label for="user"></label>
      <input type="text" name="user" id="user" /></td>
  </tr>
  <tr class='TABLE_TR_02'>
    <td align="center">���룺</td>
    <td><label for="pwd"></label>
      <input type="password" name="pwd" id="pwd" /></td>
  </tr>
  <tr class='TABLE_TR_01'>
    <td align="center">Ժϵ���ƣ�</td>
    <td><label for="collegename"></label>
      <input type="text" name="collegename" id="collegename" /></td>
  </tr>
  <tr class='TABLE_TR_02'>
    <td colspan="2" align="center"><input type="submit" name="submit" id="submit" value="�ύ" onclick="return check(form1)"/>&nbsp;&nbsp;&nbsp;
      <input type="reset" name="reset" id="reset" value="����" /></td>
    </tr>
</table>
</form>
<script type="text/javascript" src="../../JS/flash.js"></script>
</body>
</html>