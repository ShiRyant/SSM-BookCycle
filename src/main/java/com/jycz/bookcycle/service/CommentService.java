package com.jycz.bookcycle.service;

import com.jycz.bookcycle.model.Comment;

import java.util.List;

public interface CommentService {
    boolean addComment(Comment comment);
    List<Comment> getCommentsByBookId(int bookId);
}
