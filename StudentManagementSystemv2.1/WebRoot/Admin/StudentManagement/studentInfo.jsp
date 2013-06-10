<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.util.*" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.actionForm.*" %>
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
<script language="javascript">
		var xmlhttp;
		function query(){
			var college_n = document.getElementById("college_name").value;
			var entry_t = document.getElementById("entr_time").value;
			if(window.XMLHttpRequest){  
		      //���FireFox,Mozillar,Opera,Safari,IE7,IE8  
			    xmlhttp = new XMLHttpRequest();  
			         
			       //��ĳЩ�ض��汾��mozillar�������bug��������  
			    if(xmlhttp.overrideMineType){  
			          xmlhttp.overrideMineType("text/xml");  
			    }  
		    }
		    else if(window.ActiveXObject){  
		       //���IE5��IE5.5��IE6  
		         
		       //�����������ڴ���XMLHTTPRequest����Ŀؼ����ơ�������һ��JS�����С�  
		       var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];  
		       for(var i = 0; i<activeName.length; i++){  
		           //ȡ��һ���ؼ������д���������ɹ�����ֹѭ��  
		           try{  
		              xmlhttp = new ActiveXObject(activexName[i]);  
		              break;  
		           }catch(e){}  
		       }         
         
    		}  
		    if(xmlhttp){  
		       alert("XMLHttpRequest���󴴽��ɹ���"); 
		       //return ;  
		    }else{  
		       alert("XMLHttpRequest���󴴽�ʧ�ܣ�");  
		       return;
		    } 
 
      
    		//����������Ϣ(����ʽ�������url,true��ʾ�첽��ʽ����)  
    		xmlhttp.open("GET","admin?action=queryStudentInfo", true);  
    		//ע��ص�����,ֻд������������д���ţ�д���ű�ʾ���ú�����  
    		xmlhttp.onreadystatechange = callback; 
        	xmlhttp.setCharacterEncoding("utf-8"); 
    		//�������ݣ���ʼ�ͷ��������н�����  
    		xmlhttp.send(null);  
		}
		
		//�ص�����  
	function callback(){  
	   //�ж϶����״̬�Ƿ񽻻����  
	   if(xmlhttp.readyState == 4){  
	     
	      //�ж�http�Ľ����Ƿ�ɹ�  
	      if(xmlhttp.status == 200){  	        
	         //��ȡ�������˷��ص����ݣ��ı���  
	         var resbonseText = xmlhttp.responseText;     
	         //��������ʾ��ҳ����  
	         alert("hello");
	         var divNode = document.getElementById("result");       
	         //����Ԫ�ؽڵ��е�html����  
	         divNode.innerHTML = responseText;  
      		}   
   		}  
	} 
</script>
</head>

<body>
<%
	AdminDAO dao = new AdminDAO();
	ArrayList<String> college = dao.collegeQuery();
	ArrayList<String> entry = dao.entryTimeQuery();
	
 %>
<div id="Header">
	  <ul  id="1" class="MenuBar">	 
      	<li>
			<a href="../index.jsp" style="padding: 5px 30px 0;">��ҳ</a>
		</li> 
        <span class="sep">|</span>	
		<li class="current">
			<a href="../StudentManagement/index.jsp" style="padding: 5px 30px 0;">Ժϵѧ������</a>
		</li>
		<span class="sep">|</span>		
		<li >
			<a href="../AchievementManagement/index.jsp" style="padding: 5px 30px 0;">Ժϵ�ɼ�����</a>
		</li>
		<span class="sep">|</span>	
		<li >
			<a href="../CourseManagement/index.jsp" style="padding: 5px 30px 0;">Ժϵ�γ̹���</a>
		</li>
       	<span class="sep">|</span>				
 		<li >
			<a href="../AcdemicDeanInfo/index.jsp" style="padding: 5px 30px 0;">����Ա��Ϣ����</a>
		</li>
		<li>
			<a href="../NotificationManagement/index.jsp" style="padding: 5px 30px 0;">֪ͨ����</a>
		</li>
	 </ul>
	<br />
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;��ӭ����<font color="#0000ff"><%=account%></font> &nbsp;��ǰ��ݣ�<font color="#0000ff"><%=accountType%></font>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='../../Images/Icon_Exit.gif'/><a href="../../logout.jsp">�˳�</a>
	</div>
	
</div>
<br/><br /><br /><br/>


<form id="form1" name="form1" method="post" action="admin?action=queryStudentInfo">
<table width="592" height="43" align='center'>
  <tr>
    <td width="68" height="16">Ժϵ���ƣ�</td>
    <td width="217"><label for="college_name"></label>
      <select name="college_name" id="college_name" style="width:200px;height:auto">
      <%
      		for (int i = 0; i < college.size(); i ++){
      			out.println("<option value=\"" + college.get(i) + "\">" + college.get(i) + "</option>");
      		}	
      %>
      </select></td>
    <td width="70">��ѧ��ݣ�</td>
    <td width="144"><label for="entr_time"></label>
      <select name="entr_time" id="entr_time" style="height:auto;width:100px">
    	<%
    		for (int i = 0; i < entry.size(); i ++){
      			 out.println("<option value=\"" + entry.get(i) + "\">" + entry.get(i) + "</option>");
      		}	
    	 %>
      </select></td>
    <td width="69"><input type="submit" name="submit" id="submit" value="�ύ" "/></td>
  </tr>
</table>
</br>

</form>
<%
	String col = request.getParameter("college_name");
	String entr = request.getParameter("entr_time");
	System.out.println("!!" + col + entr);
	if (col != "" && entr != "" && col != null && entr != null) {	
		ArrayList<StudentForm> al = dao.queryStudentInfo(col, entr);
	
 %>
<table width='75%'  class='TABLE_BODY' bordercolor='777777' border='1' style='border-color:#777777;border-collapse:collapse' align='center'>
  <tr class='TABLE_TH'>
  	<td>���</td>
    <td>ѧ��</td>
    <td>������</td>
    <td>��������</td>
    <td>�Ա�</td>
    <td>Ժϵ����</td>
    <td>רҵ����</td>
    <td>ѧ��</td>
    <td>���֤��</td>
    <td>��ѧ���</td>
    <td>����</td>
    <td>����</td>
    <td>�绰����</td>
    <td>��ͥסַ</td>
    <td>��ҵԺУ</td>
    <td>�����ַ</td>
    <td>�ʱ�</td>
    </tr>
    <%
    	int flag = 2;
    	for (int i = 0; i < al.size(); i ++) {
    		if (flag == 2) {
		  			out.println("<tr class='TABLE_TR_02'>");
		  			flag = 1;
	  		}
	  		else if (flag == 1) {
	  			out.println("<tr class='TABLE_TR_01'>");
	  			flag = 2;
	  		}
    		out.println(
    			"<td>" + (i + 1) + "</td>" +
			    "<td>" + al.get(i).getStuNum() + "</td>" +
			    "<td>" + al.get(i).getNameCh() + "</td>" +
			    "<td>" + al.get(i).getBirthTime() + "</td>" +
			    "<td>" + al.get(i).getGender() + "</td>" +
			    "<td>" + al.get(i).getCollegeNum() + "</td>" +
			    "<td>" + al.get(i).getMajorNum() + "</td>" +
			    "<td>" + al.get(i).getSchLength() + "</td>" +
			    "<td>" + al.get(i).getIdNum() + "</td>" +
			    "<td>" + al.get(i).getEntrTime() + "</td>" +
			    "<td>" + al.get(i).getCitizenShip() + "</td>"  +
			    "<td>" + al.get(i).getNation() + "</td>" +
			    "<td>" + al.get(i).getTelephone() + "</td>" +
			    "<td>" + al.get(i).getHomeAddr() + "</td>" +
			    "<td>" + al.get(i).getGraduSch() + "</td>" +
			    "<td>" + al.get(i).getEmail() + "</td>" +
			    "<td>" + al.get(i).getPosCode() + "</td>" +
			    "</tr>");
    	}
     %>

</table>
<%
}
 %>
<p>
  <script type="text/javascript" src="../../JS/flash.js"></script>
</p>
<p>&nbsp; </p>
</body>
</html>