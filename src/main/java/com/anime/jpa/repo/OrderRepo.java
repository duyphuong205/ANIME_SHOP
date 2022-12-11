package com.anime.jpa.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.anime.jpa.entity.Order;

@Repository
public interface OrderRepo extends JpaRepository<Order, Long> {
}
