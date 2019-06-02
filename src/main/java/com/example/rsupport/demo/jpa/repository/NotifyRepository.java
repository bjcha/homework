package com.example.rsupport.demo.jpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.example.rsupport.demo.jpa.domain.Notify;

@Repository
public interface NotifyRepository extends JpaRepository<Notify, Long>, JpaSpecificationExecutor<Notify> {

}

