package com.share.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.FileDetailsInfo;
import com.share.bean.FileInfoBean;
import com.share.service.FileInfoService;

@Controller
public class FileSearchController {
	@Autowired
	private FileInfoService fileinfo;
	//��ת���ļ�������ͼ
	@RequestMapping("file_search.do")
	public String forward(){
		return "filesearch";
	}
	//�ļ�����
	@RequestMapping("filesearch.do")
	public String fileSearch(HttpServletRequest request,HttpServletResponse response){
		System.out.println("=========ϵͳ�����ļ�����=========");
		String filename = request.getParameter("filename");
		FileDetailsInfo file = new FileDetailsInfo();
		file.setT_fileinfo_name(filename);
		System.out.println("=====ģ����ѯ���ļ���Ϊ��"+file.getT_fileinfo_name());
		List<FileDetailsInfo> showfilelist = fileinfo.fileSearch(file);
		request.setAttribute("showfilelist", showfilelist);
		return "filesearch";
	}
}
