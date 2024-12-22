package com.jycz.bookcycle.service;

import com.jycz.bookcycle.model.Comment;

import java.util.List;

public interface CommentService {
    void addComment(Comment comment);
    List<Comment> getCommentsByBookId(int bookId);
    List<Comment> getAllComments();
    void deleteComment(int commentId);
}
