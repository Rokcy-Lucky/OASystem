package com.share.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.share.bean.FileInfoBean;
import com.share.service.FileDeleteService;

@Controller
public class FileDeleteController {
	@Autowired
	private FileDeleteService delete;
	//����ɾ��
	@RequestMapping("filedelete.do")
	public void fileDelete(HttpServletRequest request,HttpServletResponse response,MultipartFile file) throws ServletException, IOException{
		System.out.println("=========ϵͳ������ɾ������===========");
		String id = request.getParameter("fileinfoid");
		int id1 = Integer.parseInt(id);
		String path = request.getParameter("filepath");
		System.out.println("�ļ�·��===========��"+path);
		delete.delFile(path);
		delete.fileDelete(id1);
		request.getRequestDispatcher("trash.do").forward(request, response);
	}
	//�������վ
	@RequestMapping("ifdelete.do")
	public void ifDelete(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		System.out.println("======ϵͳ����������վ����=====");
		String id = request.getParameter("fileinfoid");
		int id1 = Integer.parseInt(id);
		int ifdelete = 1;
		FileInfoBean deletefile = new FileInfoBean(id1,ifdelete);
		delete.trash(deletefile);
		request.getRequestDispatcher("file_management.do").forward(request, response);
	}
	//ȡ��ɾ��
	@RequestMapping("canceldelete.do")
	public void cancelDelete(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		System.out.println("======ϵͳ����ȡ��ɾ���������ӻ���վȡ��========");
		String id = request.getParameter("fileinfoid");
		int id1 = Integer.parseInt(id);
		int ifdelete = 2;
		FileInfoBean deletefile = new FileInfoBean(id1,ifdelete);
		delete.cancel(deletefile);
		request.getRequestDispatcher("trash.do").forward(request, response);
	}
	
}
