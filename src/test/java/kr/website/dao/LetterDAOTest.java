package kr.website.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.website.vo.LetterVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class LetterDAOTest {
	@Inject
	private LetterDAO dao;
	
	private static Logger logger = LoggerFactory.getLogger(LetterDAOTest.class);
	
	@Test
	public void testCreate() throws Exception {
		LetterVO vo = new LetterVO();
		vo.setLet_title("새로운 글의 제목입니다");
		vo.setLet_content("글 내용입니다..글 내용입니다. 내용이에요.");
		vo.setLet_image("이미지 파일입니다.");
		dao.create(vo);
	}
	
	@Test
	public void testRead() throws Exception {
		logger.info(dao.read(1).toString());
	}
	
	@Test
	public void testGetList() throws Exception {
		List<LetterVO> voList = new ArrayList<LetterVO>();
		voList = dao.listAll();
		
		for(LetterVO vo : voList){
			logger.info(vo.toString());
		}
	}
	
	@Test
	public void testUpdate() throws Exception {
		LetterVO vo = new LetterVO();
		vo.setLet_no(1);
		vo.setLet_title("수정된 제목입니다");
		vo.setLet_content("수정된 내용입니다. 이 내용은 수정되었습니다");
		dao.update(vo);
	}
	
	@Test
	public void testDelete() throws Exception {
		dao.delete(1);
	}
}
