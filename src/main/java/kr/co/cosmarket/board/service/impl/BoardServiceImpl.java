package kr.co.cosmarket.board.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cosmarket.board.service.BoardService;
import kr.co.cosmarket.board.store.BoardStore;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private BoardStore bStore;
}
