package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Country;
import com.beans.Quotation;


public class Quote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("action");//quote_form
		
		if(action.equals("quote_form")){
			String[] country = request.getParameterValues("country[]");
			String tour=request.getParameter("tour");
			String days=request.getParameter("days");
			String person=request.getParameter("person");
			ArrayList country_list = new ArrayList();
			//validate here 
			ArrayList<Country> list = (ArrayList<Country>)request.getSession().getAttribute("list");
			double fprice=0;
			String hotel_price = "";
			String hotel_price2="";
			String hotel_price5="";
					
			for(Country c:list){
				for(String s: country){
					
					int id = Integer.parseInt(s);
					if(c.getId() == id){
						country_list.add(c.getName());
						hotel_price = c.getS3();
						hotel_price2 = c.getS2();
						hotel_price5 = c.getS5();
						
						double flight_price=Double.parseDouble(c.getFlight_price());
						if(fprice < flight_price){
							fprice = flight_price;
						}
					}
				}
			}
			
			Quotation q = new Quotation(); 
			String total = q.computeQuote( fprice, days, hotel_price, person);
			request.setAttribute("total", total);
			request.setAttribute("fprice", fprice);
			request.setAttribute("days", days);
			request.setAttribute("hotel_price", hotel_price);
			request.setAttribute("person", person);
			request.setAttribute("country_list", country_list);
			
			request.setAttribute("hotel_price2", hotel_price2);
			request.setAttribute("hotel_price5", hotel_price5);
			
			request.setAttribute("flag", "100");
			
			request.getRequestDispatcher("jsps/main/index.jsp").forward(request, response);

		}
	}

}
