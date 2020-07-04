package com.share.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.share.bean.MyScheduleBean;
import com.share.dao.MyScheduleDao;
import com.share.util.Page;

@Service
public class MyScheduleService {

	@Autowired
	private MyScheduleDao myscheduledao;

	/**
	 * Service���ȡ�ҵ������ճ�
	 * 
	 * @return
	 */
	public List<MyScheduleBean> getAllMySchedule() {
		return myscheduledao.findAllMySchedule();
	}

	/**
	 * service���ȡ�ҵ������ճ̵�����
	 * 
	 * @return
	 */
	public int getAllMyScheduleCount() {
		return myscheduledao.findAllMyScheduleCount();
	}

	/**
	 * service��������ҵ��ճ�
	 * 
	 * @param myschedule
	 * @return
	 */
	public String addSchedule(MyScheduleBean myschedule) {
		String str = "myschedule";
		myscheduledao.addMySchedule(myschedule);
		return str;
	}

	/**
	 * service��ɾ���ҵ��ճ�
	 * 
	 * @param myscheduleid
	 * @return
	 */
	public String deleteMySchedule(int myscheduleid) {
		String str = "myschedule";
		myscheduledao.deleteMySchedule(myscheduleid);
		return str;
	}

	/**
	 * ��ѯ��Ҫ�޸ĵ��ճ�����
	 * 
	 * @param myscheduleid
	 * @return
	 */
	public MyScheduleBean findUpdate(int myscheduleid) {
		return myscheduledao.findUpdate(myscheduleid);
	}

	/**
	 * service���޸��ҵ��ճ�
	 * 
	 * @param myschedule
	 * @return
	 */
	public String updateMySchedule(MyScheduleBean myschedule) {
		String str = "myschedule";
		myscheduledao.updateMySchedule(myschedule);
		return str;
	}

	/**
	 * ��ȡ�ҵ������ճ̲����з�ҳ
	 * 
	 * @param request
	 * @param model
	 */
	public void findAllMySchedulePage(HttpServletRequest request, Model model) {
		String pagenow = request.getParameter("pageNow");
		List<MyScheduleBean> MySchedule = new ArrayList<MyScheduleBean>();
		Page page = null;
		int totalCount = myscheduledao.findAllMyScheduleCount();
		if (pagenow != null) {
			page = new Page(totalCount, Integer.parseInt(pagenow));
			MySchedule = myscheduledao.findAllMySchedulePage(page.getStartPos(), page.getPageSize());
		} else {
			page = new Page(totalCount, 1);
			MySchedule = myscheduledao.findAllMySchedulePage(page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("MySchedule", MySchedule);
		model.addAttribute("page", page);
	}

}
