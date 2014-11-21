<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Todo items</h2>
<div>
<a href="/MongoTodo/newitem"/>>>Add new</a>&nbsp;
<a href="/MongoTodo/items"/>>>All items</a>&nbsp;
<a href="/MongoTodo/itemsbystatus/1"/>>> Only done items</a>&nbsp;
<a href="/MongoTodo/itemsbystatus/0"/>>> Only not finished items</a>&nbsp;
</div>
<c:forEach var="item" items="${items}">
<div style="border:2px solid;border-radius:25px;padding:10px;display: inline-block;">
<center><h3>${item.getTitle()}</h3></center>
<b>Date:</b> ${item.getDate()}</br>
<b>Author:</b> ${item.getAuthor()}</br>
<c:choose>
<c:when test="${item.isDone()}">
<font color="green"><b>DONE!</b></font>
</c:when>
<c:otherwise>
<font color="red"><b>Not finished yet :(</b></font>
</c:otherwise>
</c:choose>
</b></br>
<b>Tags:</b>
<c:forEach var="tag" items="${item.getTags()}">
<a href="/MongoTodo/itembytag/${tag}"/>${tag}</a>&nbsp;
</c:forEach>
</br>
<c:if test="${not item.isDone()}">
<a href="/MongoTodo/changestatus/${item.getId()}"/>Done</a>&nbsp;</br>
</c:if>
<a href="/MongoTodo/delete/${item.getId()}"/>Delete</a>&nbsp;</br>
</div>
</c:forEach>
</body>
</html>