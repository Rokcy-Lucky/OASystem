package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.share.bean.LoginLogBean;

@Component
public interface LoginLogDao {
	
	//�����½��Ϣ
	public void loginLog(LoginLogBean loginlog);
	//��ѯ��½��־��Ϣ
	public List<LoginLogBean > loginLogShow();
}
