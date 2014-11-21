<!doctype HTML>
<html>
<head>
<title>Add TODO</title>
<body>
<h1>Add TODO item</h1>
<form action="/newitem" method="POST">
{{errors}}
<h2>Title</h2>
<input type="text" name= "title" size="100" value="{{title}}"></br>
<h2>Tags (comma separated)</h2>
<input type="text" name= "tags" size="100" value="{{tags}}"></br>
<input type="submit" value="Submit">



</body>
</html>