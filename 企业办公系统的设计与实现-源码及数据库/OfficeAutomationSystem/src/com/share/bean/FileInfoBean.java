package com.share.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * �ļ���Ϣ����javabean
 * 
 * @author Administrator
 *
 */

public class FileInfoBean implements Serializable {
	private int t_fileinfo_id;// �ļ�id
	private String t_fileinfo_name;// �ļ�����
	private int t_fileinfo_filetypeid;// �ļ�����
	private String t_fileinfo_remark;// ��ע
	private String t_fileinfo_owner;// ������
	private String t_fileinfo_createdate;// ��������
	private int t_fileinfo_parentid;// ���ڵ�id
	private String t_fileinfo_filepath;// �ļ�·��
	private int t_fileinfo_ifdelete;// �ļ��Ƿ���ɾ����1ɾ�� ��2δɾ����

	public FileInfoBean() {
	}
	public FileInfoBean(int id, int ifdelete){
		this.t_fileinfo_id = id;
		this.t_fileinfo_ifdelete = ifdelete;
	}

	public FileInfoBean(int id, String filename, int typeid, String remark, String username, String date,
			String filepath,int ifdelete) {
		this.t_fileinfo_id = id;
		this.t_fileinfo_name = filename;
		this.t_fileinfo_filetypeid = typeid;
		this.t_fileinfo_remark = remark;
		this.t_fileinfo_owner = username;
		this.t_fileinfo_createdate = date;
		this.t_fileinfo_filepath = filepath;
		this.t_fileinfo_ifdelete =ifdelete;
	}

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

	public int getT_fileinfo_filetypeid() {
		return t_fileinfo_filetypeid;
	}

	public void setT_fileinfo_filetypeid(int t_fileinfo_filetypeid) {
		this.t_fileinfo_filetypeid = t_fileinfo_filetypeid;
	}

	public String getT_fileinfo_remark() {
		return t_fileinfo_remark;
	}

	public void setT_fileinfo_remark(String t_fileinfo_remark) {
		this.t_fileinfo_remark = t_fileinfo_remark;
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

	public int getT_fileinfo_parentid() {
		return t_fileinfo_parentid;
	}

	public void setT_fileinfo_parentid(int t_fileinfo_parentid) {
		this.t_fileinfo_parentid = t_fileinfo_parentid;
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

}
