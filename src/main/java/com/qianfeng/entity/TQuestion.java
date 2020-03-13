package com.qianfeng.entity;

public class TQuestion {
    private Integer qid;

    private Integer uid;

    private String qtitle;

    private String qcontent;

    private String qanswer;

    private Integer qreply;

    private Integer qstate;

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getQtitle() {
        return qtitle;
    }

    public void setQtitle(String qtitle) {
        this.qtitle = qtitle == null ? null : qtitle.trim();
    }

    public String getQcontent() {
        return qcontent;
    }

    public void setQcontent(String qcontent) {
        this.qcontent = qcontent == null ? null : qcontent.trim();
    }

    public String getQanswer() {
        return qanswer;
    }

    public void setQanswer(String qanswer) {
        this.qanswer = qanswer == null ? null : qanswer.trim();
    }

    public Integer getQreply() {
        return qreply;
    }

    public void setQreply(Integer qreply) {
        this.qreply = qreply;
    }

    public Integer getQstate() {
        return qstate;
    }

    public void setQstate(Integer qstate) {
        this.qstate = qstate;
    }
}