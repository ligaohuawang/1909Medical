package com.qianfeng.entity;

/**
 * @Author chenzetao
 * @Date 2019/11/5
 */
public class SysResult {

    private boolean result;//操作是否成功,true,成功,false，不成功
    private String data;//提示信息

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
