package com.kh.activePlus.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Notice {

	private int noticeId;
	private String category;
	private String title;
	private String content;
	private int count;
	private String status;
	private Date createDate;
	private Date modifyDate;
	private Date deleteDate;
	private String writer;
	private int attachment;
	private String writerName;
}
