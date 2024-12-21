import com.jycz.bookcycle.mapper.BookMapper;
import com.jycz.bookcycle.model.Book;
import com.jycz.bookcycle.model.User;
import com.jycz.bookcycle.service.BookService;
import com.jycz.bookcycle.service.UserService;
import com.jycz.bookcycle.service.impl.BookServiceImpl;
import com.jycz.bookcycle.util.UserUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestMybatis {
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;
    @Autowired
    private BookMapper bookMapper;

    @Test
    public void testInsertUser(){
        User user = new User();
        String uid = UserUtil.getRandomNumber(10);
        user.setUserId(uid);
        user.setUsername("Alice");
        String salt = UserUtil.getRandomNumber(16);
        String password = UserUtil.md5Password("123456",salt,10);
        user.setPassword(password);
        user.setSalt(salt);
        user.setEmail("alice@gmail.com");
        user.setPhoneNumber("12345678");
        user.setRegisterTime(new Date());
        if(userService.saveUser(user))
            System.out.println(new Date());
    }

    @Test
    public void testSelectUser(){
        List<Book> books = bookService.getRandomBooks(8);
        for(Book book:books){
            System.out.println(book);
        }
    }

    @Test
    public void testUpdateUser(){
        List<Book> list = bookMapper.getBooksByCategory("计算机与网络");
        for(Book book:list){
            System.out.println(book);
        }
    }
}
