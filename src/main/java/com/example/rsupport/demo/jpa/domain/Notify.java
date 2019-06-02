package com.example.rsupport.demo.jpa.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString
@Getter
@Entity
public class Notify {
	
	 @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
   // @GeneratedValue(strategy = GenerationType.AUTO)
	 private Long id;

	 @Column(length = 100, nullable = false)
	 private String title;

	 @Column(length = 50, nullable = false)
	 private String name;
	 
	 @Column(length = 512, nullable = false)
	 private String content;
	 
	 @Column(length = 10, nullable = false)
	 private String regDate;
	 
	 @Column(length = 10, nullable = false)
	 private String modifyDate;


	 @Builder
	 public Notify(String title,String name ,String content,String regDate,String modifyDate) {
		 this.title = title;
		 this.name = name;
		 this.content = content;
		 this.regDate = regDate;
		 this.modifyDate = modifyDate;		 
	 }
	 

	    public void update(String title,String name ,String content,String modifyDate) {
			 this.title = title;
			 this.name = name;
			 this.content = content;
			 this.modifyDate = modifyDate;		 
	    }


}
