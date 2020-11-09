package com.kh.activePlus.item.model.vo;



import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Item {
	private int i_no;
	private String i_id;
	private String i_name_k;
	private int price;
	private String standard;
	private String unit;
	private String material;
	private String perpose;
	private String production;
	private String contract_date;
	private String stock;
	private String replacement;
	private String category;
	private String category_e;
	private String category_k;
	private String regist_date;
	private String note;
	private String status;
	private String location;
	private String emp_id;
	private int i_div;
	private String i_div_name;
	private String writer;
	//--------병원관련-----------
	private String insurance;
	private String m_control;
	private String kpic;
	private String add_m;
	private String atc_code;
	//---------검색/페이지 관련---------
	private int StartCount;
	private int endCount;
	private int search_condition;
	private String keyword;
	private String page;
	//---------파일 관련--------------
	
}
