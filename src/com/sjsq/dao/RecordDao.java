package com.sjsq.dao;

import com.sjsq.po.Record;

import java.util.List;

/**
 * @author shuijianshiqing
 * @date 2021/5/22 22:07
 */
public interface RecordDao {

    /**
     * ��ѯ���н�����Ϣ
     * @return
     */
    public List<Record> selectRecords();

    /**
     * ��ѯ������Ϣ
     * @return
     */
    public List<Record> selectRecord(Integer userid);


    /**
     * �������ļ�¼
     * @param record
     * @return
     */
    public boolean addRecord(Record record);


    /**
     * ɾ�����ļ�¼
     * @param borrowid
     * @return
     */
    public boolean deleteRecord(Integer borrowid);
}
