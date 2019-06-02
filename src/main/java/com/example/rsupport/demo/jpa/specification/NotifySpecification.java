package com.example.rsupport.demo.jpa.specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.example.rsupport.demo.jpa.domain.Notify;


public class NotifySpecification implements Specification<Notify> {

	private SearchCriteria criteria;
	
	public NotifySpecification(SearchCriteria searchCriteria){
		this.criteria = searchCriteria;
	}
	@Override
	public Predicate toPredicate(Root<Notify> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
		// TODO Auto-generated method stub
        if (criteria.getOperation().equalsIgnoreCase(">")) {
            return builder.greaterThanOrEqualTo(
              root.<String> get(criteria.getKey()), criteria.getValue().toString());
        } 
        else if (criteria.getOperation().equalsIgnoreCase("<")) {
            return builder.lessThanOrEqualTo(
              root.<String> get(criteria.getKey()), criteria.getValue().toString());
        } 
        else if (criteria.getOperation().equalsIgnoreCase(":")) {
            if (root.get(criteria.getKey()).getJavaType() == String.class) {
                return builder.like(
                  root.<String>get(criteria.getKey()), "%" + criteria.getValue() + "%");
            } else {
                return builder.equal(root.get(criteria.getKey()), criteria.getValue());
            }
        }
		return null;
	}

}
