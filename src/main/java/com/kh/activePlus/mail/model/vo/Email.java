package com.kh.activePlus.mail.model.vo;


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
@ToString
public class Email {
	private int mailId;
	private String category;
	private String title;
	private String content;
	private String writer;
	private String mwName;
	private String status;
	private String iptMark;
	private Date sendDate;
	private int attStock;
	private Date deleteDate;
	/*receive*/
	private String mrCategory;
	private String readValue;
	private Date readDate;
	private String receiver;
	private String mrName;
	private String mrStatus;
	private String riptMark;
	private int mrId;
	
}
