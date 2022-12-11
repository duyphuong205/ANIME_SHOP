package com.anime.jpa.repo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.anime.jpa.entity.CategoryParent;

@Repository
public interface CategoryParentRepo extends JpaRepository<CategoryParent, Long> {

	List<CategoryParent> findByIsActive(Boolean isActive);

	Page<CategoryParent> findByIsActive(Boolean isActive, Pageable pageable);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE CategoryParent cp SET cp.isActive = ?1 WHERE cp.id = ?2")
	void deleteLogical(Boolean isActive, Long id);
}
