package com.beans;

public class Quotation {

	
	public String computeQuote(double fprice, String num_days,String day_cost, String num_person){
		
		double flight_price = fprice;
		double cost_per_day = Double.parseDouble(day_cost);
		int num_days_stay=Integer.parseInt(num_days);
		int num_person_travelling=Integer.parseInt(num_person);
		
		int  num_person_travelling1 = num_person_travelling /2;
		double total = ((cost_per_day * num_days_stay) * num_person_travelling1) + (flight_price * num_person_travelling);
		return "" + total;
	}
}
