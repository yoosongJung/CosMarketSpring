package kr.co.cosmarket.notice.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.cosmarket.notice.domain.Notice;
import kr.co.cosmarket.notice.domain.PageInfo;
import kr.co.cosmarket.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore{

	@Override
	public int selectListCount(SqlSession session) {
		int result =session.selectOne("NoticeMapper.selectListCount");
		return result;
	}

	@Override
	public int selectListCount(SqlSession session, Map<String, String> paraMap) {
		int result =session.selectOne("NoticeMapper.selectListCount", paraMap);
		return result;
	}
	
	@Override
	public List<Notice> selectNoticeList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Notice>nList = session.selectList("NoticeMapper.selectNoticeList", null, rowBounds);
		return nList;
	}

	@Override
	public List<Notice> searchNoticesByKeyword(SqlSession session, Map<String, String> paraMap, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		List<Notice> sList = session.selectList("NoticeMapper.selectNoticeListByKeyword",paraMap,rowBounds);
		
		return sList;
	}

	@Override
	public Notice selectOneByNo(SqlSession session, int noticeNo) {
		Notice notice = session.selectOne("NoticeMapper.selectOneByNo", noticeNo);
		return notice;
	}

	@Override
	public int deleteNoticeByNo(SqlSession session, int noticeNo) {
		int result = session.delete("NoticeMapper.deleteNoticeByNo", noticeNo);
		return result;
	}

	@Override
	public int updateNotice(SqlSession session, Notice notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public int insertNotice(SqlSession session, Notice notice) {
		System.out.println("@@@@@@@@@@@@@@@@@"+notice.toString());
		System.out.println("@@@@@@@@@@@@@@@@@"+notice.getNoticeWriter());
		System.out.println("@@@@@@@@@@@@@@@@@"+notice.getNoticeFilename());
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

}
