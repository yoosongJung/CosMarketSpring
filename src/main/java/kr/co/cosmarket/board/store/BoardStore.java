package kr.co.cosmarket.board.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.cosmarket.board.domain.Board;
import kr.co.cosmarket.board.domain.PageInfo;

public interface BoardStore {

	/**
	 * 자유게시판 전체 갯수 Store
	 * @param sqlSession
	 * @return
	 */
	int getFreeBoardListCount(SqlSession sqlSession);

	/**
	 * 자유게시판 전체 리스트 Store
	 * @param sqlSession
	 * @param pInfo
	 * @return
	 */
	List<Board> selectFreeBoardList(SqlSession sqlSession, PageInfo pInfo);

	/**
	 * 자유게시판 검색 리스트 갯수 Store
	 * @param sqlSession
	 * @param paraMap
	 * @return
	 */
	int getFreeBoardListCount(SqlSession sqlSession, Map<String, String> paraMap);

}
