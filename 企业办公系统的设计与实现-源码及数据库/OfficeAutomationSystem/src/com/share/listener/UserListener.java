package com.share.listener;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class UserListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent sessionEvent) {
//		// TODO Auto-generated method stub
//		System.out.println("����session��������1");
//		//��ȡServletcontext
//		ServletContext context = sessionEvent.getSession().getServletContext();
//		//��ȡ��ǰ����
//		Integer count = (Integer) context.getAttribute("OnlineCount");
//		if(count== null){
//			//���Ϊ�գ���ʼ��Ϊ1����һ�����ʵ��û���
//			count = new Integer(1);
//		}else{
//			//+1
//			int i = count.intValue();
//			count = new Integer(i+1);
//		}
//		//�ı�����
//		context.setAttribute("OnlineCount", count);

        System.out.println("sessionCreated");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date time = new Date();
        String startTime = sdf.format(time);
        System.out.println("��ǰʱ��Ϊ" + startTime);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
//		// TODO Auto-generated method stub
//		System.out.println("����session��������1");
//		ServletContext context = sessionEvent.getSession().getServletContext();
//		Integer count = (Integer) context.getAttribute("OnlineCount");
//		int i = count.intValue();
//		context.setAttribute("OnlineCount", count);
	}
	
}
