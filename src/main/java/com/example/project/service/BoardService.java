package com.example.project.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.dto.BoardVO;

public interface BoardService {
	
	//1. �ۼ�
	public void create(BoardVO vo);
	
	//2. �� ����
	public BoardVO read(int bno);
	
	//3. ����
	public void update(BoardVO vo);
	
	//4. ����
	public void delete(int bno);
	
	//5. ��ü ���
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword);
	
	
	//6. ��ȸ��
	public void increaseViewcnt(int bno, HttpSession session);
	
	// 07. �Խñ� ���ڵ� ���� �޼��� �߰�
	public int countArticle(String searchOption, String keyword);

}
