package kr.co.cosmarket.board.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cosmarket.board.domain.Board;
import kr.co.cosmarket.board.domain.PageInfo;
import kr.co.cosmarket.board.service.BoardService;
import kr.co.cosmarket.board.store.BoardStore;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private BoardStore bStore;
	@Override
	public Integer getFreeBoardListCount() {
		int result = bStore.getFreeBoardListCount(sqlSession);
		return result;
	}
	@Override
	public List<Board> selectFreeBoardList(PageInfo pInfo) {
		List<Board> fList = bStore.selectFreeBoardList(sqlSession, pInfo);
		return fList;
	}
	@Override
	public int getFreeBoardListCount(Map<String, String> paraMap) {
		int result = bStore.getFreeBoardListCount(sqlSession, paraMap);
		return result;
	}
}
