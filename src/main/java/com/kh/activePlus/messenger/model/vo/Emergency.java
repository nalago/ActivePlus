package com.kh.activePlus.messenger.model.vo;

import java.util.Date;

import com.kh.activePlus.mail.model.vo.Email;

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
public class Emergency {
	private int eid;
	private String code;
	private String location;
	private Date day;
	private String writer;
	private String status;
}
