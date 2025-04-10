package com.aop.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aop.test.mapper.BoardMapper;
import com.aop.test.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	public List<BoardVO> selectBoards(BoardVO board){
		return boardMapper.selectBoards(board);
	}
	public BoardVO selectBoard(int biNum) {
		return boardMapper.selectBoard(biNum);
	}
	public int insertBoard(BoardVO board) {
		return boardMapper.insertBoard(board);
	}
	public int updateBoard(BoardVO board) {
		return boardMapper.updateBoard(board);
	}
	public int deleteBoard(int biNum) {
		return boardMapper.deleteBoard(biNum);
	}
}
