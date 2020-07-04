package com.share.dao;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.MessageBean;
import com.share.bean.MessageDetailsBean;
import com.share.bean.MessageTypeBean;
import com.share.bean.UserBean;

/**
 * ��Ϣ����dao��
 * 
 * @author Administrator
 *
 */

@RequestMapping
public interface MessageManagementDao {

	/**
	 * dao��ͨ����¼�û�����ȡ��userinfoid,���ڲ�ѯmessage
	 * 
	 * @param username
	 * @return
	 */
	public int findMessageUserInfoid(String username);

	/**
	 * dao���ȡ��¼�û�����������Ϣ����
	 * 
	 * @param userinfoid
	 * @return
	 */
	public int findSendCount(int userinfoid);

	/**
	 * dao����ʾ��¼�û����͵���Ϣ
	 * 
	 */
	public List<MessageDetailsBean> findUserSendMessage(int userinfoid);

	/**
	 * dao���ȡ��¼�û��յ�����Ϣ����
	 * 
	 * @param userinfoid
	 * @return
	 */
	public int findHoldCount(int userinfoid);

	/**
	 * dao����ʾ��¼�û��յ�����Ϣ
	 * 
	 */
	public List<MessageDetailsBean> findUserHoldMessage(int userinfoid);

	/**
	 * ��ȡ��Ϣ������Ϣ
	 * 
	 * @return
	 */
	public List<MessageTypeBean> findMessageType();

	/**
	 * ��ȡ��Ϣ������Ϣ������ֵ
	 * 
	 * @return
	 */
	public int findMaxMessageid();

	/**
	 * dao�㷢����Ϣ
	 * 
	 * @param messagebean
	 */
	public void sendMessages(MessageBean messagebean);

	/**
	 * dao���ȡ��Ҫ�޸ĵ���Ϣ��Ϣ
	 * 
	 * @param messageid
	 * @return
	 */
	public MessageBean selectUpdateMessage(int messageid);

	/**
	 * ��ȡ�����޸ĵ���Ϣ����
	 * 
	 * @param messagetypeid
	 * @return
	 */
	public String selectUpdateMessageType(int messagetypeid);

	/**
	 * �޸ĵ�¼�û���������Ϣ
	 * 
	 * @param messageid
	 */
	public void updateMessages(MessageBean message);

	/**
	 * ɾ����½�û�����������Ϣ
	 * 
	 * @param messageid
	 */
	public void deleteMessage(int messageid);

}
