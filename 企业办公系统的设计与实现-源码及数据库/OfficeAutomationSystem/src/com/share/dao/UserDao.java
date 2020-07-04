package com.share.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.share.bean.UserBean;

@Component
public interface UserDao {
	// ����û�
	public void userAdd(UserBean userBean);

	// ��ѯ�û�
	public List<UserBean> userShow();

	// ��ѯ������
	public int userCountShow();

	// ɾ���û�
	public void userDelete(int id);

	// �޸��û�
	public void userUpdate(UserBean userBean);

	// ����ɫ�����û�
	public List<UserBean> findUser(String id);

	// ���û�id����
	public UserBean findUserRole(String id);

	/**
	 * ʹ��ע�ⷽʽ�������������û���ҳ
	 * 
	 * @param startPos
	 * @param pageSize
	 * @param userId
	 * @return
	 */
	public List<UserBean> selectUsersByPage(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize);

	/**
	 * ȡ���û�������Ϣ
	 * 
	 * @param 
	 * @return
	 */
	public int getUsersCount();
	
	//ģ�������û�
	public List<UserBean> userSearch(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize,@Param(value="t_userinfo_name") String user);
	//ȡ��ģ����ѯ����
	public int getUsersSearchCount(@Param(value="t_userinfo_name") String user);
}
