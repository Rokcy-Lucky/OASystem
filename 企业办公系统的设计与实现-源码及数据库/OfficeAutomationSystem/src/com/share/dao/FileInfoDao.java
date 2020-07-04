package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.share.bean.FileDetailsInfo;
import com.share.bean.FileInfoBean;

/**
 * �ļ���Ϣ����dao��
 * 
 * @author Administrator
 *
 */

@Repository
public interface FileInfoDao {
	/**
	 * dao���ȡ�����ļ�����������ϸ��Ϣ
	 * 
	 * @return
	 */

	public List<FileDetailsInfo> findFileDetailsInfo();

	/**
	 * dao���ȡ���ݿ��ļ�������
	 * 
	 * @return
	 */
	public int findAllfileCount();

	/**
	 * dao���ȡ��Ҫ�޸ĵ��ļ���Ϣ
	 * 
	 * @return
	 */
	public FileInfoBean findUpdateFileinfo(int fileinfoid);

	/**
	 * dao���޸��ļ���Ϣ
	 * 
	 * @param fileinfo
	 */
	public void updateFileinfo(FileInfoBean fileinfo);
	/**
	 * dao���������ļ�����Ϣ 
	 */
	public void addFile(FileInfoBean fileInfoBean);
	
	//ɾ���ļ�
	public void fileDelete(int i);
	
	//�������վ
	public void ifDelete(FileInfoBean deletefile);
	//�ӻ���վȡ��
	public void cancelDelete(FileInfoBean deletefile);
	//�����ļ�
	public List<FileDetailsInfo> fileSearch(FileDetailsInfo file);
}
