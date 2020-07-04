package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.LoginLogBean;
import com.share.dao.LoginLogDao;

@Service
public class LoginLogService {
	@Autowired
	private LoginLogDao loginLog;
	//�����¼��Ϣ
	public void loginLog(LoginLogBean login){
		 loginLog.loginLog(login);
	}
	//��ѯ�û���½��־��Ϣ
	public List<LoginLogBean> loginLogShow(){
		return loginLog.loginLogShow();
	}
}
