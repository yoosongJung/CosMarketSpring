package kr.co.cosmarket.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cosmarket.notice.domain.Notice;
import kr.co.cosmarket.notice.domain.PageInfo;
import kr.co.cosmarket.notice.service.NoticeService;
import kr.co.cosmarket.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSession session;
	@Autowired
	private NoticeStore nStore;
	
	@Override
	public int getListCount() {
		int result = nStore.selectListCount(session);
		return result;
	}
	
	@Override
	public int getListCount(Map<String, String> paraMap) {
		int result = nStore.selectListCount(session, paraMap);
		return result;
	}
	
	@Override
	public List<Notice> selectNoticeList(PageInfo pInfo) {
		List<Notice> nList = nStore.selectNoticeList(session, pInfo);
		return nList;
	}
	
	@Override
	public List<Notice> searchNoticesByKeyword(PageInfo pInfo, Map<String, String> paraMap) {
		List<Notice> sList = nStore.searchNoticesByKeyword(session,paraMap,pInfo);
		return sList;
	}

	@Override
	public Notice selectOneByNo(int noticeNo) {
		Notice notice = nStore.selectOneByNo(session, noticeNo);
		return notice;
	}

	@Override
	public int deleteNoticeByNo(int noticeNo) {
		int result = nStore.deleteNoticeByNo(session, noticeNo);
		return result;
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = nStore.updateNotice(session, notice);
		return result;
	}

	@Override
	public int insertNotice(Notice notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}
}
