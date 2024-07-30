package com.travelplanner.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.travelplanner.entity.Admin;


public interface AdminRepository extends CrudRepository<Admin, Integer>{

    @Query("select u from Admin u where u.adminEmail =:adminEmail")
    public Admin  findByAdminEmail(@Param("adminEmail") String adminEmail);

    @Query(value = "select admin_email from admin where admin_id = 1", nativeQuery = true)
    public String getAdminEmail();

    @Query(value = "select admin_password from admin where admin_id = 1", nativeQuery = true)
    public String getAdminPassword();
}
