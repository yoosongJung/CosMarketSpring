package kr.co.cosmarket.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cosmarket.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping(value="/board/insert.do", method=RequestMethod.GET)
	public ModelAndView showBoardInsertForm(ModelAndView mv) {
		mv.setViewName("member/common/boardInsert");
		return mv;
	}
	
	@RequestMapping(value="/freeBoard/list.do", method=RequestMethod.GET)
	public ModelAndView showFreeBoardList(ModelAndView mv) {
		mv.setViewName("member/common/freeBoard");
		return mv;
	}
	
	@RequestMapping(value="/freeBoard/detail.do", method=RequestMethod.GET)
	public ModelAndView showFreeBoardDetail(ModelAndView mv) {
		mv.setViewName("member/common/freeBoardDetail");
		return mv;
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	@RequestMapping(value="/QandA/list.do", method=RequestMethod.GET)
	public ModelAndView showQandAList(ModelAndView mv) {
		mv.setViewName("member/common/QandA");
		return mv;
	}
	
	@RequestMapping(value="/QandA/detail.do", method=RequestMethod.GET)
	public ModelAndView showQandADetail(ModelAndView mv) {
		mv.setViewName("member/common/QandADetail");
		return mv;
	}
}
