package com.share.dao;

import java.util.List;

import com.share.bean.DepartBean;
import com.share.bean.DepartPojo;

public interface DepartDao {
	/**
	 * ��ѯ���в�����Ϣ
	 * @return
	 */
	public List<DepartPojo> findAllDepart();
	public void updetDepart(DepartBean departBean);
	public void addDepart(DepartBean departBean);
	public void deleteDepart(String id);
}
