package com.jycz.bookcycle.action;

import com.jycz.bookcycle.model.Book;
import com.jycz.bookcycle.service.BookService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("homeAction")
@Scope("prototype")
@Getter
@Setter
public class HomeAction extends ActionSupport implements ModelDriven<Book> {
    @Autowired
    private BookService bookService;
    private List<Book> books;

    private Book book = new Book();

    public Book getModel() {
        return book;
    }

    public String execute() {
        books = bookService.getRandomBooks(8);
        return SUCCESS;
    }
}
