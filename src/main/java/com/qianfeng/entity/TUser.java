package com.qianfeng.entity;

import java.util.Date;

public class TUser {
    private Integer uid;

    private String nicknane;

    private String uname;

    private String uemail;

    private String uphone;

    private String ucard;

    private Integer usex;

    private String ucity;

    private Date ubirthday;

    private String upicture;

    private String upassword;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getNicknane() {
        return nicknane;
    }

    public void setNicknane(String nicknane) {
        this.nicknane = nicknane == null ? null : nicknane.trim();
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail == null ? null : uemail.trim();
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone == null ? null : uphone.trim();
    }

    public String getUcard() {
        return ucard;
    }

    public void setUcard(String ucard) {
        this.ucard = ucard == null ? null : ucard.trim();
    }

    public Integer getUsex() {
        return usex;
    }

    public void setUsex(Integer usex) {
        this.usex = usex;
    }

    public String getUcity() {
        return ucity;
    }

    public void setUcity(String ucity) {
        this.ucity = ucity == null ? null : ucity.trim();
    }

    public Date getUbirthday() {
        return ubirthday;
    }

    public void setUbirthday(Date ubirthday) {
        this.ubirthday = ubirthday;
    }

    public String getUpicture() {
        return upicture;
    }

    public void setUpicture(String upicture) {
        this.upicture = upicture == null ? null : upicture.trim();
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword == null ? null : upassword.trim();
    }

    @Override
    public String toString() {
        return "TUser{" +
                "uid=" + uid +
                ", nicknane='" + nicknane + '\'' +
                ", uname='" + uname + '\'' +
                ", uemail='" + uemail + '\'' +
                ", uphone='" + uphone + '\'' +
                ", ucard='" + ucard + '\'' +
                ", usex=" + usex +
                ", ucity='" + ucity + '\'' +
                ", ubirthday=" + ubirthday +
                ", upicture='" + upicture + '\'' +
                ", upassword='" + upassword + '\'' +
                '}';
    }
}