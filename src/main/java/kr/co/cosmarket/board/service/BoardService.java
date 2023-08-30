package kr.co.cosmarket.board.service;

import java.util.List;
import java.util.Map;

import kr.co.cosmarket.board.domain.Board;
import kr.co.cosmarket.board.domain.PageInfo;

public interface BoardService {

	/**
	 * 자유게시판 전체 갯수 Service
	 * @return
	 */
	Integer getFreeBoardListCount();

	/**
	 * 자유게시판 전체 리스트 Service
	 * @param pInfo
	 * @return
	 */
	List<Board> selectFreeBoardList(PageInfo pInfo);

	/**
	 * 자유게시판 검색 리스트 갯수 Service
	 * @param paraMap
	 * @return
	 */
	int getFreeBoardListCount(Map<String, String> paraMap);

}
