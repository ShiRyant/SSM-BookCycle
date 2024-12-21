package com.jycz.bookcycle.action;

import com.opensymphony.xwork2.ActionSupport;
import lombok.Getter;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

@Getter
@Setter
public class FileUploadAction extends ActionSupport {
    private File file;
    private String fileContentType;
    private String fileFileName;

    private String fileUploadPath = "/data/images/";

    @Override
    public String execute() {

        if(file==null){
            addActionError("文件不能为空");
            return ERROR;
        }

        if(!fileContentType.startsWith("image/")){
            addActionError("请上传正确的图片格式");
            return ERROR;
        }

        String fileExtension = fileFileName.substring(fileFileName.lastIndexOf("."));
        String newFileName = UUID.randomUUID() + fileExtension;

        File destFile = new File(fileUploadPath + newFileName);
        try(FileInputStream fis = new FileInputStream(file);
            FileOutputStream fos = new FileOutputStream(destFile)){
                byte[] buffer = new byte[1024];
                int length;
                while ((length = fis.read(buffer)) > 0) {
                    fos.write(buffer, 0, length);
                }
        } catch (IOException e){
            addActionError("文件上传失败：" + e.getMessage());
            return ERROR;
        }

        ServletActionContext.getRequest().setAttribute("imageUrl", "/images/" + newFileName);
        return SUCCESS;
    }
}
