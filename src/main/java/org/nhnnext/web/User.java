package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@Column(length = 100, nullable = false)
	private String email;
	
	@Column(length = 12, nullable = false)
	private String password;
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	
	public boolean matchPassword(String pw){
		return password.equals(pw);
		
	}
	
}
