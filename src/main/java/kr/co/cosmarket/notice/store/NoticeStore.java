package kr.co.cosmarket.notice.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.cosmarket.notice.domain.Notice;
import kr.co.cosmarket.notice.domain.PageInfo;

public interface NoticeStore {

	/**
	 * 공지사항 전체 갯수 조회
	 * @param session
	 * @return
	 */
	int selectListCount(SqlSession session);
	
	int selectListCount(SqlSession session, Map<String, String> paraMap);

	/**
	 * 공지사항 조회 Store
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(SqlSession session, PageInfo pInfo);

	/**
	 * 공지사항 키워드로 조회 Store
	 * @param session
	 * @param paraMap
	 * @param pInfo
	 * @return
	 */
	List<Notice> searchNoticesByKeyword(SqlSession session, Map<String, String> paraMap, PageInfo pInfo);

	/**
	 * 공지사항 상세 조회 Store
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	Notice selectOneByNo(SqlSession session, int noticeNo);

	/**
	 * 공지사항 삭제 Store
	 * @param session
	 * @param noticeNo
	 * @return
	 */
	int deleteNoticeByNo(SqlSession session, int noticeNo);

	/**
	 * 공지사항 수정 Store
	 * @param session
	 * @param notice
	 * @return
	 */
	int updateNotice(SqlSession session, Notice notice);

	/**
	 * 공지사항 등록 Store
	 * @param session
	 * @param notice
	 * @return
	 */
	int insertNotice(SqlSession session, Notice notice);


}
