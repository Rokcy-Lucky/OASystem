package com.share.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.remoting.httpinvoker.HttpInvokerServiceExporter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.MessageDetailsBean;
import com.share.service.PublishService;

/**
 * ���Ʋ㹫����Ϣ����
 * 
 * @author Administrator
 *
 */
@Controller
public class PublishController {

	@Autowired
	private PublishService publishservice;

	// ҳ��ת���ڲ鿴����๫�������ҳ�����ؿ�����ҳ
	@RequestMapping("fowordfromindex.do")
	public String selectPublish(HttpServletRequest request) {
		return "index";
	}

	// �鿴����Ĺ�����Ϣ
	@RequestMapping("/publish.do")
	public String showPublish(HttpServletRequest request) {
		int counts = publishservice.getPublishCounts();
		request.setAttribute("counts", counts);
		return "showpublish";
	}

	/**
	 * �鿴������������
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/publishDetails.do")
	public String publishDetails(HttpServletRequest request) {
		int publishid = Integer.parseInt(request.getParameter("publishid"));
		MessageDetailsBean publishes = publishservice.getPublishes(publishid);
		request.setAttribute("publishes", publishes);
		return "publishdetails";
	}
}
