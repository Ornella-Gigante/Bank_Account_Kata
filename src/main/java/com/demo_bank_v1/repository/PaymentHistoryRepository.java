package com.demo_bank_v1.repository;

import com.demo_bank_v1.models.PaymentHistory;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentHistoryRepository extends CrudRepository<PaymentHistory,Integer> {

    @Query(value="SELECT * FROM v_payments WHERE user_id= :user_id", nativeQuery = true)
    //What this is getting is a collections for data (list)
    List<PaymentHistory> getPaymentRecordsById(@Param("user_id")int user_id);


}
