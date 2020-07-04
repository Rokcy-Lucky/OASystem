package com.share.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.util.PropertiesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.StaticApplicationContext;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import com.mchange.v2.util.PropertiesUtils;
import com.share.bean.FileInfoBean;
import com.share.service.FileInfoService;
import com.sun.xml.internal.fastinfoset.sax.Properties;

@Controller
public class FileUploadController {
	/*
	 * MultipartFile:���ڽ��տͻ��˴������ļ���
	 */
	@Autowired
	private FileInfoService fileInfoService;

	// public String
	// PATH="D:\\eclipse-jee\\workspace\\OfficeAutomationSystem\\WebRoot\\upload\\";
	@RequestMapping("fileupload.do")
	public void filesUpload(@RequestParam("myfiles") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("====�ļ��ϴ�controller===");
		// ����ļ�·��
		String path = request.getSession().getServletContext().getRealPath("/");
		String filePath = path + "upload\\" + file.getOriginalFilename();
		// �����ļ�
		saveFile(request, file);
		int id = Integer.parseInt(request.getParameter("fileid"));
		String name = file.getOriginalFilename();
		String remark = request.getParameter("fileremark");
		String username = (String) request.getSession().getAttribute("username");
		// ��ȡϵͳ��ǰʱ��
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatDate = dateFormat.format(date);
		int typeid = 0;
		if (name.contains("doc")) {
			typeid = 2;
		}
		if (name.contains("xlsx")) {
			typeid = 3;
		}
		if (name.contains("txt")) {
			typeid = 1;
		}
		System.out.println("typeid" + typeid);
		//����ifdeleteΪ2������������վ
		int ifdelete = 2;
		FileInfoBean fileInfoBean = new FileInfoBean(id, name, typeid, remark, username, creatDate,
				filePath,ifdelete);
		fileInfoService.addFile(fileInfoBean);
		request.getRequestDispatcher("file_management.do").forward(request, response);
	}

	/**
	 * ResponseEntity<byte[]>:��Ӧ�ļ�����
	 */
	@RequestMapping("filedownload")
	public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException {
		// �õ��ļ�·��
		String path = request.getParameter("filepath");
		// �õ��ļ���
		String fileName1 = request.getParameter("filename");
		// ���ļ���װ��File������
		File file = new File(path);
		// ������Ӧͷ
		HttpHeaders headers = new HttpHeaders();
		// Ϊ�˽������������������
		String fileName = new String(fileName1.getBytes("UTF-8"), "iso-8859-1");
		// �ļ�������Ӧͷ�Ĺ̶���ʽ
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);
		/*
		 * FielUtils:SpringMVC�У���ȡ�ļ�����
		 */
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers,
				HttpStatus.CREATED);
		return responseEntity;
	}

	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public String handleException(MaxUploadSizeExceededException ex) throws Exception {
		System.out.println("------");
		return "redirect:/fileUpload.jsp";
	}

	private void saveFile(HttpServletRequest request, MultipartFile file) {
		// �ж��ļ��Ƿ�Ϊ��
		if (!file.isEmpty()) {
			try {

				/*
				 * MultipartFile���getOriginalFilename�������ڻ�ȡ�ļ���
				 */
				String path = request.getSession().getServletContext().getRealPath("/");
				System.out.println(path);
				String filePath = path + "upload\\" + file.getOriginalFilename();
				System.out.println(filePath);
				// ���ϴ��ļ���װ��File������
				File saveDir = new File(filePath);
				System.out.println("FIle::"+saveDir.getAbsolutePath());
				// �ж��ϴ��ļ���·���Ƿ���ڣ�����ļ�·�������ڣ���ʼ��Ŀ¼
				if (!saveDir.getParentFile().exists())
					saveDir.getParentFile().mkdirs();
				/*
				 * ����ļ� MultipartFile�����transferTo����ļ��Ķ�д����
				 */
				file.transferTo(saveDir);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("fileupload1.do")
	public String upload() {
		return "fileupload";

	}
}
