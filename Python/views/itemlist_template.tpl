<!doctype HTML>
<html>
<head>
<title>Todo items</title>
<body>
<h2>Todo items</h2>
<div>
<a href="/newitem"/>>>Add new</a>&nbsp;
<a href="/items"/>>>All items</a>&nbsp;
<a href="/itemsbystatus/1"/>>> Only done items</a>&nbsp;
<a href="/itemsbystatus/0"/>>> Only not finished items</a>&nbsp;
</div>
%for item in items:
<div style="border:2px solid;border-radius:25px;padding:10px;display: inline-block;">
<center><h3>{{item["title"]}}</h3></center>
<b>Date:</b> {{item["date"]}}</br>
<b>Author:</b> {{item["author"]}}</br>
%if item["isDone"]:
<font color="green"><b>DONE!</b></font>
%else:
<font color="red"><b>Not finished yet :(</b></font>
%end
</b></br>
<b>Tags:</b>
%for tag in item["tags"]:
<a href="/itembytag/{{tag}}"/>{{tag}}</a>&nbsp;
%end
</br>
%if not item["isDone"]:
<a href="/changestatus/{{item["_id"]}}"/>Done</a>&nbsp;</br>
%end
<a href="/delete/{{item["_id"]}}"/>Delete</a>&nbsp;</br>
</div>
%end

</body>
</html>