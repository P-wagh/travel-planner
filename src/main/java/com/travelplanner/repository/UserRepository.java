package com.travelplanner.repository;

import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.travelplanner.entity.User;
// import java.util.List;


@Repository
public interface UserRepository extends CrudRepository<User, Integer> {

   @Query("select u from User u where u.user_email =:n and u.user_password =:c")
   public User findByuser_emailAnduser_password(@Param("n") String user_email, @Param("c") String user_password);
}
