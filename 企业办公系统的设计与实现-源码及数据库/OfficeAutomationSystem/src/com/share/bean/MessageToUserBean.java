package com.share.bean;

import java.io.Serializable;

/**
 * ��Ϣ���Ͷ�����Ӧjavabean
 * 
 * @author Administrator
 *
 */
public class MessageToUserBean implements Serializable {

	private int t_messagetouser_id;// ���
	private int t_message_id;// ��Ϣid
	private int t_userinfo_id;// ��Ϣ������id
	private int t_id_read;// ��Ϣ�Ƿ��Ѷ�

	public int getT_messagetouser_id() {
		return t_messagetouser_id;
	}

	public void setT_messagetouser_id(int t_messagetouser_id) {
		this.t_messagetouser_id = t_messagetouser_id;
	}

	public int getT_message_id() {
		return t_message_id;
	}

	public void setT_message_id(int t_message_id) {
		this.t_message_id = t_message_id;
	}

	public int getT_userinfo_id() {
		return t_userinfo_id;
	}

	public void setT_userinfo_id(int t_userinfo_id) {
		this.t_userinfo_id = t_userinfo_id;
	}

	public int getT_id_read() {
		return t_id_read;
	}

	public void setT_id_read(int t_id_read) {
		this.t_id_read = t_id_read;
	}

}
