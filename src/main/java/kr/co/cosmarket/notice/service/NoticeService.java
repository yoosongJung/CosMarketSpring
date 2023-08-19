package kr.co.cosmarket.notice.service;

import java.util.List;
import java.util.Map;

import kr.co.cosmarket.notice.domain.Notice;
import kr.co.cosmarket.notice.domain.PageInfo;

public interface NoticeService {

	/**
	 * 공지사항 전체 갯수 조회
	 * @return
	 */
	int getListCount();

	int getListCount(Map<String, String> paraMap);
	
	/**
	 * 공지사항 조회 Service
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(PageInfo pInfo);

	/**
	 * 키워드로 공지사항 목록 조회 Service
	 * @param pInfo
	 * @param paraMap
	 * @return
	 */
	List<Notice> searchNoticesByKeyword(PageInfo pInfo, Map<String, String> paraMap);

	/**
	 * 공지사항 상세 조회 Service
	 * @param noticeNo
	 * @return
	 */
	Notice selectOneByNo(int noticeNo);

	/**
	 * 공지사항 삭제 Service
	 * @param noticeNo
	 * @return
	 */
	int deleteNoticeByNo(int noticeNo);

	/**
	 * 공지사항 수정 Service
	 * @param notice
	 * @return
	 */
	int updateNotice(Notice notice);

	/**
	 * 공지사항 등록 Service
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);

}
