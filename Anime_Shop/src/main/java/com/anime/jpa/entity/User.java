package com.anime.jpa.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.anime.constants.ActiveConstant;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
public class User extends Base implements Serializable {

	private static final long serialVersionUID = -6076752328010130022L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(name = "username")
	private String username;

	@Column(name = "fullname")
	private String fullname;

	@Column(name = "email")
	private String email;

	@Column(name = "avatar")
	private String avatar;

	@Column(name = "gender")
	private Boolean gender;

	@Column(name = "password")
	private String password;

	@Column(name = "isActive")
	private Boolean isActive = ActiveConstant.ENABLE;

	@JsonIgnore
	@OneToMany(mappedBy = "user")
	private List<UserRole> userRoles;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user")
	private List<Review> reviews;

	@JsonIgnore
	@OneToMany(mappedBy = "user")
	private List<Order> orders;
}
