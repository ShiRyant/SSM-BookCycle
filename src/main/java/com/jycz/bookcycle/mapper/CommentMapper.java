package com.jycz.bookcycle.mapper;

import com.jycz.bookcycle.model.Comment;

import java.util.List;

public interface CommentMapper {
    boolean saveComment(Comment comment);
    List<Comment> selectCommentByBookId(int bookId);
}
