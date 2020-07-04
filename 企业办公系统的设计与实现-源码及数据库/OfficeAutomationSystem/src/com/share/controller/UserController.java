package com.share.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.UserBean;
import com.share.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// ����û�
	@RequestMapping("useradd.do")
			 
	public void userAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("======ϵͳ�����û����=====");
		String id = request.getParameter("adminId");
		int id1 = Integer.parseInt(id);
		String name = request.getParameter("adminName");
		String password = request.getParameter("password");
		String departid = request.getParameter("depart");
		int departid1 = Integer.parseInt(departid);
		String sex = request.getParameter("sex");
		String role = request.getParameter("role");
		int role1 = Integer.parseInt(role);
		String state = request.getParameter("state");
		int state1 = Integer.parseInt(state);
		System.out.println(id + name + password + departid + sex + role + state);
		UserBean userBean = new UserBean(id1, name, password, departid1, sex, role1, state1);
		userService.userAdd(userBean);
//		return "usershow";
		request.getRequestDispatcher("user_management.do").forward(request, response);
	}

	// ��ʾ�û�
	@RequestMapping("user_management.do")
	public void userShow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<UserBean> userlist = userService.userShow();
		request.setAttribute("userlist", userlist);
		// ��ѯ�û�������
		int count = userService.userCountShow();
		request.setAttribute("count", count);
		// return "usershow";
		request.getRequestDispatcher("myProductPage.do").forward(request, response);
	}

	
	
	
	

	// ��ת�����ҳ��
	@RequestMapping("useradd1.do")
	public String forward() {
		return "useradd";
	}

	// ��ת���޸�ҳ��
	@RequestMapping("userupdate1.do")
	public String forward1(HttpServletRequest request, HttpServletResponse response) {
		// try {
		// //��ת���޸��û�����
		// request.getRequestDispatcher("/WEB-INF/jsp/userupdate.jsp").forward(request,
		// response);
		// } catch (ServletException | IOException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		return "userupdate";
	}

	// �޸��û�
	@RequestMapping("userupdate.do")
	public void userUpdate(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ϵͳ�����޸��û�");
		// String id = request.getParameter("id");
		// int id1 = Integer.parseInt(id);
		// String name = request.getParameter("name");
		// String departid = request.getParameter("departid");
		// int departid1 = Integer.parseInt(departid);
		// String gender = request.getParameter("gender");
		// String roleid = request.getParameter("roleid");
		// int roleid1 = Integer.parseInt(roleid);
		// String stateid = request.getParameter("stateid");
		// int stateid1 = Integer.parseInt(stateid);
		// UserBean userBean = new UserBean();
		// userBean.setT_userinfo_id(id1);
		// userBean.setT_userinfo_name(name);
		// userBean.setT_departinfo_id(departid1);
		// userBean.setT_userinfo_gender(gender);
		// userBean.setT_roleinfo_id(roleid1);
		// userBean.setT_userstate_id(stateid1);
		String id = request.getParameter("adminId");
		int id1 = Integer.parseInt(id);
		String name = request.getParameter("adminName");
		String password = request.getParameter("password");
		String departid = request.getParameter("depart");
		int departid1 = Integer.parseInt(departid);
		String sex = request.getParameter("sex");
		String role = request.getParameter("role");
		int role1 = Integer.parseInt(role);
		String state = request.getParameter("state");
		int state1 = Integer.parseInt(state);
		System.out.println(id + name + password + departid + sex + role + state);
		UserBean userBean = new UserBean(id1, name, password, departid1, sex, role1, state1);
		userService.userUpdate(userBean);
		// ��ת���û�չʾҳ
		try {
			request.getRequestDispatcher("user_management.do").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * �û���ҳ
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("myProductPage.do")
	public String showMyUser(HttpServletRequest request, Model model) {

		this.userService.showUsersByPage(request, model);

		return "usershow";
	}

	// �û�ģ������
	@RequestMapping("usersearch.do")
	public String userSearch(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("==========ϵͳ�����û�����==========");
		String username = request.getParameter("username1");
		// request.getSession().setAttribute("username1", username);
		// UserBean user = new UserBean();
		// user.setT_userinfo_name(username);
		// System.out.println("======ģ����ѯ���û���Ϊ��======="+user.getT_userinfo_name());
		this.userService.userSearch(request, model, username);
		return "usersearchshow";
	}

	// ����ɾ���û�
	@RequestMapping("usersdelete.do")
	public void usersDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ϵͳ��������ɾ��
		System.out.println("==========ϵͳ��������ɾ��=========");
		String userid =request.getParameter("ids");
		String userids[] = userid.split(","); 
		for (int i = 0; i < userids.length; i++) {
			System.out.println(userids[i]);
			System.out.println("=====����ɾ�����ݲ���====");
			int id = Integer.parseInt(userids[i]);
			userService.userDelete(id);
		}
		request.getRequestDispatcher("user_management.do").forward(request, response);
	}
	
	
/*
	// ɾ���û�
	@RequestMapping("userdelete.do")
	public String userDelete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		System.out.println("ϵͳ����ɾ���û�");
		System.out.println(id1);
		userService.userDelete(id1);
		return "usershow";
	}
	*/
	

	// ɾ���û�
	@RequestMapping("userdelete.do")
	public void userDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		System.out.println("ϵͳ����ɾ���û�");
		System.out.println(id1);
		userService.userDelete(id1);
		request.getRequestDispatcher("user_management.do").forward(request, response);
	}

}
