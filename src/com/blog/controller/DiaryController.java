package com.blog.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.model.Diary;
import com.blog.service.DiaryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class DiaryController {
	@Autowired
	DiaryService diaryService;
	
	/**
	 * ��д����
	 * @param diary
	 * @return
	 */
	@RequestMapping("writediary")
	public String writediary(Diary diary,RedirectAttributes attributes){
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(currentTime);
		diary.setTime(dateString);
		this.diaryService.writediary(diary);
		attributes.addFlashAttribute("msg", "�����ռǳɹ�");
		return "redirect:admindiary";
	}
	/**
	 * ��ѯ��������
	 * @param request
	 * @return
	 */
	@RequestMapping("selectAllDiary")
	public String selectAllDiary(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model){
		try {
			PageHelper.startPage(pn, 10);
			List<Diary> diarys =  diaryService.selectAllDiary();
			PageHelper.orderBy("diaryid desc");//����Ϊ����
			PageInfo page = new PageInfo(diarys);
			model.addAttribute("diarys", page);
			return "saylist";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	/**
	 * ����Ա�����������б�
	 * @param request
	 * @return
	 */
	@RequestMapping("/admindiary")
	public String admindiary(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model){
		try {
			PageHelper.startPage(pn, 10);
			PageHelper.orderBy("diaryid desc");//����Ϊ����
			List<Diary> diarys = diaryService.selectAllDiary();
			PageInfo page1 = new PageInfo(diarys);
			model.addAttribute("diarys", page1);
			return "/admin/adminDiaryList";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	/**
	 * ɾ������
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteDiaryById")
	public String deleteDiaryById(HttpServletRequest request,RedirectAttributes attributes){
		try {
			String id = request.getParameter("diaryid");
			int diaryid = Integer.parseInt(id);
			this.diaryService.deleteDiaryById(diaryid);
			attributes.addFlashAttribute("msg", "ɾ���ռǳɹ�");
			return "redirect:admindiary";
		} catch (Exception e) {
			return null;	
		}
	}
}