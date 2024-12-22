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
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
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

    private File img;
    private String imgContentType;
    private String imgFileName;
    private String imgUploadPath = "/data/images/";

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

    public String redirectAddBook() {
        return "addBook";
    }

    public String addBook() {
        if(img == null) {
            addActionError("请上传书籍图片！");
            return "addBookError";
        }

        if(!imgFileName.endsWith(".jpg")) {
            addActionError("请上传jpg图片格式");
            return "addBookError";
        }

        if(book != null) {

            String imgExtension = imgFileName.substring(imgFileName.lastIndexOf("."));
            String newImgName = book.getTitle() + imgExtension;

            File newImg = new File(imgUploadPath + newImgName);

            try(FileInputStream fis = new FileInputStream(img);
                FileOutputStream fos = new FileOutputStream(newImg)){
                byte[] buffer = new byte[1024];
                int length;
                while ((length = fis.read(buffer)) > 0) {
                    fos.write(buffer, 0, length);
                }
            } catch (IOException e){
                addActionError("书籍图片上传失败，请重试！");
                return "addBookError";
            }

            bookService.saveBook(book);
            return "addBookSuccess";
        }

        addActionError("添加书籍失败！请重试");
        return "addBookError";
    }
}