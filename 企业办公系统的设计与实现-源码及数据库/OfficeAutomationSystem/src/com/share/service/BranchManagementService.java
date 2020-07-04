package com.share.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.BranchManagement;
import com.share.dao.BranchManagementDao;
import com.share.util.Page;

@Service
public class BranchManagementService {

	@Autowired
	private BranchManagementDao branchmanagementdao;

	/**
	 * service���ȡ����������Ϣ
	 * 
	 * @return
	 */

	public List<BranchManagement> getAllBranchList() {
		return branchmanagementdao.findAllBranch();
	}

	/**
	 * service���ȡ��������
	 * 
	 * @return
	 */
	public int getAllBranchCount() {
		return branchmanagementdao.findAllBranchCount();

	}

	/**
	 * service����ӻ���
	 * 
	 * @param branch
	 * @return
	 */
	public String addBranch(BranchManagement branch) {
		String str = "branchmanagement";
		branchmanagementdao.addBranch(branch);
		return str;
	}

	/**
	 * service���޸Ļ���
	 * 
	 * @param branch
	 * @return
	 */
	public String updateBranch(BranchManagement branch) {
		String str = "branchmanagement";
		branchmanagementdao.updateBranch(branch);
		return str;

	}

	public String deleteBranch(int branchid) {
		String str = "branchmanagement";
		branchmanagementdao.deleteBranch(branchid);
		return str;

	}

	/**
	 * ��ҳ��ʾ������Ϣ
	 * 
	 * @param request
	 * @param model
	 */
	public void findAllBranchPage(HttpServletRequest request, Model model) {
		String pageNow = request.getParameter("pageNow");
		Page page = null;
		List<BranchManagement> branchmanagement = new ArrayList<BranchManagement>();
		int totalCount = branchmanagementdao.findAllBranchCount();

		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			branchmanagement = branchmanagementdao.findAllBranchPage(page.getStartPos(), page.getPageSize());
			System.out.println();
		} else {
			page = new Page(totalCount, 1);
			branchmanagement = branchmanagementdao.findAllBranchPage(page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("branchmanagement", branchmanagement);
		model.addAttribute("page", page);
	}

	/**
	 * ������ѯ������Ϣ�����з�ҳ��ʾ
	 * 
	 * @param request
	 * @param model
	 */
	public void searchBranch(HttpServletRequest request, Model model, String searchbranch) {
		String pageNow = request.getParameter("pageNow");

		Page page = null;
		List<BranchManagement> branchmanagement = new ArrayList<BranchManagement>();
		int totalCount = branchmanagementdao.searchBranchCount(searchbranch);

		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			branchmanagement = branchmanagementdao.searchBranch(page.getStartPos(), page.getPageSize(), searchbranch);
			System.out.println();
		} else {
			page = new Page(totalCount, 1);
			branchmanagement = branchmanagementdao.searchBranch(page.getStartPos(), page.getPageSize(), searchbranch);
		}
		model.addAttribute("branchmanagement", branchmanagement);
		model.addAttribute("page", page);
		model.addAttribute("count", totalCount);
	}

	/**
	 * ����ɾ�����ݿ���Ϣ
	 * 
	 * @param array
	 */
	public void deleteAllBranch(String[] array) {
		branchmanagementdao.deleteAllBranch(array);
	}

}
