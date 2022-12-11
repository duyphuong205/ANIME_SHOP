package com.anime.jpa.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.anime.jpa.entity.Shipper;

@Repository
public interface ShipperRepo extends JpaRepository<Shipper, Long> {

}
