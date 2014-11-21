<!doctype HTML>
<html>
<head>
<title>Get tweets</title>
<body>
<form action="/gettweets" method="POST">
{{errors}}
<h2>Keyword</h2>
<input type="text" name= "tweetKeyword" size="100" value="{{tweetKeyword}}"></br>
<h2>How many pages?</h2>
<input type="number" min="1" max="20" name="pages" value="{{pages}}"></br>
<input type="submit" value="Submit">



</body>
</html>