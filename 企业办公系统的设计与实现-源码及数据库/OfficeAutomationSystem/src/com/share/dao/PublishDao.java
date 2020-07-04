package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.share.bean.MessageDetailsBean;

@Repository
public interface PublishDao {
	
	/**
	 * ��ѯ���й���
	 * @return
	 */
	public List<MessageDetailsBean> selectPublish();
	
	/**
	 * ��ȡ���������������
	 * @return
	 */
	public MessageDetailsBean getPublishes(int publishid);
	/**
	 * ��ȡ�ѷ������������
	 * @return
	 */
	public int getPublishCounts();

}
