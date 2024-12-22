package com.jycz.bookcycle.mapper;

import com.jycz.bookcycle.model.*;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface BookMapper {
    boolean save(Book book);
    boolean update(Book book);
    boolean delete(int bookId);
    Book findById(int bookId);
    List<Book> getRandomBooks(int count);
    List<Book> getBooksByName(String bookName);
    List<Book> getBooksByCategory(String category);
    List<Book> getAllBooks();
}
