package com.example.rsupport.demo.jpa.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *  /list 공고 조회 검색
 *  /write 공고 작성
 *  /delete 공고삭제
 *  /modify 공고수정
 */

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.rsupport.demo.jpa.domain.Notify;
import com.example.rsupport.demo.jpa.repository.NotifyRepository;
import com.example.rsupport.demo.jpa.specification.NotifySpecification;
import com.example.rsupport.demo.jpa.specification.SearchCriteria;

@Controller
public class NotifycationController {
	
	@Autowired
	NotifyRepository notifyRepository;
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/list")
	public @ResponseBody Object home(HttpServletRequest request, HttpServletResponse response) {
		NotifySpecification spec;
		
		
		Date today = new Date();
        
        SimpleDateFormat format;
         
        format = new SimpleDateFormat("yyyy-MM-dd");
 

		String value = request.getParameter("value");
		String date1 = request.getParameter("date1");
		String select = request.getParameter("select");
		String writeTitle = request.getParameter("writeTitle");
		String writeName = request.getParameter("writeName");
		String content = request.getParameter("content");
		String useValue;
		
		if(select.equals("regDate") || select.equals("modifyDate")){
			useValue = date1;
		}else{
			useValue = value;
		}
		String hiddenValue = request.getParameter("hiddenValue");
		String hiddenPath = request.getParameter("hiddenPath");
		Long l;
		Notify notify;
		if(hiddenValue == null || hiddenValue.equals("")){
			hiddenValue = "0";
	//	 	notifyRepository.deleteById(l);
		}
		l = Long.parseLong(hiddenValue);
	
		if(hiddenPath.equals("delete")){
			notifyRepository.deleteById(l);
		}else if(hiddenPath.equals("modify")){
			notify = notifyRepository.findById(l).orElse(null);
			notify.update(writeTitle,writeName,content,format.format(today).toString());
			notifyRepository.save(notify);
		}else if(hiddenPath.equals("write")){
			notify = Notify.builder().title(writeTitle).name(writeTitle).content(content).regDate(format.format(today).toString()).modifyDate("").build();
			notifyRepository.save(notify);
		}
		
		spec = new NotifySpecification(new SearchCriteria(select, ":", useValue));
		
		List<Notify> resultList;	
		if(useValue == null || useValue.equals("")){	
			resultList = notifyRepository.findAll();
		}else{
			resultList = notifyRepository.findAll(spec);	
		}
		
		HashMap<String, Object> mp = new HashMap<String, Object>();
		mp.put("data", resultList);
		Object result = mp;
		return result;
	}
	
	@RequestMapping(value = "/delete")
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("aaa");
	}

}
