package kr.co.cosmarket.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cosmarket.board.damain.Board;
import kr.co.cosmarket.board.damain.PageInfo;
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
	public ModelAndView showFreeBoardList(
			@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage,
			ModelAndView mv) {
//		try {
//			Integer totalCount = bService.getListCount();
//			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
//			List<Board> bList = bService.selectBoardList(pInfo);
//			if(!bList.isEmpty()) {
//				mv.addObject("bList", bList).addObject("pInfo", pInfo).setViewName("member/common/freeBoard");
//			} else {
//				mv.addObject("msg", "자유게시판 조회가 완료되지 않았습니다.");
//				mv.addObject("url", "/index.jsp");
//				mv.setViewName("commonDisplay/serviceFailed");
//			}
//		} catch (Exception e) {
//			mv.addObject("msg", "자유게시판 조회가 완료되지 않았습니다.");
//			mv.addObject("url", "/index.jsp");
//			mv.setViewName("commonDisplay/serviceFailed");
//		}

		return mv;
	}
	
	@RequestMapping(value="/freeBoard/detail.do", method=RequestMethod.GET)
	public ModelAndView showFreeBoardDetail(ModelAndView mv) {
		mv.setViewName("member/common/freeBoardDetail");
		return mv;
	}
	
	public PageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		
		naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo pInfo = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);;
		
		return pInfo;
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
