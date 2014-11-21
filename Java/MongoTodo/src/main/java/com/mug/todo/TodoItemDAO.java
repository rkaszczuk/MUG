package com.mug.todo;

import java.util.*;

import org.bson.types.ObjectId;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

@Repository
public class TodoItemDAO{
	@Autowired
    private MongoTemplate mongoTempl;
	
	public void insert(TodoItem item){
		item.setAuthor("Mrs. Java");
		item.setDone(false);
		item.setDate(new Date());
		mongoTempl.insert(item,"todoItems");
	}
	
	public List<TodoItem> getAll()
	{
		return mongoTempl.find(new Query().with(
				new Sort(Sort.Direction.DESC, "date")),
				TodoItem.class, "todoItems");
	}
	public List<TodoItem> getByStatus(boolean status)
	{
		return mongoTempl.find(
				new Query(Criteria.where("isDone").is(status)).with(new Sort(Sort.Direction.DESC, "date")), TodoItem.class, "todoItems");
	}
	public List<TodoItem> getByTag(String tag)
	{
		return mongoTempl.find(new Query(Criteria.where("tags").is(tag)).with(new Sort(Sort.Direction.DESC, "date")), TodoItem.class, "todoItems");
	}
	public void changeStatusDone(String elementId)
	{
		mongoTempl.updateFirst(
				new Query(Criteria.where("_id").is(new ObjectId(elementId))), new Update().set("isDone", true), TodoItem.class, "todoItems");
	}
	public void delete(String elementId)
	{
		mongoTempl.remove(new Query(Criteria.where("_id").is(new ObjectId(elementId))), TodoItem.class, "todoItems");
	}
}
