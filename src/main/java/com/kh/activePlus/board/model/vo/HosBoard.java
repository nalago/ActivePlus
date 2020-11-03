package com.kh.activePlus.board.model.vo;

import java.util.Date;

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
public class HosBoard {
	private int hbId;
	private String title;
	private String content;
	private int count;
	private String status;
	private Date createDate;
	private Date modifyDate;
	private Date deleteDate;
	private String writer;
	private String writerName;
	
	
}
