package com.kh.activePlus.common.SE2.model.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SmartEditor2 {
	private MultipartFile filedata;
	private String callback;
	private String callback_func;

}
