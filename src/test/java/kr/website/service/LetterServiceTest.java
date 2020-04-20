package kr.website.service;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.website.service.LetterService;
import kr.website.vo.LetterVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class LetterServiceTest {
	@Inject
	private LetterService bs;
	
	private static Logger logger = LoggerFactory.getLogger(LetterServiceTest.class);
	
	@Test
	public void testRegist() throws Exception {
		LetterVO vo = new LetterVO();
		vo.setLet_title("새로운 글의 제목입니다");
		vo.setLet_content("글 내용입니다..글 내용입니다. 내용이에요.");
		vo.setLet_image("이미지 파일입니다.");
		bs.regist(vo);
	}
	
	@Test
	public void testRead() throws Exception {
		logger.info(bs.read(2).toString());
	}
	
	@Test
	public void testGetList() throws Exception {
		List<LetterVO> voList = new ArrayList<LetterVO>();
		voList = bs.listAll();
		
		for(LetterVO vo : voList){
			logger.info(vo.toString());
		}
	}
	
	@Test
	public void testModify() throws Exception {
		LetterVO vo = new LetterVO();
		vo.setLet_no(2);
		vo.setLet_title("수정된 제목입니다");
		vo.setLet_content("수정된 내용입니다. 이 내용은 수정되었습니다");
		bs.modify(vo);
	}
	
	@Test
	public void testDelete() throws Exception {
		bs.remove(2);
	}
	
}
