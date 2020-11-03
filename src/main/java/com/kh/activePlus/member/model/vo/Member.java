package com.kh.activePlus.member.model.vo;

import java.sql.Date;

import com.kh.activePlus.Employee.model.vo.Employee;

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
public class Member {
   private String id;
   private String pwd;
   private String email;
   private String phone;
   private String name;
   private Date birth;
   private String category;
   private String salary;
   private String acc_no;
   private String address;
   private Date hire_date;
   private String status;
   private String license;
   private String license_no;
   private Date license_date;
   private String originalFileName;
   private String renameFileName;
   /*private int m_no;*/
   
   
   
   
} 