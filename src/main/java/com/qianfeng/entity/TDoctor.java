package com.qianfeng.entity;

public class TDoctor {
    private Integer did;

    private String dname;

    private String droom;

    private String dpicture;

    private String dintroduction;

    private String dpassword;

    private String dspeciality;

    private Integer dstate;
    private  String dphone;

    @Override
    public String toString() {
        return "TDoctor{" +
                "did=" + did +
                ", dname='" + dname + '\'' +
                ", droom='" + droom + '\'' +
                ", dpicture='" + dpicture + '\'' +
                ", dintroduction='" + dintroduction + '\'' +
                ", dpassword='" + dpassword + '\'' +
                ", dspeciality='" + dspeciality + '\'' +
                ", dstate=" + dstate +
                ", dphone='" + dphone + '\'' +
                '}';
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDroom() {
        return droom;
    }

    public void setDroom(String droom) {
        this.droom = droom;
    }

    public String getDpicture() {
        return dpicture;
    }

    public void setDpicture(String dpicture) {
        this.dpicture = dpicture;
    }

    public String getDintroduction() {
        return dintroduction;
    }

    public void setDintroduction(String dintroduction) {
        this.dintroduction = dintroduction;
    }

    public String getDpassword() {
        return dpassword;
    }

    public void setDpassword(String dpassword) {
        this.dpassword = dpassword;
    }

    public String getDspeciality() {
        return dspeciality;
    }

    public void setDspeciality(String dspeciality) {
        this.dspeciality = dspeciality;
    }

    public Integer getDstate() {
        return dstate;
    }

    public void setDstate(Integer dstate) {
        this.dstate = dstate;
    }

    public String getDphone() {
        return dphone;
    }

    public void setDphone(String dphone) {
        this.dphone = dphone;
    }
}