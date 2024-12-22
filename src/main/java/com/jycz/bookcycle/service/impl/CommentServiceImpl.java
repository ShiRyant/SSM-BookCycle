package com.jycz.bookcycle.service.impl;

import com.jycz.bookcycle.mapper.CommentMapper;
import com.jycz.bookcycle.model.Comment;
import com.jycz.bookcycle.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public void addComment(Comment comment) {
        boolean result;
        if(comment == null)
            result = false;
        result = commentMapper.saveComment(comment);
    }

    @Override
    public List<Comment> getCommentsByBookId(int bookId) {
        return commentMapper.selectCommentByBookId(bookId);
    }

    @Override
    public List<Comment> getAllComments() {
        return commentMapper.getAllComment();
    }

    @Override
    public void deleteComment(int commentId) {
        commentMapper.deleteCommentById(commentId);
    }
}
