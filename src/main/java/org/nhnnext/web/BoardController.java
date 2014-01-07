	package org.nhnnext.web;

import java.util.List;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.nhnnext.support.FileUploader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;

	@RequestMapping("/form")
	public String form() {
		return "form";
	}
	
	 @RequestMapping(value ="/wri")
     public String writing(){
             return "write";
     }
	// 글쓰기 요청하는 곳
	@RequestMapping(value ="/write", method = RequestMethod.POST)
	public String write(Board board, MultipartFile file) {
		String filename = FileUploader.upload(file);
		System.out.println(filename);
		if (filename != null)
			board.setFilename(filename);

		boardRepository.save(board);
//		return "redirect:/board/" + savedBoard.getId();
		return "redirect:/board/list/";
	}
	
//	@RequestMapping(value ="/board/add.json", method = RequestMethod.POST)
//	public @ResponseBody Board createAndShow(Board board, MultipartFile file) {
//		String filename = FileUploader.upload(file);
//		board.setFilename(filename);
//		Board savedBoard = boardRepository.save(board);
//		return savedBoard;
////		return "redirect:/list";
//	}
	
	@RequestMapping("/list")
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
//		if (board == null) {// No Document
//			return "redirect:/board/list";
//		}
		model.addAttribute("board", board);
//		model.addAttribute("modify", 1);
		return "form";
	}

	@RequestMapping("/{id}/delete")
	public String delete(@PathVariable Long id, Model model) {
		 Board findedBoard = boardRepository.findOne(id);
         List<Comment> commentList= findedBoard.getComments();
         if(commentList != null){
                 for(Comment comment : commentList) {
                         commentRepository.delete(comment);
                 }
         }
         findedBoard.getComments().clear();
         boardRepository.delete(findedBoard);

         return "redirect:/board/list"; 
 }
}
