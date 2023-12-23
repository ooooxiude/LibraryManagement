package com.sjsq.service;

import com.sjsq.po.Record;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2021/5/22 22:17
 */
public interface RecordService {

    /**
     * 查询所有借阅信息
     * @return
     */
    public List<Record> selectRecords();

    /**
     * 查询借阅信息
     * @return
     */
    public List<Record> selectRecord(Integer userid);


    /**
     * 新增借阅记录
     * @param record
     * @return
     */
    public boolean addRecord(Record record);


    /**
     * 删除借阅记录
     * @param borrowid
     * @return
     */
    public boolean deleteRecord(Integer borrowid);
}
