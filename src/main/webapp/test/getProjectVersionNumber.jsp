<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Project Version Number</title>
</head>
<body>
<%
	String versionNumber = "UNKNOWN";
	String propertiesFileContent = "";
	ServletContext context = session.getServletContext();
	String theRequestURI = request.getRequestURI();
	int startIndex = theRequestURI.indexOf("/") + 1;
	int endIndex = theRequestURI.indexOf("/", startIndex);
	String projectName = theRequestURI.substring(startIndex, endIndex).trim();
	InputStream is = context.getResourceAsStream("/META-INF/maven/com.t_mobile." + projectName + "/" + projectName + "/pom.properties");

	BufferedReader br = new BufferedReader(new InputStreamReader(is));
	String line = null;
	while((line = br.readLine()) != null) {
		propertiesFileContent += line;
		if(line.startsWith("version=")) {
			versionNumber = line.substring(8);
		}
	}
%>
<%= versionNumber%>
</body>
</html>