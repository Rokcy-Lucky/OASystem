package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.MessageDetailsBean;
import com.share.dao.PublishDao;

@Service
public class PublishService {

	@Autowired
	private PublishDao publishdao;

	/**
	 * ��ȡ���й�����Ϣ
	 * 
	 * @return
	 */
	public List<MessageDetailsBean> selectPublish() {
		return publishdao.selectPublish();
	}

	/**
	 * ��ȡ�����������ϸ��Ϣ
	 * 
	 * @return
	 */
	public MessageDetailsBean getPublishes(int publishid) {
		return publishdao.getPublishes(publishid);
	}

	/**
	 * ��ȡ���������������
	 * 
	 * @return
	 */
	public int getPublishCounts() {
		return publishdao.getPublishCounts();
	}

}
