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
public class EmailReceive {
	private int mailId;
	private String mrCategory;
	private String readValue;
	private Date readDate;
	private String receiver;
	private String rvName;
	private String mrStatus;
	private String rIptMark;
	private String receiveMail;
}
