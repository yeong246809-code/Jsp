package kr.co.jboard.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import kr.co.jboard.dao.FileDAO;
import kr.co.jboard.dto.FileDTO;

public enum FileService {

	// 열거 상수 객체(싱글톤)
	INSTANCE;
	
	// DAO 가져오기
	private FileDAO dao = FileDAO.getInstance();
	
	//파일 업로드
	public List<FileDTO> upload(HttpServletRequest req) {
		//반환용 파일 리스트생성
		List<FileDTO> dtolist = new ArrayList<>();
		//파일 업로드 디렉터리 경로 구하기
		ServletContext ctx = req.getServletContext();
		String uploadpath = ctx.getRealPath("/upload");
		
		System.out.println(uploadpath);
	
		
		//해당 디렉터리가 존재하기 않으면 신규생성
		File uploadDir = new File(uploadpath);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		try {
			//첨부파일 객체 구하기
			Collection<Part> parts = req.getParts();
			
			for(Part part : parts) {
				//원본 파일명 구하기
				String ofname = part.getSubmittedFileName();
				System.out.println("ofname : "+ofname);
				
				if(ofname != null && !ofname.isEmpty()) {
					//저장 파일명 구하기
					int idx = ofname.lastIndexOf(".");
					String ext = ofname.substring(idx);
					String sfname = UUID.randomUUID().toString() + ext;
					System.out.println("sfname : "+sfname);
					
					//파일 저장
					part.write(uploadpath + File.separator + sfname);			
					
					//반환용 filedto 생성 및 리스트 저장
					FileDTO filedto = new FileDTO();
					filedto.setOfname(ofname);
					filedto.setSfname(sfname);
					dtolist.add(filedto);
					
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtolist;
		
	}
	//파일 다운로드
	public void download() {}
	// DAO 호출 서비스 메서드
	public void register(FileDTO dto) {
		dao.insert(dto);
	}
	
	public FileDTO findById(String ano) {
		return dao.select(ano);
	}
	
	public List<FileDTO> findAll() {
		return dao.selectAll();
	}
	
	public void modify(FileDTO dto) {
		dao.update(dto);
	}
	
	public void remove(String ano) {
		dao.delete(ano);
	}
}
