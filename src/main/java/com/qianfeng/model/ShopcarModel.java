package com.qianfeng.model;

public class ShopcarModel {
    int pid;
    int sid;
    String ppicture;
    String pname;
    double price;
    int number;

    @Override
    public String toString() {
        return "ShopcarModel{" +
                "pid=" + pid +
                ", sid=" + sid +
                ", ppicture='" + ppicture + '\'' +
                ", pname='" + pname + '\'' +
                ", price=" + price +
                ", number=" + number +
                '}';
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getPpicture() {
        return ppicture;
    }

    public void setPpicture(String ppicture) {
        this.ppicture = ppicture;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
