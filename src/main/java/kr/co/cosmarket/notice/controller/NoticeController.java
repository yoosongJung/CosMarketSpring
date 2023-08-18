package kr.co.cosmarket.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.cosmarket.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
}
