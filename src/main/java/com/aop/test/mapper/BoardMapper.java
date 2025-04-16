package com.aop.test.mapper;

import java.util.List;

import com.aop.test.vo.BoardVO;

public interface BoardMapper {
	List<BoardVO> selectBoards(BoardVO board);
	List<BoardVO> selectBoardsWithHelper(BoardVO board);
	int selectBoardsCnt(BoardVO board);
	BoardVO selectBoard(int biNum);
	int insertBoard(BoardVO board);
	int updateBoard(BoardVO board);
	int deleteBoard(int biNum);
}
