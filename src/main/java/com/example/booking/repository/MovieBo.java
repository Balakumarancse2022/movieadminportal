package com.example.booking.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.booking.entity.Movie;

@Repository
public interface MovieBo extends JpaRepository<Movie,Integer> {
@Query(value="select distinct(language) from movie",nativeQuery=true)
	List<String> getLangauges();

@Query(value="select * from movie where language=:lang",nativeQuery=true)
List<Movie> getMoviesByLanguage(String lang);
}
