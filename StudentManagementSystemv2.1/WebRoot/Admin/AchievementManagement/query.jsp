<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%String account = (String)session.getAttribute("Account");
	String accountType = (String)session.getAttribute("AccountType");
	if (account == null || "".equals(account)){
		response.sendRedirect("../../index.jsp");
	} 
	String stu_num = "";
	String stu_name = "";
	String entr_time = "";
	String college = "";
	String course_id = "";
	session.setAttribute("college", account);
	float min_score = 0;
	float max_score = 100;
%>
<head>
<title>�о�������ϵͳ</title>
<script language="javascript">
	function check(form){
		if(form.content.value=="") {
			alert("������Ҫ��ѯ��ѧ����Ϣ��");
			form.content.focus();
			return false;
		}
		if (form.stu_num.value.equals("") && form.stu_name.value.equals("")
				&& form.entr_time.value.equals("") && form.college.value.equals("")
				&& form.course_id.value.equals("") && form.min_score.value.equals("") 
				&& form.max_socre.value.equals("") ){
			alert("������Ҫ��ѯ��ѧ����Ϣ��");
			form.name.focus();
			return false;
		}
	}
</script>
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
      	<span class="sep">|</span>	 
		<li >
			<a href="../index.jsp" style="padding: 5px 30px 0;">��ҳ</a>
		</li> 
        <span class="sep">|</span>	
		<li >
			<a href="../StudentManagement/index.jsp" style="padding: 5px 30px 0;">Ժϵѧ������</a>
		</li>
		<span class="sep">|</span>		
		<li class="current">
			<a href="../AchievementManagement/index.jsp" style="padding: 5px 30px 0;">Ժϵ�ɼ�����</a>
		</li>
		<span class="sep">|</span>	
		<li>
			<a href="../CourseManagement/index.jsp" style="padding: 5px 30px 0;">Ժϵ�γ̹���</a>
		</li>
        <span class="sep">|</span>				
		<li >
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
<br/><br /><br />
<div align="center">
   <form id="form1" name="form1" method="post" action="admin?action=getgrades" >
      <p>
        <label for="keywords">���ҹؼ���</label>
        <select name="keywords" id="keywords">
          <option value="0">ѧ��</option>
          <option value="1">����</option>
          <option value="2">�꼶</option>
          <option value="3">�γ̺�</option>
        </select>
        <label for="content"></label>
        <input type="text" name="content" id="content" value="<%%>"/>
      </p>
      <p>
        <label for="college">Ժϵ</label>
        <select name="college" id="college">
          <option value="100">�������ѧ�뼼��ϵ</option>
          <option value="101">��ѧϵ</option>
        </select>
      </p>
      <p>
        <input type="submit" name="submit" id="submit" value="�ύ" onclick="return check(form1)"/>
      </p>
    </form>
</div>
<script type="text/javascript" src="../../JS/flash.js"></script>
</body>
</html>