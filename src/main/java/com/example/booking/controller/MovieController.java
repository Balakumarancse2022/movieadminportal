package com.example.booking.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.example.booking.entity.Movie;
import com.example.booking.entity.UserEntity;
import com.example.booking.repository.UserRepository;
import com.example.booking.service.MovieService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class MovieController {

	@Autowired
	MovieService ms;

	@Autowired
	UserRepository ub;

	@RequestMapping("/")
	public ModelAndView home() {
		return new ModelAndView("index");
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		return new ModelAndView("index");
	}

	@RequestMapping("/addmovie")
	public ModelAndView addMovieForm() {
		return new ModelAndView("addmovie");
	}

	@RequestMapping(value = "/insertMovie", method = RequestMethod.POST)
	public ModelAndView insertMovie(HttpServletRequest req) {
		try {
			String movieName = req.getParameter("mname");
			String director = req.getParameter("director");
			String language = req.getParameter("lang");
			LocalDate releaseDate = LocalDate.parse(req.getParameter("rdate"));
			Movie movie = new Movie(0, movieName,language,director, releaseDate);
			ms.insertMovie(movie);
			return new ModelAndView("success");
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	@RequestMapping("/viewmovies")
	public ModelAndView viewAllMovies() {
		ModelAndView mv = new ModelAndView("viewmovies");
		List<Movie> movies = ms.getAllMovies();
		mv.addObject("movies", movies);
		return mv;
	}

	@RequestMapping("/updatemovie")
	public ModelAndView updateMovieForm(@RequestParam int id) {
		ModelAndView mv = new ModelAndView("updatemovie");
		Movie movie = ms.getMovieById(id);
		mv.addObject("movie", movie);
		return mv;
	}

	@RequestMapping(value = "updatemoviedetails", method = RequestMethod.POST)
	public ModelAndView updateMovieDetails(HttpServletRequest req) {
		try {
			int movieId = Integer.parseInt(req.getParameter("movieid"));
			String movieName = req.getParameter("mname");
			String director = req.getParameter("director");
			String language = req.getParameter("lang");
			LocalDate releaseDate = LocalDate.parse(req.getParameter("rdate"));
			Movie movie = new Movie(movieId, movieName, language, director, releaseDate);
			ms.updateMovie(movie);
			return new ModelAndView("success");
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	@RequestMapping(value = "deletemovie", method = RequestMethod.GET)
	public ModelAndView deleteMovie(@RequestParam int id) {
		try {
			ms.deletemovie(id);
			ModelAndView mv = new ModelAndView("viewmovies");
			mv.addObject("movies", ms.getAllMovies());
			return mv;
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	@RequestMapping("/register")
	public ModelAndView registerForm() {
		return new ModelAndView("register");
	}

	@RequestMapping(value = "insertUser", method = RequestMethod.POST)
	public ModelAndView insertUser(HttpServletRequest req) {
		try {
			String email = req.getParameter("email");
			String gender = req.getParameter("gender");
			String location = req.getParameter("location");
			String name = req.getParameter("name");
			String password = req.getParameter("pass");
			UserEntity user = new UserEntity(email, gender, location, name, password, "User");
			ub.save(user);
			return new ModelAndView("index");
		} catch (Exception e) {
			return new ModelAndView("error");
		}
	}

	@RequestMapping("/login")
	public ModelAndView loginForm() {
		return new ModelAndView("login");
	}

	@RequestMapping("/checkUser")
	public ModelAndView checkUser(@RequestParam String email, @RequestParam String pass) {
	    try {
	        UserEntity user = ub.getById(email);
	        if (user != null && pass.equals(user.getPassword())) {
	            ModelAndView mv = new ModelAndView("success");
	            mv.addObject("name", user.getName());
	            mv.addObject("languages", ms.getLangauges());
	            return mv;
	        } else {
	            ModelAndView mv = new ModelAndView("login");
	            mv.addObject("error", "Invalid email or password");
	            mv.addObject("email", email);  // So it stays in the input box
	            return mv;
	        }
	    } catch (Exception e) {
	        ModelAndView mv = new ModelAndView("login");
	        mv.addObject("error", "Something went wrong. Please try again.");
	        mv.addObject("email", email);
	        return mv;
	    }
	}

	@RequestMapping("/viewlanguages")
	public ModelAndView viewLanguages() {
		ModelAndView mv = new ModelAndView("viewlanguages");
		mv.addObject("lang", ms.getLangauges());
		return mv;
	}
	@RequestMapping("/success")
	public ModelAndView sucess() {
		ModelAndView mv = new ModelAndView("success");
		mv.addObject("success", ms.getLangauges());
		return mv;
	}

	@RequestMapping("viewmoviesbylang")
	public ModelAndView viewMoviesByLanguage(@RequestParam String lang) {
		ModelAndView mv = new ModelAndView("viewmovies");
		mv.addObject("movies", ms.getMoviesByLanguage(lang));
		return mv;
	}
}