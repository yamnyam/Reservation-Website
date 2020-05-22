package kr.website.search.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.website.foodlist.vo.foodListVO;
import kr.website.search.dao.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Inject
	private SearchDAO dao;
	
	@Override
	public List<foodListVO> list(String search) throws Exception {
		return dao.list(search);
	}

}
