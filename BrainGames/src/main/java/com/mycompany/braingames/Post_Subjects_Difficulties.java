/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mycompany.braingames;

import com.google.gson.Gson;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Dinos
 */
@Path("post_sub_diff")
public class Post_Subjects_Difficulties {

    @Context
    private UriInfo context; 

    /**
     * Creates a new instance of Post_Subjects_Difficulties
     */
    
    public Post_Subjects_Difficulties() {
    }


    @GET
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public String putJson() {
        try {
            SingletonMysqlConnection dbcon =SingletonMysqlConnection.getDbCon();
            String sqlString = "SELECT difficulty FROM difficulties ;";
            String sqlString2 = "SELECT subject FROM subjects ;";
      
             ResultSet rs1=dbcon.query(sqlString);
             ResultSet rs2=dbcon.query(sqlString2);
             
             Gson gson = new Gson();
             String res="";
             
            while(rs1.next())
            { 
               res=res+gson.toJson(rs1.getString("difficulty"))+"#";
            }
            
            res=res+"#";
            
            while(rs2.next()){
                res=res+gson.toJson(rs2.getString("subject"))+"#";
            }
            

            return res.substring(0, res.length()-1);
        } catch (SQLException e) {
            return new Gson().toJson("well....shit");
        }
       
    }
}
