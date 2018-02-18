package com.jvtestbd.javarush.controller;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import com.jvtestbd.javarush.domain.Book;
import com.jvtestbd.javarush.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/main")
public class MainController {
    int offset = 0;
    int num = 3;
    public static int count = 0;
    public static Model model1;


    @Resource(name="userService")
    private BookService bookService;

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String getBooks(Model model) {
        List<Book> booksfull = bookService.getAll("");
        List<Book> books = bookService.getAllPage(0, 3);
        if (booksfull.size() < 3) {
            count = 1;
        }else if (booksfull.size() > 3 && booksfull.size() % 3 > 0){
            count = booksfull.size()/3+1;
        }else{
            count = booksfull.size()/3;
        }

        model.addAttribute("count", count);
        model.addAttribute("books", books);
        model.addAttribute("booksfull", booksfull);
        return "bookspage";
    }

    @RequestMapping(value = "/booksPage", method = RequestMethod.GET)
    public String getBooks(@RequestParam(value="numpage", required=true) Integer numpage, Model model) {
        List<Book> booksfull = bookService.getAll("");
        offset = numpage*3-3;
        List<Book> books = bookService.getAllPage(offset, num);
        if (booksfull.size() < 3) {
            count = 1;
        }else if (booksfull.size() > 3 && booksfull.size() % 3 > 0){
            count = booksfull.size()/3+1;
        }else{
            count = booksfull.size()/3;
        }
        model.addAttribute("count", count);
        model.addAttribute("books", books);
        model.addAttribute("booksfull", booksfull);
        return "bookspage";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.GET)
    public String getAdd(Model model) {
        model.addAttribute("userAttribute", new Book());
        return "addpage";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("bookAttribute") Book user) {
        bookService.add(user);
        return "addedpage";
    }

    @RequestMapping(value = "/users/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="id", required=true) Integer id, Model model) {
        bookService.delete(id);
        model.addAttribute("id", id);
        return "deletedpage";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value="id", required=true) Integer id, Model model) {
        model.addAttribute("userAttribute", bookService.get(id));
        return "editpage";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.POST)
    public String saveEdit(@ModelAttribute("bookAttribute") Book book, @RequestParam(value="id", required=true) Integer id, Model model) {
        book.setId(id);
        bookService.edit(book);
        model.addAttribute("id", id);
        return "editedpage";
    }

    @RequestMapping(value = "/books/filter", method = RequestMethod.GET)
    public String getFilter(Model model) {
        model.addAttribute("bookFilter", new Book());
        return "filter";
    }
    @RequestMapping(value = "/users/filter", method = RequestMethod.POST)
    public String listFilter(@ModelAttribute("userAttribute") Book book, Model model) {
        List<Book> users = bookService.getAll(book.getTitle());
        model.addAttribute("users", users);
        return "filterpage";
    }
}
