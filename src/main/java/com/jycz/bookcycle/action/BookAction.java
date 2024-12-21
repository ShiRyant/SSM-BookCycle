package com.jycz.bookcycle.action;

import com.jycz.bookcycle.model.Book;
import com.jycz.bookcycle.service.BookService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Getter;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Component("bookAction")
@Scope("prototype")
@Getter
@Setter
public class BookAction extends ActionSupport implements ModelDriven<Book> {
    @Autowired
    private BookService bookService;
    private List<Book> books;
    private String searchText;

    private Book book = new Book();
    private int bookId;

    private HttpServletRequest request = ServletActionContext.getRequest();
    private HttpServletResponse response  = ServletActionContext.getResponse();
    private HttpSession session = ServletActionContext.getRequest().getSession();;

    public Book getModel() {
        return book;
    }

    public String bookDetail() {
        bookId = Integer.parseInt(request.getParameter("bookId"));
        book = bookService.getBook(bookId);
        books = bookService.getRandomBooks(7);
        return SUCCESS;
    }

    public String searchBooksByName() {
        books = bookService.getBooksByName(searchText);
        return "searchSuccess";
    }

    public String searchBooksByCategory() {
        books = bookService.getBooksByCategory(searchText);
        return "searchSuccess";
    }
}
