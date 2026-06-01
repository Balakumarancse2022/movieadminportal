package com.example.booking.entity;
import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class Movie {
		@Id
		@GeneratedValue(strategy=GenerationType.SEQUENCE)
		private int movieid;
		private String moviename;
		private String language;
		private String director;
		private LocalDate relesedate;
		public Movie(int movieid, String moviename, String language, String director, LocalDate relesedate) {
			super();
			this.movieid = movieid;
			this.moviename = moviename;
			this.language = language;
			this.director = director;
			this.relesedate = relesedate;
		}
		public int getMovieid() {
			return movieid;
		}
		public void setMovieid(int movieid) {
			this.movieid = movieid;
		}
		public String getMoviename() {
			return moviename;
		}
		public void setMoviename(String moviename) {
			this.moviename = moviename;
		}
		public String getLanguage() {
			return language;
		}
		public void setLanguage(String language) {
			this.language = language;
		}
		public String getDirector() {
			return director;
		}
		public void setDirector(String director) {
			this.director = director;
		}
		public LocalDate getRelesedate() {
			return relesedate;
		}
		public void setRelesedate(LocalDate relesedate) {
			this.relesedate = relesedate;
		}
		@Override
		public String toString() {
			return "Movie [movieid=" + movieid + ", moviename=" + moviename + ", language=" + language + ", director="
					+ director + ", relesedate=" + relesedate + "]";
		}
		public Movie() {
			super();
			// TODO Auto-generated constructor stub
		}



}
