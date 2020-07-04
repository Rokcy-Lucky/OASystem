package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.FileDetailsInfo;
import com.share.bean.FileInfoBean;
import com.share.dao.FileInfoDao;

/**
 * �ļ���Ϣ����service��
 * 
 * @author Administrator
 */
@Service
public class FileInfoService {

	@Autowired
	private FileInfoDao fileinfodao;

	/**
	 * service���ȡ�ļ�����ظ�����������Ϣ
	 * 
	 * @return
	 */
	public List<FileDetailsInfo> findFileDetailsInfo() {
		return fileinfodao.findFileDetailsInfo();

	}


	/**
	 * service���ȡ���ݿ��ļ�������
	 * 
	 * @return
	 */
	public int findAllFilecount() {
		return fileinfodao.findAllfileCount();
	}

	/**
	 * service���ȡ��Ҫ�޸ĵ��ļ���Ϣ
	 * 
	 * @return
	 */
	public FileInfoBean findUpdateFileinfo(int fileinfoid) {
		return fileinfodao.findUpdateFileinfo(fileinfoid);
	}
	public  void addFile(FileInfoBean fileInfoBean) {
		fileinfodao.addFile(fileInfoBean);
	}

	/**
	 * service���޸��ļ���Ϣ
	 * 
	 * @param fileinfo
	 */
	public void updateFileInfo(FileInfoBean fileinfo) {
		fileinfodao.updateFileinfo(fileinfo);

	}
	
	//�����ļ�
	public List<FileDetailsInfo> fileSearch(FileDetailsInfo file){
		return fileinfodao.fileSearch(file);
	}
}
