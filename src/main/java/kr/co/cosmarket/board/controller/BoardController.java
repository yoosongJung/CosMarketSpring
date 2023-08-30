package kr.co.cosmarket.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.cosmarket.board.domain.Board;
import kr.co.cosmarket.board.domain.PageInfo;
import kr.co.cosmarket.board.service.BoardService;
import kr.co.cosmarket.notice.domain.Notice;

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
		try {
			Integer totalCount = bService.getFreeBoardListCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<Board> fList = bService.selectFreeBoardList(pInfo);
			if(!fList.isEmpty()) {
				mv.addObject("fList", fList).addObject("pInfo", pInfo).setViewName("member/common/freeBoard");
			} else {
				mv.addObject("msg", "자유게시판 조회가 완료되지 않았습니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("commonDisplay/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "자유게시판 조회가 완료되지 않았습니다.");
			mv.addObject("url", "/index.jsp");
			mv.setViewName("commonDisplay/serviceFailed");
		}

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
	
//	@RequestMapping(value="/board/FreeBoardSearch.do", method=RequestMethod.GET)
//	public ModelAndView searchFreeBoardList(
//			ModelAndView mv,
//			@RequestParam("searchCondition") String searchCondition,
//			@RequestParam("searchKeyword") String searchKeyword,
//			@RequestParam(value="page", required=false,defaultValue="1") Integer currentPage
//			) {
//		Map<String,String> paraMap = new HashMap<String,String>();
//		paraMap.put("searchCondition",searchCondition);
//		paraMap.put("searchKeyword",searchKeyword);
//		int totalCount=bService.getFreeBoardListCount(paraMap);
//		PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
//		List<Notice> searchList = bService.searchFreeBoardByKeyword(pInfo,paraMap);
//		if(!searchList.isEmpty()) {
//			mv.addObject("searchCondition", searchCondition);
//			mv.addObject("searchKeyword", searchKeyword);
//			mv.addObject("pInfo", pInfo);
//			mv.addObject("sList", searchList);
//			mv.setViewName("member/common/freeBoardSearch");
//			return mv;
//		}
//		else {
//			mv.addObject("msg", "검색 조회 실패");
//			mv.addObject("url", "/freeBoard/list.do");
//			mv.setViewName("commonDisplay/serviceFailed");
//			return mv;	
//		}
//	}
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
