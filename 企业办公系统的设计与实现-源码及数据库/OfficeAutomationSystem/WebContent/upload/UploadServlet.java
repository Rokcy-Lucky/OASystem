package com.share.putfile;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.catalina.core.ApplicationPart;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
@MultipartConfig()
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String path = this.getServletContext().getRealPath("/");	//��ȡ��������ַ
		Part p = request.getPart("file1");							//��ȡ�û�ѡ����ϴ��ļ�	
		if (p.getContentType().contains("image")) {					// �������ϴ���ͼ���ļ�
			ApplicationPart ap = (ApplicationPart) p;
			System.out.println(ap.getHeaderNames());
			System.out.println(ap.getHeader("content-disposition"));
//			String fname1 = ap.getFilename();						//��ȡ�ϴ��ļ���
//			int path_idx = fname1.lastIndexOf("\\") + 1;			//���ϴ��ļ������н�ȡ
//			String fname2 = fname1.substring(path_idx, fname1.length());	
			
			String content = ap.getHeader("content-disposition");
			String fname1 = content.substring(content.lastIndexOf("\\")+1);
			fname1 = fname1.substring(0, fname1.length()-1);
			File file = new File(path + "/upload/" + fname1);
			p.write(file.getPath());					// д�� web ��Ŀ��·���µ�upload�ļ�����
			out.write("�ļ��ϴ��ɹ�");							
		}
		else{
			  out.write("��ѡ��ͼƬ�ļ�������");
		}
	}
}
