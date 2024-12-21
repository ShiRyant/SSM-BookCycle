package com.jycz.bookcycle.service.impl;

import com.jycz.bookcycle.mapper.BookMapper;
import com.jycz.bookcycle.model.Book;
import com.jycz.bookcycle.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bookService")
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;

    @Override
    public boolean saveBook(Book book) {
        boolean result = false;
        if(book == null)
            return false;
        result = bookMapper.save(book);
        return result;
    }

    @Override
    public boolean updateBook(Book book) {
        return bookMapper.update(book);
    }

    @Override
    public boolean deleteBook(int bookId) {
        boolean result = false;
        Book book = bookMapper.findById(bookId);
        if(book == null)
            return false;
        result = bookMapper.delete(bookId);
        return result;
    }

    @Override
    public Book getBook(int bookId) {
        return bookMapper.findById(bookId);
    }

    @Override
    public List<Book> getRandomBooks(int count) {
        return bookMapper.getRandomBooks(count);
    }

    @Override
    public List<Book> getBooksByName(String bookName) {
        return bookMapper.getBooksByName(bookName);
    }

    @Override
    public List<Book> getBooksByCategory(String category) {
        return bookMapper.getBooksByCategory(category);
    }
}
