package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.share.bean.SignBean;
@Component
public interface SignDao {
	//���ǩ����Ϣ
	public void signAdd(SignBean signBean);
	//��ʾǩ����Ϣ
	public List<SignBean> signShow();
}
