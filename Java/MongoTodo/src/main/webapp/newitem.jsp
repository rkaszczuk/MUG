<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<title>Add TODO</title>
<body>
<h1>Add TODO item</h1>
<form action="/newitem" method="POST">
<h2>Title</h2>
<input type="text" name= "title" size="100"></br>
<h2>Tags (comma separated)</h2>
<input type="text" name= "tags" size="100"></br>
<input type="submit" value="Submit">
</body>
</html>