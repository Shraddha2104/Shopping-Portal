package com.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.model.Account;
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Account account;
	
	private final String UPLOAD_DIRECTORY = "Users/imtiyazhirani/Documents/workspace/Tours/WebContent/upload";
	
	@Override
    public void init() throws ServletException {
        super.init();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("action");
		if(action == null){
			request.getRequestDispatcher("jsps/admin/index.jsp").forward(request, response);
		}
		else{
			doPost(request,response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("action");
		 
		 System.out.println(UPLOAD_DIRECTORY);
		if(action.equals("add_tour")){
			request.setAttribute("flag", "100");
			request.getRequestDispatcher("jsps/admin/index.jsp").forward(request, response);
			
		}
		if(action.equals("add_package_form")){
			String pname=request.getParameter("pname");
			String price = request.getParameter("price");
			String details = request.getParameter("details");
			String continent_id = request.getParameter("continent_id");
			request.setAttribute("flag", "100");
			request.setAttribute("msg", "Tour Package Added..");
			//Add this info to DB
			 account = new Account();
			try {
				account.insertPackage(pname,price,details,continent_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher("jsps/admin/index.jsp").forward(request, response);
		}
		
		if(action.equals("edit_tour")){
			
		}
		
		if(action.equals("cancel_featured_package")){
			String id = request.getParameter("id");
			account=new Account();
			try {
				account.cancelFeaturedPackage(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("jsps/admin/all_packages.jsp").forward(request, response);
			
		}
		
		if(action.equals("featured_package")){
			String id = request.getParameter("id");
			account=new Account();
			try {
				account.setFeaturedPackage(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("jsps/admin/all_packages.jsp").forward(request, response);
			
		}
		if(action.equals("all_package")){
			request.getRequestDispatcher("jsps/admin/all_packages.jsp").forward(request, response);
		}
		
		if(action.equals("add_image")){
			request.getRequestDispatcher("jsps/admin/image_upload.jsp").forward(request, response);
			
		}
		if(action.equals("show_images")){
			request.getRequestDispatcher("jsps/admin/show_images.jsp").forward(request, response);
			
		}
		
		if(action.equals("add_country")){
			request.getRequestDispatcher("jsps/admin/add_country.jsp").forward(request, response);
			
		}
		
		if(action.equals("manage_country")){
			request.getRequestDispatcher("jsps/admin/manage_country.jsp").forward(request, response);
			
		}
		if(action.equals("delete_country")){
			String id = request.getParameter("id");
			account = new Account();
			try {
				account.deleteCountry(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg", "Country record deleted");
			
			request.getRequestDispatcher("jsps/admin/manage_country.jsp").forward(request, response);
			
		}
		
		if(action.equals("edit_country")){
			String id = request.getParameter("id");
			request.setAttribute("id", id);
			request.getRequestDispatcher("jsps/admin/edit_country.jsp").forward(request, response);
			
		}
		
		if(action.equals("edit_country_form")){
			String id = request.getParameter("id");
			String cname = request.getParameter("cname");
			String fprice = request.getParameter("fprice");
			String star2 = request.getParameter("2star");
			String star3 = request.getParameter("3star");
			String star5 = request.getParameter("5star");
			account=new Account();
			try {
				account.editcountry(id, cname, fprice, star2, star3, star5);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg", "Country listing Edited");
			request.getRequestDispatcher("jsps/admin/manage_country.jsp").forward(request, response);
			
		}
		
		if(action.equals("add_country_form")){
			String continent_id = request.getParameter("continent_id");
			String cname = request.getParameter("cname");
			String fprice = request.getParameter("fprice");
			String star2 = request.getParameter("2star");
			String star3 = request.getParameter("3star");
			String star5 = request.getParameter("5star");
			
			account = new Account();
			try {
				account.insertcountry(cname, fprice, star2, star3, star5,continent_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg", "Country Added to DB");
			request.getRequestDispatcher("jsps/admin/add_country.jsp").forward(request, response);
			
		}
		
		
		if(action.equals("show_upload")){
			String pac=request.getParameter("pac");
			request.setAttribute("pac", pac);
			request.getRequestDispatcher("jsps/admin/image_form.jsp").forward(request, response);
		}
		
		
		
		if(action.equals("image_upload")){
		//file upload goes here
			//process only if its multipart content
			String name="";
			
			 String pac  = request.getParameter("pac");
	        if(ServletFileUpload.isMultipartContent(request)){
	            try {
	                List<FileItem> multiparts = new ServletFileUpload(
	                                         new DiskFileItemFactory()).parseRequest(request);
	              
	                for(FileItem item : multiparts){
	                    if(!item.isFormField()){
	                         name = new File(item.getName()).getName();
	                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
	                    }
	                }
	                
	                //add image to db
	                Account account = new Account();
	                String path="upload" + "/" + name;
	               account.addImage(path,pac);
	               
	               
	            }
	            catch(Exception e){
	            	e.printStackTrace();
	            	
	            }
	                
	                request.setAttribute("msg", "Image Uploaded...");
	            request.getRequestDispatcher("jsps/admin/image_upload.jsp").forward(request, response);
	    		
		
	}

		}
		
	}
}
		
	

















