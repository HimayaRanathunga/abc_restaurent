package com.abc.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class Booking {
    private int bookingId;
    private String name;
    private String email;
    private String mobile;
    private LocalDate bookingDate;
    private LocalTime bookingTime;
    private int guestCount;
    private String status;

    public Booking(String name, String email, String mobile, LocalDate bookingDate, LocalTime bookingTime, int guestCount, String status) {
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.guestCount = guestCount;
        this.status = status;
    }

    public Booking(int bookingId, String name, String email, String mobile, LocalDate bookingDate, LocalTime bookingTime, int guestCount, String status) {
        this.bookingId = bookingId;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.guestCount = guestCount;
        this.status = status;
    }

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public LocalDate getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(LocalDate bookingDate) {
		this.bookingDate = bookingDate;
	}

	public LocalTime getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(LocalTime bookingTime) {
		this.bookingTime = bookingTime;
	}

	public int getGuestCount() {
		return guestCount;
	}

	public void setGuestCount(int guestCount) {
		this.guestCount = guestCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

    
}
