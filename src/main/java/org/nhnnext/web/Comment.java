package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(length = 5000, nullable = false)
	private String contents;
	
	@ManyToOne
	private Board board;

	public Comment(){
	}
	
	public Comment( Board board, String contents){
		this.contents = contents;
		this.board = board;	
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getId() {
		return id;
	}
	
	public String getContents() {
		return contents;
	}
}
