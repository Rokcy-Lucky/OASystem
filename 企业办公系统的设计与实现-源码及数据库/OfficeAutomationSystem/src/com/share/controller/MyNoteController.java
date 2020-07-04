package com.share.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.MyNoteBean;
import com.share.service.MyNoteService;

@Controller
public class MyNoteController {
	@Autowired
	private MyNoteService myNoteService;
	//��ʾ��ǩ
	@RequestMapping("my_note.do")
	public String myNoteShow(HttpServletRequest request,HttpServletResponse response){
		System.out.println("===ϵͳ������ʾ��ǩ=====");
		List<MyNoteBean> mynotelist = myNoteService.myNoteShow();
		request.setAttribute("mynotelist", mynotelist);
		//��ʾ��ǩ������
		int count = myNoteService.myNoteCount();
		request.setAttribute("count", count);
		return "mynoteshow";
	}
	//��ӱ�ǩ
	@RequestMapping("mynoteadd.do")
	public void myNoteAdd(HttpServletRequest request,HttpServletResponse response){
		System.out.println("========ϵͳ������ӱ�ǩ=======");
		String id = request.getParameter("mynoteId");
		int id1 = Integer.parseInt(id);
		String title = request.getParameter("mynotetitle");
		String content = request.getParameter("mynotecontent");
		String time = request.getParameter("mynotecreatetime");
		String creater = request.getParameter("mynotecreateuser");
		MyNoteBean note = new MyNoteBean(id1,title,content,time,creater);
		myNoteService.myNoteAdd(note);
		try {
			request.getRequestDispatcher("my_note.do").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//��ת����ӱ�ǩ����
	@RequestMapping("mynoteadd1.do")
	public String forward(){
		return "mynoteadd";
	}
	
	//ɾ����ǩ
	@RequestMapping("mynotedelete.do")
	public void myNoteDelete(HttpServletRequest request,HttpServletResponse response){
		System.out.println("======ϵͳ����ɾ����ǩ======");
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		myNoteService.myNoteDelete(id1);
		try {
			request.getRequestDispatcher("my_note.do").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//��ת���޸ı�ǩҳ��
	@RequestMapping("mynoteupdate1.do")
	public String forward1(){
		return "mynoteupdate";
	}
	//�޸ı�ǩ
	@RequestMapping("mynoteupdate.do")
	public void myNoteUpdate(HttpServletRequest request,HttpServletResponse response){
		System.out.println("======ϵͳ�����޸ı�ǩ=====");
		String id = request.getParameter("mynoteId");
		int id1 = Integer.parseInt(id);
		String title = request.getParameter("mynotetitle");
		String content = request.getParameter("mynotecontent");
		MyNoteBean mynote = new MyNoteBean();
		mynote.setT_mynote_id(id1);
		mynote.setT_mynote_title(title);
		mynote.setT_mynote_content(content);
		myNoteService.myNoteUpdate(mynote);
		try {
			request.getRequestDispatcher("my_note.do").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
