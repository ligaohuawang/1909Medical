package com.qianfeng.mapper;

import com.github.pagehelper.Page;
import com.qianfeng.dao.IBaseDao;
import com.qianfeng.entity.TZxnews;
import com.qianfeng.entity.TZxorder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TZxorderMapper extends IBaseDao<TZxorder>{

    //分页查询
    List<TZxorder> selectByContent(@Param("uid") Integer uid,@Param("zxos") Integer zxos);
}