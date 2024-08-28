package com.demo_bank_v1.repository;

import com.demo_bank_v1.models.TransactionHistory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactHistoryRepository extends PagingAndSortingRepository<TransactionHistory, Integer> {

    @Query(value = "SELECT * FROM v_transaction_history_view WHERE user_id = :user_id ORDER BY created_at DESC", nativeQuery = true)
    List<TransactionHistory> getTransactionRecordsByIdDesc(@Param("user_id") int user_id);

    @Query(value = "SELECT * FROM v_transaction_history_view WHERE user_id = :user_id ORDER BY created_at ASC", nativeQuery = true)
    List<TransactionHistory> getTransactionRecordsByIdAsc(@Param("user_id") int user_id);

    @Query(value = "SELECT * FROM v_transaction_history_view WHERE user_id = :user_id AND transaction_type = :type", nativeQuery = true)
    List<TransactionHistory> getTransactionsByType(@Param("user_id") int user_id, @Param("type") String type);

    @Query(value = "SELECT * FROM v_transaction_history_view WHERE user_id = :user_id AND created_at BETWEEN :start_date AND :end_date", nativeQuery = true)
    List<TransactionHistory> getTransactionsByDateRange(@Param("user_id") int user_id, @Param("start_date") String startDate, @Param("end_date") String endDate);

    @Query(value = "SELECT * FROM v_transaction_history_view WHERE user_id = :user_id", nativeQuery = true)
    Page<TransactionHistory> findByUserId(@Param("user_id") int user_id, Pageable pageable);

    @Query("SELECT t FROM TransactionHistory t WHERE t.user_id = :user_id")
    List<TransactionHistory> getTransactionRecordsById(@Param("user_id") int user_id);

}
