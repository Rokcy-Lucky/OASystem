package com.share.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.SignBean;
import com.share.dao.SignDao;
import com.share.service.SignService;

@Controller
public class SignController {
	@Autowired
	private SignService sign;

	//Ա��ǩ����Ϣ��ʾ
	@RequestMapping("manualsign.do")
	public String forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("=====ϵͳ����Ա��ǩ����Ϣ��ʾ==========");
		List<SignBean> list = sign.signShow();
		request.setAttribute("signlist", list);
		return "signshow";
	}

	// Ա��ǩ��
	@RequestMapping("signin.do")
	public void maualSign(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=====ϵͳ����Ա��ǩ��==========");
		int id =  (int) request.getSession().getAttribute("userid");
		SignBean signBean = new SignBean();
		signBean.setT_userinfo_id(id);
		// ��ȡϵͳ��ǰʱ��
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signDate = dateFormat.format(date);
		signBean.setT_manualsign_time(signDate);
		System.out.println("=====ǩ��Ա��id��ʱ��====="+id+signDate);
		sign.signAdd(signBean);
		request.getRequestDispatcher("manualsign.do").forward(request, response);
	}
}
