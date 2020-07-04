package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.MessageBean;
import com.share.bean.MessageDetailsBean;
import com.share.bean.MessageTypeBean;
import com.share.bean.UserBean;
import com.share.dao.MessageManagementDao;
import com.share.dao.UserDao;

/**
 * ��Ϣ����service
 * 
 * @author Administrator
 *
 */
@Service
public class MessageManagementService {

	@Autowired
	private MessageManagementDao messagemanagedao;
	private UserDao userdao;

	/**
	 * service��ȡ��¼�û�userinfoid
	 * 
	 * @param usrname
	 * @return
	 */
	public int findMessageUserinfoid(String usrname) {
		return messagemanagedao.findMessageUserInfoid(usrname);
	}

	/**
	 * service���ȡ��¼�û���������Ϣ������
	 * 
	 * @param userinfoid
	 * @return
	 */
	public int findSendCount(int userinfoid) {
		return messagemanagedao.findSendCount(userinfoid);
	}

	/**
	 * service��ȡ�û����͵���Ϣ
	 * 
	 * @param userinfoid
	 * @return
	 */
	public List<MessageDetailsBean> findUserSendMessage(int userinfoid) {
		return messagemanagedao.findUserSendMessage(userinfoid);
	}

	/**
	 * service���ȡ��¼�û��յ���Ϣ������
	 * 
	 * @param userinfoid
	 * @return
	 */
	public int findHoldCount(int userinfoid) {
		return messagemanagedao.findHoldCount(userinfoid);
	}

	/**
	 * service��ȡ�û��յ�����Ϣ
	 * 
	 * @param userinfoid
	 * @return
	 */
	public List<MessageDetailsBean> findUserHoldMessage(int userinfoid) {
		return messagemanagedao.findUserHoldMessage(userinfoid);
	}

	/**
	 * service���ȡ��Ϣ����
	 * 
	 * @return
	 */
	public List<MessageTypeBean> findMessageType() {
		return messagemanagedao.findMessageType();
	}

	/**
	 * service���ȡ��Ϣ������Ϣ�������ֵ
	 * 
	 * @return
	 */
	public int findMaxMessageid() {
		return messagemanagedao.findMaxMessageid();
	}

	/**
	 * service���ȡ�û����û����ͱ��
	 * 
	 * @return
	 */
	public List<UserBean> findUserIdName() {
		return userdao.userShow();
	}

	/**
	 * service�㷢����Ϣ����
	 * 
	 * @param messagebean
	 */
	public void sendMessages(MessageBean messagebean) {
		messagemanagedao.sendMessages(messagebean);

	}

	/**
	 * service���ȡ��Ҫ�޸ĵ���Ϣ��Ϣ
	 * 
	 * @param messageid
	 * @return
	 */
	public MessageBean selectUpdateMessage(int messageid) {
		return messagemanagedao.selectUpdateMessage(messageid);
	}

	/**
	 * service���ȡ�����޸���Ϣ����������
	 * 
	 * @param messagetypeid
	 * @return
	 */
	public String selectUpdateMessageType(int messagetypeid) {
		return messagemanagedao.selectUpdateMessageType(messagetypeid);

	}

	/**
	 * service���޸ĵ�¼�û����͵���Ϣ
	 * 
	 * @param messageid
	 */
	public void updateMessages(MessageBean message) {
		messagemanagedao.updateMessages(message);
	}

	/**
	 * service��ɾ����¼�û���������Ϣ
	 * 
	 * @param messageid
	 */
	public void deleteMessage(int messageid) {
		messagemanagedao.deleteMessage(messageid);

	}
}
