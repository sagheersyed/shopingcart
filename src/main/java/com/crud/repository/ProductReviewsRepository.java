package com.crud.repository;

import com.crud.entity.ProductReview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductReviewsRepository extends JpaRepository<ProductReview, Long> {
}
