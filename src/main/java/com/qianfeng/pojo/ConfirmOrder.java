package com.qianfeng.pojo;

public class ConfirmOrder {
    private Integer number;
    private double total;

    private Integer pid;

    private String pname;

    private String ptype;

    @Override
    public String toString() {
        return "ConfirmOrder{" +
                "number=" + number +
                ", total=" + total +
                ", pid=" + pid +
                ", pname='" + pname + '\'' +
                ", ptype='" + ptype + '\'' +
                ", price=" + price +
                ", pintroduction='" + pintroduction + '\'' +
                ", pspecification='" + pspecification + '\'' +
                ", pfunction='" + pfunction + '\'' +
                ", ppicture='" + ppicture + '\'' +
                ", pstate=" + pstate +
                ", pbrand='" + pbrand + '\'' +
                ", pptype=" + pptype +
                '}';
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPintroduction() {
        return pintroduction;
    }

    public void setPintroduction(String pintroduction) {
        this.pintroduction = pintroduction;
    }

    public String getPspecification() {
        return pspecification;
    }

    public void setPspecification(String pspecification) {
        this.pspecification = pspecification;
    }

    public String getPfunction() {
        return pfunction;
    }

    public void setPfunction(String pfunction) {
        this.pfunction = pfunction;
    }

    public String getPpicture() {
        return ppicture;
    }

    public void setPpicture(String ppicture) {
        this.ppicture = ppicture;
    }

    public Integer getPstate() {
        return pstate;
    }

    public void setPstate(Integer pstate) {
        this.pstate = pstate;
    }

    public String getPbrand() {
        return pbrand;
    }

    public void setPbrand(String pbrand) {
        this.pbrand = pbrand;
    }

    public Integer getPptype() {
        return pptype;
    }

    public void setPptype(Integer pptype) {
        this.pptype = pptype;
    }

    private Double price;

    private String pintroduction;

    private String pspecification;

    private String pfunction;

    private String ppicture;

    private Integer pstate;

    private String pbrand;

    private Integer pptype = 0;
}
