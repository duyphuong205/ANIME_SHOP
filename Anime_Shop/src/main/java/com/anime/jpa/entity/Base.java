package com.anime.jpa.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
@SuppressWarnings("unused")
public class Base {

	@CreatedBy
	@Column(name = "createdBy")
	private String createdBy;

	@LastModifiedBy
	@Column(name = "updatedBy")
	private String updatedBy;

	@CreationTimestamp
	@Column(name = "createDate", updatable = false, insertable = true)
	private Timestamp createDate;

	@UpdateTimestamp
	@Column(name = "updateDate", insertable = false, updatable = true)
	private Timestamp updateDate;
}
