import datetime
from bson.objectid import ObjectId

class TodoItemDAO:
    def __init__(self, database):
        self.db = database
        self.collection = database.todoItems

    def insert(self, title, tags):
        todoItem = {"title":title,
                    "author":"Sir Python",
                    "isDone": False,
                    "tags":tags,
                    "date": datetime.datetime.utcnow()}
        return self.collection.insert(todoItem)

    def get(self):
        return list(self.collection.find().sort("date",-1))
        
    def get_by_status(self, isDone):    
        return list(self.collection.find({"isDone":isDone}).sort("date",-1))
    
    def get_by_tag(self, tag):
        return list(self.collection.find({"tags":tag}).sort("date",-1))
    
    def change_status_to_done(self, item_id):
        self.collection.update({"_id": ObjectId(str(item_id))}, {"$set":{"isDone":True}})
    
    def delete(self, item_id):
        self.collection.remove({"_id": ObjectId(str(item_id))})

        
        
            
        
        
    
