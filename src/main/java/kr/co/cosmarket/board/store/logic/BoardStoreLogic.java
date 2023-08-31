package kr.co.cosmarket.board.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.cosmarket.board.domain.Board;
import kr.co.cosmarket.board.domain.PageInfo;
import kr.co.cosmarket.board.store.BoardStore;

@Repository
public class BoardStoreLogic implements BoardStore{

	@Override
	public int getFreeBoardListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("BoardMapper.getFreeBoardListCount");
		return result;
	}

	@Override
	public List<Board> selectFreeBoardList(SqlSession sqlSession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Board> fList = sqlSession.selectList("BoardMapper.selectFreeBoardList", null, rowBounds);
		return fList;
	}

	@Override
	public int getFreeBoardListCount(SqlSession sqlSession, Map<String, String> paraMap) {
		int result = sqlSession.selectOne("BoardMapper.getFreeBoardListCount", paraMap);
		return result;
	}

	@Override
	public List<Board> searchFreeBoardByKeyword(SqlSession sqlSession, PageInfo pInfo, Map<String, String> paraMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<Board> sList = sqlSession.selectList("BoardMapper.searchFreeBoardByKeyword", paraMap, rowBounds);
		return sList;
	}

}
