package com.kh.activePlus.schedule.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor 
@AllArgsConstructor
public class Schedule {
	private String scd_sq; // 원내 일정, 부서일정, 개인 일정
	private String sId; // 일정구분번호
	private String scd_nm; // 일정명
	private String dpt_nm;	// 사무, 의료
	private String writer;	//직원명
	private String wId;	// 직원 코드
	private String sTitle;			//제목
	private String sContent;		// 일정 내용
	private String start_date;	// 시작일
	private String end_date;	// 종료일
}
