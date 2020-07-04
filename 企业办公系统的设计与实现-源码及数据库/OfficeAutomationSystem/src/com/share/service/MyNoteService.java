package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.MyNoteBean;
import com.share.dao.MyNoteDao;

@Service
public class MyNoteService {
	@Autowired
	private MyNoteDao myNoteDao;

	public MyNoteDao getMyNoteDao() {
		return myNoteDao;
	}

	public void setMyNoteDao(MyNoteDao myNoteDao) {
		this.myNoteDao = myNoteDao;
	}
	//��ʾ��ǩ
	public List<MyNoteBean> myNoteShow(){
		return myNoteDao.myNoteShow();
	}
	//��ʾ��ǩ������
	public int myNoteCount(){
		return myNoteDao.myNoteCount();
	}
	//��ӱ�ǩ
	public void myNoteAdd(MyNoteBean mynote){
		myNoteDao.myNoteAdd(mynote);
	}
	//ɾ����ǩ
	public void myNoteDelete(int id){
		myNoteDao.myNoteDelete(id);
	}
	//�޸ı�ǩ
	public void myNoteUpdate(MyNoteBean mynote){
		myNoteDao.myNoteUpdate(mynote);
	}
}
