<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.naming.*, javax.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	public boolean testLoockup(String jndiName){
	 boolean validate = false;
	 try{
		 Context ctx = new InitialContext();
		 DataSource data = (DataSource) ctx.lookup(jndiName);
		 validate = true;
	 }catch(Exception e){
		 validate = false;
	 }
	 return validate;
}

%>

	<% boolean valida =  testLoockup("jdbc/DSTest"); %>
	
	<%=valida %>


</body>
</html>