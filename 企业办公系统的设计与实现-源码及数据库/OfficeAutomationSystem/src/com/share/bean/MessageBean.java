package com.share.bean;

import java.io.Serializable;

/**
 * ��Ϣ��javabean
 * 
 * @author Administrator
 *
 */
public class MessageBean implements Serializable {

	private int t_message_id;// ��Ϣid
	private String t_message_title;// ��Ϣ����
	private String t_message_content;// ��Ϣ����
	private int t_messagetype_id;// ��Ϣ����
	private String t_message_begintime;// ��ʼ��Чʱ��
	private String t_message_endtime;// ��Ч����ʱ��
	private int t_userinfo_id;// ������id
	private int t_message_ifpublish;// �Ƿ��ѷ���
	private String t_message_recordtime;// ����ʱ��

	public int getT_message_id() {
		return t_message_id;
	}

	public void setT_message_id(int t_message_id) {
		this.t_message_id = t_message_id;
	}

	public String getT_message_title() {
		return t_message_title;
	}

	public void setT_message_title(String t_message_title) {
		this.t_message_title = t_message_title;
	}

	public String getT_message_content() {
		return t_message_content;
	}

	public void setT_message_content(String t_message_content) {
		this.t_message_content = t_message_content;
	}

	public int getT_messagetype_id() {
		return t_messagetype_id;
	}

	public void setT_messagetype_id(int t_messagetype_id) {
		this.t_messagetype_id = t_messagetype_id;
	}

	public String getT_message_begintime() {
		return t_message_begintime;
	}

	public void setT_message_begintime(String t_message_begintime) {
		this.t_message_begintime = t_message_begintime;
	}

	public String getT_message_endtime() {
		return t_message_endtime;
	}

	public void setT_message_endtime(String t_message_endtime) {
		this.t_message_endtime = t_message_endtime;
	}

	public int getT_userinfo_id() {
		return t_userinfo_id;
	}

	public void setT_userinfo_id(int t_userinfo_id) {
		this.t_userinfo_id = t_userinfo_id;
	}

	public int getT_message_ifpublish() {
		return t_message_ifpublish;
	}

	public void setT_message_ifpublish(int t_message_ifpublish) {
		this.t_message_ifpublish = t_message_ifpublish;
	}

	public String getT_message_recordtime() {
		return t_message_recordtime;
	}

	public void setT_message_recordtime(String t_message_recordtime) {
		this.t_message_recordtime = t_message_recordtime;
	}

}
