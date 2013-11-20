package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class loginController {
	@Autowired
	private UserRepository userRepository;

	@RequestMapping("/login")
	public String form() {
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		System.out.println("logout started...");
		return "redirect:/";
	}

	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}

	@RequestMapping(value = "/login_check", method = RequestMethod.POST)
	public String login(String email, String password, HttpSession session) {
		// TODO userId에 해당하는 사용를 데이터베이스에서 조회
		User foundUser = userRepository.findOne(email);
		// TODO 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 사용자 비밀번호가 같은지 확인
		if(password.equals(foundUser.getPassword())){
			session.setAttribute("userId", email);
			return "redirect:/board/list";	
		}
		else {
			System.out.println("again! plz~");
			return "redirect:/user/login";
		}
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String signUp(User user){
		userRepository.save(user);
		return "redirect:/user/login";
	}

}
