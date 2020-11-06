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
@EqualsAndHashCode
@ToString
public class Email extends EmailReceive{
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
	
}
