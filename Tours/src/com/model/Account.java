package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beans.Country;

public class Account {
	String user="root";
	String password ="";
	String url="jdbc:mysql://localhost:3306/";
	
	String dbname="tour";
	String driver="com.mysql.jdbc.Driver";
	Connection con;
	PreparedStatement pstmt;
	ResultSet rst;
	
	ArrayList<Country> list = new ArrayList<Country>();
	
	private void dbConnect() throws ClassNotFoundException, SQLException{
		Class.forName(driver);
	    con = DriverManager.getConnection(url+dbname,user,password);
	}
	
	private void dbClose() throws SQLException{
		con.close();
	}
	
	public ArrayList<Country> getDestination(String location_id) throws Exception{
		dbConnect();
		list.clear();
		String sql="select * from country where continent_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(location_id));
		ResultSet rst = pstmt.executeQuery();
			while(rst.next()){
				Country c=new Country();
				c.setId(rst.getInt("id"));
				c.setName(rst.getString("country_name"));
				c.setFlight_price(rst.getString("flight_price"));
				c.setS2(rst.getString("star2"));
				c.setS3(rst.getString("star3"));
				c.setS5(rst.getString("star5"));
				list.add(c);
				c=null;
			}
			dbClose();
		return list;
	}

	public void insertPackage(String pname, String price, String details,
			String continent_id) throws Exception{
		dbConnect();
		String sql ="insert into package(pname,details,price,continent_id) values(?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setString(2, details);
		pstmt.setString(3, price);
		pstmt.setInt(4, Integer.parseInt(continent_id));
		
		pstmt.executeUpdate();
		dbClose();
		
	}

	public void addImage(String name,String pac) throws Exception{
		dbConnect();
		String sql ="insert into images(name,package_id) values(?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, Integer.parseInt(pac));
		pstmt.executeUpdate();
		dbClose();
		
	}

	public void insertcountry(String cname, String fprice, String star2,
			String star3, String star5, String continent_id)  throws Exception{
		dbConnect();
		String sql ="insert into country(country_name,flight_price,star2,star3,star5,continent_id) values(?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, cname);
		pstmt.setString(2, fprice);
		pstmt.setString(3, star2);
		pstmt.setString(4, star3);
		pstmt.setString(5, star5);
		pstmt.setInt(6, Integer.parseInt(continent_id));
		
		pstmt.executeUpdate();
		dbClose();
		
		
	}

	public void deleteCountry(String id) throws Exception{
		dbConnect();
		String sql ="delete from country where id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(id));
		
		pstmt.executeUpdate();
		dbClose();
		
		
	}

	public void editcountry(String id,String cname, String fprice, String star2,
			String star3, String star5) throws Exception{
		dbConnect();
		String sql ="update country set country_name=? , flight_price=? , star2=? , star3=? , star5=? where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, cname);
		pstmt.setString(2, fprice);
		pstmt.setString(3, star2);
		pstmt.setString(4, star3);
		pstmt.setString(5, star5);
		pstmt.setInt(6, Integer.parseInt(id));
		
		pstmt.executeUpdate();
		dbClose();
		
	}

	public void setFeaturedPackage(String id) throws Exception{
		
		dbConnect();
		String sql ="update package set featured=? where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "yes");
		
		pstmt.setInt(2, Integer.parseInt(id));
		
		pstmt.executeUpdate();
		dbClose();
	}

	public void cancelFeaturedPackage(String id) throws Exception{
		dbConnect();
		String sql ="update package set featured=? where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "no");
		
		pstmt.setInt(2, Integer.parseInt(id));
		
		pstmt.executeUpdate();
		dbClose();
		
	}
}









