package com.share.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.FileInfoBean;
import com.share.dao.FileInfoDao;

@Service
public class FileDeleteService {

	@Autowired
	private FileInfoDao fileInfoDao;

	// ɾ�����ݿ��ļ���Ϣ
	public void fileDelete(int i) {
		fileInfoDao.fileDelete(i);
	}

	// ɾ�������ļ�����
	public void delFile(String path) {
		System.out.println("�����ļ�ɾ��service");
		File file = new File(path);
		System.out.println("ɾ���ļ���·��"+path);
		System.out.println("�Ƿ����"+file.exists());
		System.out.println("�Ƿ����ļ�"+file.isFile());
		if (file.exists() && file.isFile()) {
			boolean d = file.delete();

			if (d) {
				System.out.println("ɾ���ɹ�");
			} else {
				System.out.println("ɾ��ʧ��");
			}
		}
	}

	// �������վ
	public void trash(FileInfoBean deletefile) {
		fileInfoDao.ifDelete(deletefile);
	}
	//�ӻ���վȡ��
	public void cancel(FileInfoBean deletefile){
		fileInfoDao.cancelDelete(deletefile);
	}
}
