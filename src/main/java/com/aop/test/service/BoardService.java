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
		if(board.getRowCount()==0) {
			board.setRowCount(10);
		}
		int offset = (board.getPage()-1) * board.getRowCount();
		board.setOffset(offset);
		return boardMapper.selectBoards(board);
	}
	public int selectBoardsCnt(BoardVO board) {
		double cnt = boardMapper.selectBoardsCnt(board);
		cnt = Math.ceil(cnt/board.getRowCount());
		return (int)cnt;
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
