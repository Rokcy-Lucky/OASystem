package com.share.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.share.bean.BranchManagement;

/**
 * ��������Ȩ�޲���
 * 
 * @author Administrator
 *
 */

@Repository
public interface BranchManagementDao {

	/**
	 * dao���ȡ���л�����Ϣ
	 * 
	 * @return
	 */
	public List<BranchManagement> findAllBranch();

	/**
	 * dao���ȡ������Ϣ����
	 * 
	 * @return
	 */
	public int findAllBranchCount();

	/**
	 * dao����ӻ���
	 */
	public void addBranch(BranchManagement branch);

	/**
	 * dao���޸Ļ�����Ϣ
	 * 
	 * @param branch
	 */
	public void updateBranch(BranchManagement branch);

	/**
	 * dao��ɾ��������Ϣ
	 * 
	 * @param branchid
	 */
	public void deleteBranch(int branchid);

	/**
	 * ��ҳ��ʾ
	 */
	public List<BranchManagement> findAllBranchPage(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize);

	/**
	 * ��ҳ������ѯ����
	 * 
	 * @param startPos
	 * @param pageSize
	 * @param searchbranch
	 * @return
	 */
	public List<BranchManagement> searchBranch(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize, @Param(value = "searchbranch") String searchbranch);

	/**
	 * ������ѯ�����������
	 * 
	 * @param searchbranch
	 * @return
	 */
	public int searchBranchCount(@Param(value = "searchbranch") String searchbranch);

	/**
	 * ����ɾ������
	 * 
	 * @param array
	 */

	public void deleteAllBranch(@Param(value="array")String[] array);
}
