package com.jycz.bookcycle.action;

import com.jycz.bookcycle.model.Seller;
import com.jycz.bookcycle.model.User;
import com.jycz.bookcycle.service.SellerService;
import com.jycz.bookcycle.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Getter;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

@Component("sellerAction")
@Scope("prototype")
@Getter
@Setter
public class SellerAction extends ActionSupport implements ModelDriven<Seller> {
    @Autowired
    private SellerService sellerService;

    private Seller seller = new Seller();
    private File img;
    private String imgContentType;
    private String imgFileName;
    private String imgUploadPath = "/data/images/";

    private HttpServletRequest request = ServletActionContext.getRequest();
    private HttpServletResponse response  = ServletActionContext.getResponse();
    private HttpSession session = ServletActionContext.getRequest().getSession();

    @Override
    public Seller getModel() {
        return seller;
    }

    public String execute() {

        if(img == null) {
            addActionError("请上传书籍图片！");
            return ERROR;
        }

        if(!imgContentType.startsWith("image/")) {
            addActionError("请上传正确的图片格式");
            return ERROR;
        }

        String imgExtension = imgFileName.substring(imgFileName.lastIndexOf("."));
        String newImgName = seller.getRealName() + "_" + System.currentTimeMillis() + imgExtension;

        File newImg = new File(imgUploadPath + newImgName);

        try(FileInputStream fis = new FileInputStream(img);
            FileOutputStream fos = new FileOutputStream(newImg)){
            byte[] buffer = new byte[1024];
            int length;
            while ((length = fis.read(buffer)) > 0) {
                fos.write(buffer, 0, length);
            }
        } catch (IOException e){
            addActionError("书籍图片上传失败，请重试！");
            return ERROR;
        }
        seller.setBookUrl(newImgName);
        sellerService.saveSeller(seller);

        return SUCCESS;
    }

    @Override
    public void validate() {
        if(seller.getRealName() == null || seller.getRealName().isEmpty()) {
            addFieldError("seller.realName", "卖家姓名不能为空！");
        }

        if(seller.getIdCardNo() == null || seller.getIdCardNo().isEmpty()) {
            addFieldError("seller.idCardNo", "身份证号码不能为空！");
        } else if(seller.getIdCardNo().length() != 18) {
            addFieldError("seller.idCardNo", "身份证号码不为18位！");
        }

        if(seller.getAddress() == null || seller.getAddress().isEmpty()) {
            addFieldError("seller.address", "详细地址不能为空！");
        }

        if(seller.getSellerPhone() == null || seller.getSellerPhone().isEmpty()) {
            addFieldError("seller.sellerPhone", "联系电话不能为空！");
        } else if(seller.getSellerPhone().length() != 11) {
            addFieldError("seller.sellerPhone", "联系电话不为11位！");
        }

        if(seller.getBookInfo() == null || seller.getBookInfo().isEmpty()) {
            addFieldError("seller.bookInfo", "请填写书籍详细信息！");
        }
    }
}
