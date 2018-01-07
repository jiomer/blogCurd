package com.blog.controller;


import java.util.ArrayList;
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
import com.blog.util.Functions;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class DiaryController {
	@Autowired
	DiaryService diaryService;
	
	/**
	 * 编写心情
	 * @param diary
	 * @return
	 */
	@RequestMapping("/admin/writediary")
	public String writediary(Diary diary,RedirectAttributes attributes){
		String dateString = Functions.getNowTime();
		diary.setTime(dateString);
		this.diaryService.writediary(diary);
		attributes.addFlashAttribute("msg", "添加日记成功");
		return "redirect:/admin/admindiary";
	}
	/**
	 * 查询所有心情
	 * @param request
	 * @return
	 */
	@RequestMapping("selectAllDiary")
	public String selectAllDiary(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model){
		try {
			PageHelper.startPage(pn, 10);
			PageHelper.orderBy("diaryid desc");//设置为倒叙
			List<Diary> diarys =  diaryService.selectAllDiary();
			PageInfo page = new PageInfo(diarys);
			model.addAttribute("diarys", page);
			return "saylist";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	/**
	 * 管理员的心情所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/admin/admindiary")
	public String admindiary(
			@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model){
		try {
			PageHelper.startPage(pn, 10);
			PageHelper.orderBy("diaryid desc");//设置为倒叙
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
	 * 删除心情
	 * @param request
	 * @return
	 */
	@RequestMapping("/admin/deleteDiaryById")
	public String deleteDiaryById(HttpServletRequest request,RedirectAttributes attributes){
		try {
			String id = request.getParameter("diaryid");
			int diaryid = Integer.parseInt(id);
			this.diaryService.deleteDiaryById(diaryid);
			attributes.addFlashAttribute("msg", "删除日记成功");
			return "redirect:/admin/admindiary";
		} catch (Exception e) {
			return null;	
		}
	}
}
