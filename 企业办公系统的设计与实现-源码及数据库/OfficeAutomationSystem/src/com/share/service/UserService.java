package com.share.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.share.bean.UserBean;
import com.share.dao.UserDao;
import com.share.util.Page;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	// @Autowired
	// private UserBean userBean;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	// ���Ա��
	public void userAdd(UserBean userBean) {
		userDao.userAdd(userBean);
	}

	// ��ѯԱ��
	public List<UserBean> userShow() {
		return userDao.userShow();
	}

	// ��ѯ�û���������
	public int userCountShow() {
		return userDao.userCountShow();
	}

	// ɾ���û�
	public void userDelete(int id) {
		userDao.userDelete(id);
	}

	// �޸��û�
	public void userUpdate(UserBean userBean) {
		userDao.userUpdate(userBean);
	}

	// ����ɫ�����û�
	public List<UserBean> findUser(String id) {
		return userDao.findUser(id);
	}

	// ���û�id�����û���Ϣ
	public UserBean findUserRole(String id) {
		System.out.println("haha:::" + id);
		System.out.println(userDao.findUserRole(id));
		return userDao.findUserRole(id);
	}

	// ��ʾ�û���ҳ
	public void showUsersByPage(HttpServletRequest request, Model model) {
		String pageNow = request.getParameter("pageNow");

		Page page = null;

		List<UserBean> users = new ArrayList<UserBean>();

		int totalCount = userDao.getUsersCount();

		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			users = this.userDao.selectUsersByPage(page.getStartPos(), page.getPageSize());
			System.out.println("nullllllllllllllll" + page.getStartPos() + "=====" + page.getPageSize());
		} else {
			page = new Page(totalCount, 1);
			users = this.userDao.selectUsersByPage(page.getStartPos(), page.getPageSize());
			System.out.println("����nullllllllllllllll" + page.getStartPos() + "=====" + page.getPageSize());
		}

		model.addAttribute("users", users);
		model.addAttribute("page", page);
	}

	// ģ����ѯ�û�
	public void userSearch(HttpServletRequest request, Model model, String user) {
		String pageNow = request.getParameter("pageNow");

		Page page = null;

		List<UserBean> users = new ArrayList<UserBean>();

		String totalCount1 = request.getParameter("totalCount");
		int totalCount;
		if (user != null) {
			totalCount = userDao.getUsersSearchCount(user);
		} else {
			totalCount = Integer.parseInt(totalCount1);
		}
		System.out.println("zongshu================" + totalCount);
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			users = this.userDao.userSearch(page.getStartPos(), page.getPageSize(), user);
			System.out.println("nullllllllllllllll" + page.getStartPos() + "=====" + page.getPageSize());
		} else {
			page = new Page(totalCount, 1);
			users = this.userDao.userSearch(page.getStartPos(), page.getPageSize(), user);
			System.out.println("����nullllllllllllllll" + page.getStartPos() + "=====" + page.getPageSize());
		}

		model.addAttribute("users1", users);
		model.addAttribute("page1", page);
		model.addAttribute("username1",user);
//		request.setAttribute("username1", user);
	}

}
