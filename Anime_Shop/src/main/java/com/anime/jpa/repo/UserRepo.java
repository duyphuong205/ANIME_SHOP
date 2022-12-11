package com.anime.jpa.repo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.anime.jpa.entity.User;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {

	List<User> findByIsActive(Boolean isActive);

	Page<User> findByIsActive(Boolean isActive, Pageable pageable);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE User u SET u.isActive = ?1 WHERE u.id = ?2")
	void deleteLogical(Boolean isActive, Long id);

}
