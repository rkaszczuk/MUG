import pymongo
import todoItemDAO
import bottle
import cgi
import re

connection = pymongo.MongoClient("localhost",27017)
todoItems = todoItemDAO.TodoItemDAO(connection.todo)



@bottle.route('/')
def index():
    bottle.redirect("/items")


@bottle.route('/items')
def items():
    result = todoItems.get()
    return bottle.template('itemlist_template', dict(items=result))

@bottle.get('/newitem')
def get_newitem():
    return bottle.template('newitem_template', dict(title="", tags="", errors=""))

@bottle.post('/newitem')
def post_newitem():
    title = bottle.request.forms.get("title")
    tags = bottle.request.forms.get("tags")
    print title + ":" + tags
    if title == "":
        errors = "Your item must contain a title"
        return bottle.template('newitem_template',
                              dict(title=cgi.escape(title, quote=True),
                                   tags=cgi.escape(tags, quote=True),
                                   errors=errors))
    tags_array = []
    if tags != "":
        tags = cgi.escape(tags)
        tags = re.compile('\s').sub("",tags)
        tags_array = tags.split(',')

    todoItems.insert(cgi.escape(title),tags_array)
    bottle.redirect("/items")

@bottle.get('/itemsbystatus/<status>')
def get_items_by_status(status="notfound"):
    if status=="1":
        status_query = True
    elif status=="0":
        status_query = False
    else:
        return []
         
    result = todoItems.get_by_status(status_query)
    return bottle.template('itemlist_template', dict(items=result))


@bottle.get('/itembytag/<tag>')
def post_items_by_tag(tag="notfound"):
    result = todoItems.get_by_tag(tag)
    return bottle.template('itemlist_template', dict(items=result))

@bottle.get('/changestatus/<item_id>')
def update_status(item_id="notfound"):
    todoItems.change_status_to_done(item_id)
    bottle.redirect("/items")

@bottle.get('/delete/<item_id>')
def delete_item(item_id="notfound"):
    todoItems.delete(item_id)
    bottle.redirect("/items")  

bottle.debug(True)
bottle.run(host='localhost', port=8085)
