package com.share.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.share.bean.MyScheduleBean;

/**
 * �ҵ��ճ̹������
 * 
 * @author sunkai
 *
 */
@Repository
public interface MyScheduleDao {

	/**
	 * dao���ȡ�ҵ������ճ�
	 * 
	 * @return
	 */
	public List<MyScheduleBean> findAllMySchedule();

	/**
	 * dao���ȡ�����ճ�����
	 * 
	 * @return
	 */
	public int findAllMyScheduleCount();

	/**
	 * dao������ҵ��ճ�
	 * 
	 * @param myschedule
	 */
	public void addMySchedule(MyScheduleBean myschedule);

	/**
	 * dao��ɾ���ҵ��ճ�
	 * 
	 * @param myscheduleid
	 */
	public void deleteMySchedule(int myscheduleid);

	/**
	 * dao���ѯ��Ҫ�޸ĵ��ճ�
	 * 
	 * @param myscheduleid
	 * @return
	 */
	public MyScheduleBean findUpdate(int myscheduleid);

	/**
	 * dao���޸���Ҫ�޸ĵ��ճ�
	 * 
	 * @param myschedule
	 */
	public void updateMySchedule(MyScheduleBean myschedule);

	/**
	 * ��ȡ�ҵ��ճ���Ϣ����ҳ��ʾ
	 * 
	 * @return
	 */
	public List<MyScheduleBean> findAllMySchedulePage(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize);

}
