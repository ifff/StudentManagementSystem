<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.actionForm.*" %>
<%
	String account = (String)session.getAttribute("Account");
	String accountType = (String)session.getAttribute("AccountType");
	if (account == null || "".equals(account)){
		response.sendRedirect("../../index.jsp");
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
				<li >
					<a href="../StudentInfo/index.jsp" style="padding: 5px 30px 0;">������Ϣ</a>
				</li>
				<span class="sep">|</span>		
				<li class="current">
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
<br/><br /><br /><br/>
<form id="form1" method="post" action="student?action=chooseCourse">
  <%
  
  	if (account == null || "".equals(account)){
		
	}
	else{
	  	StudentDAO studentDAO = new StudentDAO();
		Collection courInfo = studentDAO.queryCourse(null);
		ChooseCourseTimeForm chooseCourseTimeForm = studentDAO.queryChooseCourseTime(account.substring(2,5));
		int id = -1;
		String nameC = "";
		String nameE = "";
		float credit = -1;
		int weekHour = -1;
		String semester = "";
		String teacherMode = "";
		int collegeId = -1;
		String year = "";
		String collegeName = "";
		
		if (courInfo != null && !courInfo.isEmpty() && chooseCourseTimeForm != null && chooseCourseTimeForm.getState()){
			out.println("<table width='75%'  class='TABLE_BODY' bordercolor='777777' border='1' style='border-color:#777777;border-collapse:collapse' align='center'>");
			//out.println("<tr><td colspan='9' align='center'>��ѡ�γ�</td></tr>");
			out.println("<tr class='TABLE_TH'><td colspan='10' align='center' >ѡ�ο�ʼʱ�䣺"+chooseCourseTimeForm.getBeginTime()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ʱ�䣺"+chooseCourseTimeForm.getEndTime()+"</td></tr>");
		      out.println("<tr class='TABLE_TR_01'><td>�γ̺�</td>	<td>�γ�������</td><td>�γ�Ӣ����</td><td>ѧ����</td><td>��ѧʱ</td><td>ѧ��</td><td>��ѧ��ʽ</td><td>����Ժϵ</td><td>ѧ��</td><td>ѡ��</td></tr>");
			Iterator it = courInfo.iterator();
			int flag = 2;
			while(it.hasNext()){
				CourseForm courseForm = (CourseForm)it.next();
				id = courseForm.getId();
				nameC = courseForm.getNameC();
				nameE = courseForm.getNameE();
				credit = courseForm.getCredit();
				weekHour= courseForm.getWeekHour();
				semester = courseForm.getSemester();
				teacherMode = courseForm.getTeacherMode();
				collegeId = courseForm.getCollegeId();
				year = courseForm.getYear();
				Collection departInfo = studentDAO.queryDepartment(Integer.toString(collegeId));
				if(departInfo != null && !departInfo.isEmpty()){
					Iterator itD = departInfo.iterator();
					if(itD.hasNext()){
						DepartmentForm departmentForm = (DepartmentForm)itD.next();
						collegeName = departmentForm.getCollegeName();
					}
				}
				if (flag == 2) {
		  			out.println("<tr class='TABLE_TR_02'><td>"+ id +"</td>");
		  			flag = 1;
		  		}
		  		else if (flag == 1) {
		  			out.println("<tr class='TABLE_TR_01'><td>"+ id +"</td>");
		  			flag = 2;
		  		}
		  		out.println("<td>"+ nameC +"</td>");
				out.println("<td>"+ nameE +"</td>");
				out.println("<td>"+ credit +"</td>");
				out.println("<td>"+ weekHour +"</td>");
				out.println("<td>"+ semester +"</td>");
				out.println("<td>"+ teacherMode +"</td>");
				out.println("<td>"+ collegeName +"</td>");
				out.println("<td>"+ year +"</td>");
				out.println("<td><input type='checkbox' name='"+id+"' id='"+id+"' /></td></tr>");
	  		}
	  		if (flag == 1)
	  			out.println("<tr class='TABLE_TR_01'><td colspan='10' align='center'><input type='submit' name='1' id='12' value='�ύ' /></td></tr></table>");
			else if (flag == 2) 
	  			out.println("<tr class='TABLE_TR_02'><td colspan='10' align='center'><input type='submit' name='1' id='12' value='�ύ' /></td></tr></table>");
				
		}
		else if(chooseCourseTimeForm == null || !chooseCourseTimeForm.getState()){
			out.println("ѡ����δ��ʼ");
		}
		else 
		{
			out.println("û�п�ѡ�γ�");
			System.out.println("stuInfo is empty!");
		}
	} 	
  %>
<input type="hidden" name="account" value="<%=account %>"/>
</form>
<script type="text/javascript" src="../../JS/flash.js"></script>
</body>
</html>