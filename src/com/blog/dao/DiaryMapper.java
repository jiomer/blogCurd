package com.blog.dao;

import java.util.List;

import com.blog.model.Diary;


public interface DiaryMapper {
	//写日记
	void writediary(Diary diary);
	//查找全部日记
	List<Diary> selectAllDiary();
	//删除
	void deleteDiaryById(int diaryid);
}
