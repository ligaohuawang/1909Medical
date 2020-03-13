package com.qianfeng.pojo;

import com.qianfeng.entity.TMedicalHistory;

import java.util.Date;
import java.util.List;

/**
 * 历史病例
 */
public class CasePojo {

    private String zxname;

    private Integer zxsex;

    private Date zxbirthday;

    private String zxaddress;

    private List<TMedicalHistory> tmList;

    public String getZxname() {
        return zxname;
    }

    public void setZxname(String zxname) {
        this.zxname = zxname;
    }

    public Integer getZxsex() {
        return zxsex;
    }

    public void setZxsex(Integer zxsex) {
        this.zxsex = zxsex;
    }

    public Date getZxbirthday() {
        return zxbirthday;
    }

    public void setZxbirthday(Date zxbirthday) {
        this.zxbirthday = zxbirthday;
    }

    public String getZxaddress() {
        return zxaddress;
    }

    public void setZxaddress(String zxaddress) {
        this.zxaddress = zxaddress;
    }

    public List<TMedicalHistory> getTmList() {
        return tmList;
    }

    public void setTmList(List<TMedicalHistory> tmList) {
        this.tmList = tmList;
    }

}
