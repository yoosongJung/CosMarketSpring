package kr.co.cosmarket.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.cosmarket.notice.domain.Notice;
import kr.co.cosmarket.notice.domain.PageInfo;
import kr.co.cosmarket.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping(value="/notice/list.do", method=RequestMethod.GET)
	public String showNoticeList(
			@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage,
			Model model) {
		try {
			int totalCount = service.getListCount();
			PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
			List<Notice> nList = service.selectNoticeList(pInfo);
			if(nList.size() > 0) {
				model.addAttribute("pInfo", pInfo);
				model.addAttribute("nList",nList);
				return "member/common/notice";
			} else {
				model.addAttribute("msg", "공지사항 조회 실패");
				return "commonDisplay/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
	
	public PageInfo getPageInfo(int totalCount,int currentPage) {
		PageInfo page =null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		naviTotalCount =(int)((double)totalCount/recordCountPerPage + 0.9);
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage+1;
		endNavi = startNavi + naviCountPerPage - 1;
		//endNavi는 startNavi에 무조건 naviCountPerPage에 값을 더하므로 실제 최대값 보다 무조건 클 수 있다.
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		page = new PageInfo(currentPage, recordCountPerPage, naviCountPerPage, startNavi, endNavi, totalCount, naviTotalCount);
				
		return page;
	}
	
	@RequestMapping(value="/notice/search.do", method=RequestMethod.GET)
	public String searchNoticeList(
			@RequestParam("searchCondition") String searchCondition,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value="currentPage", required=false,defaultValue="1") Integer currentPage
			,Model model) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("searchCondition",searchCondition);
		paraMap.put("searchKeyword",searchKeyword);
		int totalCount=service.getListCount(paraMap);
		PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
		List<Notice> searchList = service.searchNoticesByKeyword(pInfo,paraMap);
		if(!searchList.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchKeyword",searchKeyword);
			model.addAttribute("pInfo",pInfo);
			model.addAttribute("sList",searchList);
			return "member/common/noticeSearch";
		}
		else {
			model.addAttribute("msg", "검색 조회 실패");
			model.addAttribute("url","/notice/list.do");
			return "commonDisplay/serviceFailed";	
		}
	}
	
	@RequestMapping(value="/notice/detail.do", method=RequestMethod.GET)
	public String showNoticeDetail(
			@RequestParam("noticeNo") int noticeNo,
			Model model) {
		try {
			Notice notice = service.selectOneByNo(noticeNo);
			if(notice != null) {
				model.addAttribute("notice", notice);
				return "member/common/noticeDetail";	
			} else {
				model.addAttribute("msg", "공지 상세 조회 실패");
				model.addAttribute("url","/notice/list.do");
				return "commonDisplay/serviceFailed";	
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
	
	@RequestMapping(value="/notice/delete.do", method=RequestMethod.GET)
	public String deleteNotice(
			@RequestParam("noticeNo") int noticeNo,
			@RequestParam("noticeFilename") String noticeFilename,
			HttpServletRequest request,
			Model model) {
		try {
			if(noticeFilename != "") {
				deleteFile(request, noticeFilename);
			}
			int result = service.deleteNoticeByNo(noticeNo);
			if(result > 0) {
				return "redirect:/notice/list.do";
			} else {
				model.addAttribute("msg", "공지 상세 삭제 실패");
				model.addAttribute("url","/notice/detail.do?noticeNo="+noticeNo);
				return "commonDisplay/serviceFailed";	
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
	
	@RequestMapping(value="/notice/modify.do", method=RequestMethod.GET)
	public String showModifyNoticeForm(
			@RequestParam("noticeNo") int noticeNo,
			Model model) {
		try {
			Notice notice = service.selectOneByNo(noticeNo);
			if(notice != null) {
				model.addAttribute("notice", notice);
				return "member/common/noticeModify";	
			} else {
				model.addAttribute("msg", "공지수정 페이지 접속 실패");
				model.addAttribute("url","/notice/detail.do?noticeNo="+noticeNo);
				return "commonDisplay/serviceFailed";	
			}			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
	
	@RequestMapping(value="/notice/modify.do", method=RequestMethod.POST)
	public String updateNotice(
			@ModelAttribute Notice notice,
			@RequestParam(value="uploadFile",required=false) MultipartFile uploadFile,
			HttpServletRequest request,
			Model model) {
		try {
			if(uploadFile != null && !uploadFile.isEmpty()) {
				// 기존 업로드된 파일 존재 여부 체크
				String filename = notice.getNoticeFilename();
				if(filename != null) {
					// 있으면 기존 파일 삭제
					this.deleteFile(request, filename);
				}
				// 없으면 새로 업로드 하려는 파일 저장
				Map<String, Object> infoMap = this.saveFile(uploadFile, request);
				notice.setNoticeFilename((String)infoMap.get("filename"));
				notice.setNoticeFilepath((String)infoMap.get("filepath"));
				notice.setNoticeFilelength((long)infoMap.get("filelength"));
				
			} 
//			else {
//				notice.setNoticeFilename("");
//				notice.setNoticeFilepath("");
//				notice.setNoticeFilelength(0);
//			}
			int result = service.updateNotice(notice);
			if(result > 0) {
				model.addAttribute("msg", "공지 수정 완료");
//				model.addAttribute("url","/notice/detail.do?noticeNo="+notice.getNoticeNo());
				model.addAttribute("url","javascript:history.go(-3)");
				return "commonDisplay/serviceSuccess";
			} else {
				model.addAttribute("msg", "공지 수정 실패");
				model.addAttribute("url","/notice/modify.do?noticeNo="+notice.getNoticeNo());
				return "commonDisplay/serviceFailed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
	
	@RequestMapping(value="/notice/insert.do",method=RequestMethod.GET)
	public String showInsertNoticeForm() {
		return "member/common/noticeInsert";
	}
	
	@RequestMapping(value="/notice/insert.do",method=RequestMethod.POST)
	public String insetNotice(@ModelAttribute Notice notice,
			@RequestParam(value="uploadFile",required=false) MultipartFile uploadFile,
			HttpServletRequest request,
			Model model) {
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				Map<String, Object> nMap = this.saveFile(uploadFile, request);
				String fileName = (String)nMap.get("fileName");
				String savePath = (String)nMap.get("filePath");
				long fileLength = (long)nMap.get("fileLength");
				
				notice.setNoticeFilename(fileName);
				notice.setNoticeFilepath(savePath);
				notice.setNoticeFilelength(fileLength);
			} 
			else {
				notice.setNoticeFilename("");
				notice.setNoticeFilepath("");
			}
			int result = service.insertNotice(notice);
			if(result > 0) {
				return "redirect:/notice/list.do";
			}
			else {
				model.addAttribute("msg", "공지사항 등록이 실패 하였습니다.");
				model.addAttribute("url","/notice/insert.do");
				return "commonDisplay/serviceFailed";
			}			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "commonDisplay/serviceFailed";
		}
	}
	
	public Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception {
		Map<String, Object> infoMap = new HashMap<String, Object>();
		// 파일 이름
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String strResult = sdf.format(new Date(System.currentTimeMillis()));
		String originFilename = uploadFile.getOriginalFilename();
		String ext = originFilename.substring(originFilename.lastIndexOf(".")+1);
		String originPurename = uploadFile.getOriginalFilename().replace("." + ext, "");
		
		String filename = originPurename + "_" + strResult + "." + ext;
		// (내가 저장한 후 그 경로를 DB에 저장하도록 준비하는 것)
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 폴더가 없을 경우 자동 생성(업로드한 파일을 저장할 폴더)
		String saveFolder = root + "\\nuploadFiles";
		File folder = new File(saveFolder);
		if(!folder.exists()) {
			folder.mkdir();
		}
		// 파일 경로
//		Random rand = new Random();
//		String strResult = "N";
//		for(int i = 0; i < 7; i++) {
//			int result = rand.nextInt(20)+1;
//			strResult += result + "";
//		}
		
		String savepath = saveFolder + "\\" + filename;
		File file = new File(savepath);
		// 파일 저장
		uploadFile.transferTo(file);
		// 파일 크기
		long filelength = uploadFile.getSize();
		infoMap.put("filename", filename);
		infoMap.put("filepath", savepath);
		infoMap.put("filelength", filelength);
		
		return infoMap;
	}
	
	private void deleteFile(HttpServletRequest request, String filename) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delFilepath = root + "\\nuploadFiles\\" + filename;
		File file = new File(delFilepath);
		if(file.exists()) {
			file.delete();
		}
	}
}
