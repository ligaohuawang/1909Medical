package com.qianfeng.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultEntity<T> {

    private static final String SUCESSS = "SUCCESS"; // 处理成功
    private static final String FAILED = "FAILED"; // 处理失败
    private static final String NO_MSG = "NO_MSG"; // 没有提示信息

    private String state; // 操作状态 成功/失败
    private String msg; // 提示信息
    private T t; // 返回的数据


    /**
     * 成功返回方法 从上到下分别是没有传值 有传值
     *
     * @return
     */
    public static ResultEntity success_msg(String msg) { return new ResultEntity<>(SUCESSS, msg, null);

    }
    public static ResultEntity<?> success_msg(String msg, Object... obj) {
        return new ResultEntity<>(SUCESSS, msg, obj);
    }

     /**
     * 失败返回方法 从上到下分别是没有传值 有传值
     * @param msg
     * @return
     */
    public static ResultEntity failed_msg(String msg) {
        return new ResultEntity<>(FAILED, msg, null);
    }

    public static ResultEntity<?> failed_msg(String msg, Object... obj) {
        return new ResultEntity<>(FAILED, msg, obj);
    }
}
