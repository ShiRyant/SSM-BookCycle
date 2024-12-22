package com.jycz.bookcycle.action;

import com.jycz.bookcycle.mapper.CommentMapper;
import com.jycz.bookcycle.model.*;
import com.jycz.bookcycle.service.*;
import com.opensymphony.xwork2.ActionSupport;
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

@Component("adminAction")
@Scope("prototype")
@Getter
@Setter
public class AdminAction extends ActionSupport {
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private SellerService sellerService;

    private String adminName;
    private String password;

    private User user;
    private List<User> userList;
    private Book book;
    private List<Book> bookList;
    private Comment comment;
    private List<Comment> commentList;

    private String userId;
    private int bookId;
    private int commentId;

    private HttpServletRequest request = ServletActionContext.getRequest();
    private HttpServletResponse response = ServletActionContext.getResponse();
    private HttpSession session = ServletActionContext.getRequest().getSession();
    @Autowired
    private CommentMapper commentMapper;

    public String adminLogin() {
        User admin = new User();
        admin.setUsername(adminName);
        admin.setPassword(password);
        admin = userService.login(admin);

        if(admin == null) {
            addActionError("管理员账号或密码错误！");
            return "loginError";
        }

        session.setAttribute("admin", admin);
        return "loginSuccess";
    }

    public String getAllUserList() {
        userList = userService.getAllUsers();
        return "getAllUserList";
    }

    public String getAllBookList() {
        bookList = bookService.getAllBooks();
        return "getAllBookList";
    }

    public String getAllCommentList() {
        commentList = commentService.getAllComments();
        return "getAllCommentList";
    }

    public String deleteComment() {
        commentMapper.deleteCommentById(commentId);
        return "deleteCommentSuccess";
    }

    public String deleteUser() {
        userService.deleteUser(userId);
        return "deleteUserSuccess";
    }

    public String deleteBook() {
        bookService.deleteBook(bookId);
        return "deleteBookSuccess";
    }

    public String redirectHome() {
        return "home";
    }
}