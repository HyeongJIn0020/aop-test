package com.aop.test.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aop.test.service.BoardService;
import com.aop.test.vo.BoardVO;
import com.aop.test.vo.UserVO;
import com.github.pagehelper.PageInfo;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/boards")
	@ResponseBody
	public Map<String, Object> selectBoards(@ModelAttribute BoardVO board){
		Map<String, Object> res = new HashMap<>();
		res.put("boardList", boardService.selectBoards(board));
		res.put("totalPage", boardService.selectBoardsCnt(board));
		return res;
	}
	@GetMapping("/boards/helper")
	@ResponseBody
	public PageInfo<BoardVO> getBoardListWithHelper(@ModelAttribute BoardVO board){
		return boardService.selectBoardsWithHelper(board);
	}
	
	@GetMapping("/boards/{biNum}")
	@ResponseBody
	public BoardVO selectBoard(@PathVariable("biNum") int biNum) {
		return boardService.selectBoard(biNum);
	}
	
	@PostMapping("/boards")
	@ResponseBody
	public int insertBoard(@RequestBody BoardVO board, HttpSession session) {
		UserVO loginUser = (UserVO) session.getAttribute("user");
		board.setUiNum(loginUser.getUiNum());
		return boardService.insertBoard(board);
	}
	
	@PutMapping("/boards/{biNum}")
	@ResponseBody
	public int updateBoard(@RequestBody BoardVO board, @PathVariable("biNum") int biNum) {
		board.setBiNum(biNum);
		return boardService.updateBoard(board);
	}
	
	@DeleteMapping("/boards/{biNum}")
	@ResponseBody
	public int deleteBoard(@PathVariable("biNum") int biNum) {
		return boardService.deleteBoard(biNum);
	}
}
