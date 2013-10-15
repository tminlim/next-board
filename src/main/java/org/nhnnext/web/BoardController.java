package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardRepository boardRepository;

	@RequestMapping("/form")
	public String form() {
		return "form";
	}

	// 글쓰기 요청하는 곳
	// http://localhost:8080/board/write
	@RequestMapping(value = "/write_ok", method = RequestMethod.POST)
	public String create(Board board, MultipartFile file) {
		String filename = FileUploader.upload(file);
		if (filename != null)
			board.setFilename(filename);

		Board savedBoard = boardRepository.save(board);
		return "redirect:/board/" + savedBoard.getId();
	}
	
	@RequestMapping("")
	public String list(Model model) {
		Iterable<Board> iterable = boardRepository.findAll();
		model.addAttribute("list", iterable);
		return "list";
	}
	@RequestMapping("/{id}")
	public String show(@PathVariable Long id, Model model) {

		Board board = boardRepository.findOne(id); // 저장된 DB에서 id를 찾아, board에
													// 매핑한다
		model.addAttribute("board", board); // model페이지에 board의 변수를 추가한다

		return "show";
	}

	@RequestMapping("/{id}/modify")
	public String modify(@PathVariable Long id, Model model) {
		Board board = boardRepository.findOne(id);
		if (board == null) {// No Document
			return "redirect:/board";
		}
		model.addAttribute("board", board);
		model.addAttribute("modify", 1);
		return "form";
	}

	@RequestMapping("/{id}/delete")
	public String delete(@PathVariable Long id) {
		boardRepository.delete(id);
		return "redirect:/board";
	}
}
