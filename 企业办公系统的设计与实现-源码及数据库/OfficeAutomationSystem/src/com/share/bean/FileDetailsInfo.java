package com.share.bean;

import java.io.Serializable;

/**
 * ��ѯ�ļ����飨�����ļ���ַ��ͼƬ��Ϣ��
 * 
 * @author Administrator
 *
 */
public class FileDetailsInfo implements Serializable {
	private int t_fileinfo_id;// �ļ�id
	private String t_fileinfo_name;// �ļ�����
	private String t_fileinfo_owner;// �ļ�������
	private String t_fileinfo_createdate;// �ļ�����ʱ��
	private String t_filetypeinfo_name;// �ļ���������
	private String t_filetypeinfo_image;// �ļ�����ͼƬ
	private String t_fileinfo_filepath;// �ļ���·��
	private int t_fileinfo_ifdelete;// �ļ��Ƿ���ɾ��
	private String t_fileinfo_remark;// �ļ���ע

	public int getT_fileinfo_id() {
		return t_fileinfo_id;
	}

	public void setT_fileinfo_id(int t_fileinfo_id) {
		this.t_fileinfo_id = t_fileinfo_id;
	}

	public String getT_fileinfo_name() {
		return t_fileinfo_name;
	}

	public void setT_fileinfo_name(String t_fileinfo_name) {
		this.t_fileinfo_name = t_fileinfo_name;
	}

	public String getT_fileinfo_owner() {
		return t_fileinfo_owner;
	}

	public void setT_fileinfo_owner(String t_fileinfo_owner) {
		this.t_fileinfo_owner = t_fileinfo_owner;
	}

	public String getT_fileinfo_createdate() {
		return t_fileinfo_createdate;
	}

	public void setT_fileinfo_createdate(String t_fileinfo_createdate) {
		this.t_fileinfo_createdate = t_fileinfo_createdate;
	}

	public String getT_filetypeinfo_name() {
		return t_filetypeinfo_name;
	}

	public void setT_filetypeinfo_name(String t_filetypeinfo_name) {
		this.t_filetypeinfo_name = t_filetypeinfo_name;
	}

	public String getT_filetypeinfo_image() {
		return t_filetypeinfo_image;
	}

	public void setT_filetypeinfo_image(String t_filetypeinfo_image) {
		this.t_filetypeinfo_image = t_filetypeinfo_image;
	}

	public String getT_fileinfo_filepath() {
		return t_fileinfo_filepath;
	}

	public void setT_fileinfo_filepath(String t_fileinfo_filepath) {
		this.t_fileinfo_filepath = t_fileinfo_filepath;
	}

	public int getT_fileinfo_ifdelete() {
		return t_fileinfo_ifdelete;
	}

	public void setT_fileinfo_ifdelete(int t_fileinfo_ifdelete) {
		this.t_fileinfo_ifdelete = t_fileinfo_ifdelete;
	}

	public String getT_fileinfo_remark() {
		return t_fileinfo_remark;
	}

	public void setT_fileinfo_remark(String t_fileinfo_remark) {
		this.t_fileinfo_remark = t_fileinfo_remark;
	}

}
