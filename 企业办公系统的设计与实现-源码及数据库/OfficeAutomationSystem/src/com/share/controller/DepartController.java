package com.share.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mchange.v2.encounter.StrongEqualityEncounterCounter;
import com.share.bean.BranchManagement;
import com.share.bean.DepartBean;
import com.share.bean.DepartPojo;
import com.share.bean.UserBean;
import com.share.service.BranchManagementService;
import com.share.service.DepartService;
import com.share.service.UserService;
import com.sun.org.apache.regexp.internal.recompile;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

@Controller
public class DepartController {

	@Autowired
	private DepartService departService;
	@Autowired
	private UserService userService;
	@Autowired
	private BranchManagementService branch;

	@RequestMapping("depart_management.do")
	public String findAllDepart(HttpServletRequest request, HttpServletResponse response) {
		List<DepartPojo> listDepartPojo = departService.findAllDepart();
		int count=listDepartPojo.size();
		request.getSession().setAttribute("listDepartPojo", listDepartPojo);
		request.getSession().setAttribute("departcount", count);
		
		return "showdepart";
	}

	@RequestMapping("updatedepart.do")
	public String edtion(HttpServletRequest request) {
		String s = request.getParameter("id");
		List<UserBean> list = userService.userShow();
		List<BranchManagement> list2 = branch.getAllBranchList();
		List<DepartPojo> listDepartPojo = departService.findAllDepart();
		for (DepartPojo departPojo : listDepartPojo) {
			if (departPojo.getT_departinfo_id().equals(s)) {
			    request.getSession().setAttribute("departPojo", departPojo);
				request.getSession().setAttribute("userBean", list);
				request.getSession().setAttribute("branchBean", list2);
			}
		}
	System.out.println("输出部门信息为"+listDepartPojo);
	System.out.println("输出用户信息为"+list);
	System.out.println("输出机构信息为"+list2);
		return "updatedepart";
	}


	@RequestMapping("update.do")
	public String update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		departService.updateDepart(get(request));
		return "showdepart";
	}

	@RequestMapping("adddepart.do")
	public String addepart(HttpServletRequest request) {
		List<UserBean> list = userService.userShow();
		List<BranchManagement> list2 = branch.getAllBranchList();
		request.getSession().setAttribute("userBean", list);
		request.getSession().setAttribute("branchBean", list2);
		return "adddepart";
	}
	
	/*
	@RequestMapping("adddepart.do")
	public String addepart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String departid1 = request.getParameter("departid");
		int departid = Integer.parseInt(departid1);
		DepartBean depart = new DepartBean();
	    depart.setT_departinfo_id(departid);
		
		List<UserBean> list = userService.userShow();
		List<BranchManagement> list2 = branch.getAllBranchList();
		request.getSession().setAttribute("userBean", list);
		request.getSession().setAttribute("branchBean", list2);
		return "adddepart";
	}
	*/
	
	
	
	
	@RequestMapping("add.do")
	public void updatedepart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DepartBean departBean = new DepartBean();
		
		
		/*request.getParameter("departName");
		request.getParameter("branchname");
		request.getParameter("branchId");
		request.getParameter("userName");
		request.getParameter("userId");
		request.getParameter("departTel");
		request.getParameter("departMobileTel");
		request.getParameter("dapartFaxes");*/
	
		departBean.setT_departinfo_id(Integer.parseInt(request.getParameter("departId")));
		departBean.setT_departinfo_name(request.getParameter("branchname"));
		departBean.setT_branchinfo_id(request.getParameter("branchId"));
		departBean.setT_departinfo_faxes(request.getParameter("dapartFaxes"));
		departBean.setT_departinfo_mobiletel(request.getParameter("departMobileTel"));
		departBean.setT_departinfo_tel(request.getParameter("departTel"));
		departBean.setT_userinfo_id(request.getParameter("userId"));
		departBean.setT_userinfo_name(request.getParameter("userName"));
		departBean.setT_departinfo_name(request.getParameter("departName"));
		
	
	
		departService.adddepart(departBean);
		System.out.println("123-----------------------------"+departBean);
		request.getRequestDispatcher("depart_management.do").forward(request, response);
		
		
	}

	public DepartBean get(HttpServletRequest request) {
		String departname = request.getParameter("departName");
		String userid = request.getParameter("userId");
		String branchid = request.getParameter("branchId");
		String departtel = request.getParameter("departTel");
		String departfaxes = request.getParameter("dapartFaxes");
		String departmobile = request.getParameter("departMobileTel");
		DepartBean departBean = new DepartBean(departname, branchid, userid, departtel, departmobile, departfaxes);
		return departBean;
	}

	@RequestMapping("delete.do")
	public String deleteDepart(HttpServletRequest request) {
		String departId = request.getParameter("departid");
		departService.deletrDepart(departId);
		System.out.println(departId);
		return "showdepart";
	}

	@RequestMapping("deleteAll.do")
	public String deleteAllDepart(HttpServletRequest request) {
		String text = request.getParameter("text");
		List<DepartPojo> list = new ArrayList<>();
		System.out.println("text:" + text);
		String[] departId = text.split(",");
		for (String string : departId) {
			departService.deletrDepart(string);
		}
		return "showdepart";
	}
}
