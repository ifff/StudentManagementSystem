<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.actionForm.*" %>
<%String account = (String)session.getAttribute("Account");
	String accountType = (String)session.getAttribute("AccountType");
	if (account == null || "".equals(account)){
		response.sendRedirect("../../index.jsp");
	} 
%>
<%
	StudentDAO studentDAO = new StudentDAO();
	Collection stuInfo = studentDAO.studentInfo(account);
	String citizenship = "";
	String nation = "";
	String name_en = "";
	String gradu_sch = "";
	String pos_code = "";
	String telephone = "";
	String email = "";
	String home_addr = "";
	if (stuInfo != null && !stuInfo.isEmpty()){
		Iterator it = stuInfo.iterator();
		StudentForm studentForm = (StudentForm)it.next();
		citizenship = studentForm.getCitizenShip();
		name_en = studentForm.getNameEn();
		gradu_sch = studentForm.getGraduSch();
		pos_code = studentForm.getPosCode();
		telephone = studentForm.getTelephone();
		email = studentForm.getEmail();
		home_addr = studentForm.getHomeAddr();
		nation = studentForm.getNation();
	}
	else 
	{
		System.out.println("stuInfo is empty!");
	}
 %>
<html xmlns="http://www.w3.org/1999/xhtml">

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
				<li class="current">
					<a href="../StudentInfo/index.jsp" style="padding: 5px 30px 0;">������Ϣ</a>
				</li>
				<span class="sep">|</span>		
				<li >
					<a href="../Elective/index.jsp" style="padding: 5px 30px 0;">ѡ�ΰ���</a>
				</li>
				<span class="sep">|</span>	
				<li >
					<a href="../AchievementInfo/index.jsp" style="padding: 5px 30px 0;">�ɼ��鿴</a>
				</li>
				<span class="sep">|</span>				
				<li >
					<a href="../EvalCourse/index.jsp" style="padding: 5px 30px 0;">�γ�����</a>
				</li>
                <span class="sep">|</span>				
	  			<li >
					<a href="../Declaration/index.jsp" style="padding: 5px 30px 0;">�걨ϵͳ</a>
				</li>				
	 </ul>
	  <br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;��ӭ����<font color="#0000ff"><%=account%></font> &nbsp;��ǰ��ݣ�<font color="#0000ff"><%=accountType%></font>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='../../Images/Icon_Exit.gif'/><a href="../../logout.jsp">�˳�</a>
	</div>
</div>
<br/><br /><br />
<form id="form1" method="post" action="student?action=modifyInfo">
<table table width="65%"  class="TABLE_BODY" bordercolor="#777777" border="1" style="border-color:#777777;border-collapse:collapse" align="center">
  <tr class="TABLE_TH">
    <td colspan="6" align="center">������Ϣ�޸�</td>
  </tr>
  <tr class="TABLE_TR_01">
    <td >����</td>
    <td ><%=citizenship %></td>
    <td >����</td>
    <td ><%=nation %></td>
    <td >Ӣ������</td>
    <td ><label for="name_en"></label>
      <input type="text" name="name_en" id="name_en" value="<%=name_en %>"style="height:auto;width:auto"/></td>
  </tr>
  <tr class="TABLE_TR_02">
    <td >��ҵѧУ</td>
    <td><label for="gradu_sch"></label>
      <input type="text" name="gradu_sch" id="gradu_sch" value="<%=gradu_sch %>" style="height:auto;width:auto"/></td>
    <td>����</td>
    <td><label for="email"></label>
      <input name="email" type="text" id="email" value="<%=email %>"style="height:auto;width:auto" /></td>
    <td>�绰����</td>
    <td><label for="telephone"></label>
      <input type="text" name="telephone" id="telephone" value="<%=telephone %>"style="height:auto;width:auto"/></td>
  </tr>
  <tr class="TABLE_TR_01">
    <td >��ͥ�ʱ�</td>
    <td><label for="pos_code"></label>
      <input type="text" name="pos_code" id="pos_code" value="<%=pos_code%>" style="height:auto;width:auto"/></td>
    <td>��ͥסַ</td>
    <td colspan="3"><label for="home_addr"></label>
      <input type="text" name="home_addr" id="home_addr" value="<%=home_addr%>" style="height:auto;width:400px"/></td>
  </tr>
  <tr class="TABLE_TR_02">
    <td  colspan="6" align="center"><input type="submit" name="submit" id="submit" value="����" /></td>
    </tr>
</table>
<input type="hidden" name="account" value="<%=account %>"/>
</form>
<script type="text/javascript" src="../../JS/flash.js"></script>
</body>
</html>