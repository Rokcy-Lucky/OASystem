package com.share.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.LoginLogBean;
import com.share.bean.ManageBean;
import com.share.bean.MessageDetailsBean;
import com.share.bean.PowerBean;
import com.share.bean.UserBean;
import com.share.service.LoginLogService;
import com.share.service.LoginService;
import com.share.service.MyService;
import com.share.service.PublishService;

@Controller
public class LoginController {
	// ��ת����½ҳ��
	@RequestMapping("loginservlet.do")
	public String forward(HttpServletRequest request) {
		// sunkai��ӣ�ȡ��Ϣ��session�����ڹ���
		List<MessageDetailsBean> publishlist = publishservice.selectPublish();
		request.getSession().setAttribute("publishlist", publishlist);
		return "login";
	}

	@RequestMapping("welcome.do")
	public String go() {
		return "welcome";
	}

	@Autowired
	private MyService myservice;
	@Autowired
	private LoginService loginService;
	@Autowired
	private LoginLogService loginLog;
	@Autowired
	private PublishService publishservice;

	// �����ò����½����ֻ����һ��
	int i = 1;

	// ��½��֤
	@RequestMapping("logincheck.do")
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("ϵͳ����logincheck.do");
		// ���ñ����ʽ
		// request.setCharacterEncoding("UTF-8");
		// response.setContentType("text/html;charset=UTF-8");
		// ��ȡ�˺�����
		String user = request.getParameter("user");
		System.out.println(user);
		String password = request.getParameter("password");
		System.out.println(password);
		String imgcode = request.getParameter("imge");
		System.out.println(imgcode);
		String imgcodes = (String) request.getSession().getAttribute("random");
		System.err.println("aa" + imgcodes);
		if (imgcode.equalsIgnoreCase(request.getSession().getAttribute("random").toString())) {
			List<UserBean> list = myservice.testCheck();
			System.out.println(list);
			for (UserBean userBean : list) {
				if (userBean.getT_userinfo_name().equals(user) && userBean.getT_userinfo_password().equals(password)) {
					Map<String, List<PowerBean>> map = loginService.findManagePower(user);
					System.out.println("name:" + userBean.getT_userinfo_name());
					// ����Ȩ���б�
					request.getSession().setAttribute("map", map);
					// ���ݵ�¼�û���
					request.getSession().setAttribute("username", userBean.getT_userinfo_name());
					// ��ȡ��½ʱϵͳ��ǰʱ�䣬������
					Date date = new Date();
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String loginDate = dateFormat.format(date);
					request.getSession().setAttribute("loginDate", loginDate);
					// ��õ�¼�û�id������
					request.getSession().setAttribute("userid", userBean.getT_userinfo_id());
					// �����½����
					if (i == 1) {
						System.out.println("====ϵͳ��������½��־====");
						String username = (String) request.getSession().getAttribute("username");
						String logindate = (String) request.getSession().getAttribute("loginDate");
						int userid = (int) request.getSession().getAttribute("userid");
						String userip = request.getRemoteAddr();
						LoginLogBean loginlog1 = new LoginLogBean();
						loginlog1.setT_userinfo_id(userid);
						loginlog1.setT_loginlog_time(logindate);
						loginlog1.setT_loginlog_userip(userip);
						System.out.println("��õ�½��Ϣ" + userid + logindate + userip);
						loginLog.loginLog(loginlog1);
						i = 2;
					}

					return "index";
				}
			}
			return "login";
		}
		return "login";
	}
	@RequestMapping("log-off.do")
	public String logOff(HttpServletRequest request){
		request.getSession().invalidate();
		return "login";
	}
}
