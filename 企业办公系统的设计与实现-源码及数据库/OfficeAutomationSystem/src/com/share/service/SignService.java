package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.SignBean;
import com.share.dao.SignDao;

@Service
public class SignService {
	@Autowired
	private SignDao signDao;
	//Ա��ǩ��
	public void signAdd(SignBean signBean){
		signDao.signAdd(signBean);
	}
	//��ʾԱ��ǩ����Ϣ
	public List<SignBean> signShow(){
		return signDao.signShow();
	}
}
