package com.jycz.bookcycle.service;

import com.jycz.bookcycle.model.Book;

import java.util.List;

public interface BookService {
    boolean saveBook(Book book);
    boolean updateBook(Book book);
    boolean deleteBook(int bookId);
    Book getBook(int bookId);
    List<Book> getRandomBooks(int count);
    List<Book> getBooksByName(String bookName);
    List<Book> getBooksByCategory(String category);
    List<Book> getAllBooks();
}
