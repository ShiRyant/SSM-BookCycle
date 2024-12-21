package com.jycz.bookcycle.action;

import com.jycz.bookcycle.model.Comment;
import com.jycz.bookcycle.service.CommentService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component("commentAction")
@Scope("prototype")
@Getter
@Setter
public class CommentAction extends ActionSupport implements ModelDriven<Comment> {
    @Autowired
    private CommentService commentService;

    private Comment comment = new Comment();

    @Override
    public Comment getModel() {
        return comment;
    }

    public String addComment() {
        comment.setCommentTime(new Date());
        commentService.addComment(comment);
        return "addComment";
    }
}
