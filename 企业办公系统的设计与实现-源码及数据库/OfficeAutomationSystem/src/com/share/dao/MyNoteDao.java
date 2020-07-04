package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.share.bean.MyNoteBean;

@Component
public interface MyNoteDao {
	//��ʾ��ǩ
	public List<MyNoteBean> myNoteShow();
	//��ʾ��ǩ������
	public int myNoteCount();
	//��ӱ�ǩ
	public void myNoteAdd(MyNoteBean mynote);
	//ɾ����ǩ
	public void myNoteDelete(int id);
	//�޸ı�ǩ
	public void myNoteUpdate(MyNoteBean mynote);
}
