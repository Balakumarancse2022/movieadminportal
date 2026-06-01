package com.example.booking.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.booking.entity.Movie;
import com.example.booking.repository.MovieBo;


@Service
public class MovieService {
	@Autowired
	MovieBo mb;
	public boolean insertMovie(Movie m) {
 		boolean b = false;
		try {
			mb.save(m);
		}
		catch(Exception e) {
			b = true;
		}
		return b;
	}
	public List<Movie> getAllMovies() {
		return mb.findAll();
	}
	
	
	@SuppressWarnings("deprecation")
	public Movie getMovieById(int id) {
		return mb.getById(id);
	}
	
	public List<String> getLangauges() {
		return mb.getLangauges();
	}
	
	public List<Movie> getMoviesByLanguage(String lang) {
		return mb.getMoviesByLanguage(lang);
	}

	public boolean updateMovie(Movie m) {
		boolean b=false;
		try {
			mb.save(m);
		}
		catch(Exception e) {
			b = true;
		}
		return b;
	}
	public boolean deletemovie(int id) {
		boolean b=false;
		try {
			mb.deleteById(id);
		}
		catch(Exception e) {
			b = true;
		}
		return b;
	}
	public static void save(Movie movie) {
		// TODO Auto-generated method stub
		
	}


	



}
