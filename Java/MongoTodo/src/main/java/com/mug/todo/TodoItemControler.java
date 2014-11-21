package com.mug.todo;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

@Controller
public class TodoItemControler {
	 @Autowired
	 private TodoItemDAO todoItems;
	 @RequestMapping(value = "/", method = RequestMethod.GET)
	 public String index()
	 {
		 return "redirect:/items";
	 }
	 @RequestMapping(value = "/items", method = RequestMethod.GET)
	 public String items(ModelMap model)
	 {
		 List<TodoItem> result = todoItems.getAll();
		 model.addAttribute("items",result);
		 return "/itemlist"; 
	 }
	 @RequestMapping(value = "/itemsbystatus/{status}", method = RequestMethod.GET)
	 public String  getItemByStatus(@PathVariable("status") int status, ModelMap model)
	 {
		 List<TodoItem> result = todoItems.getByStatus(status==1?true:false);
		 model.addAttribute("items",result);
		 return "/itemlist";
	 }
	 @RequestMapping(value = "/changestatus/{item_id}", method = RequestMethod.GET)
	 public String  updateStatus(@PathVariable("item_id") String itemId, ModelMap model)
	 {
		 todoItems.changeStatusDone(itemId);
		 return "redirect:/items";
	 }
	 @RequestMapping(value = "/delete/{item_id}", method = RequestMethod.GET)
	 public String deleteItem(@PathVariable("item_id") String itemId, ModelMap model)
	 {
		 todoItems.delete(itemId);
		 return "redirect:/items";
	 }
	 @RequestMapping(value = "/newitem", method = RequestMethod.GET)
	 public String getCreateItem()
	 {
		 return "/newitem";
	 }
	 @RequestMapping(value = "/newitem", method = RequestMethod.POST)
	 public String postCreateItem(HttpServletRequest request,@RequestParam(value="title", required=false) String title, 
		        @RequestParam(value="tags", required=false) String tags )
	 {
		 TodoItem item = new TodoItem();
		 item.setTitle(title);
		 item.setTags(Arrays.asList(tags.split("\\s*,\\s*")));
		 todoItems.insert(item);
		 return "redirect:/items";
	 }
}
