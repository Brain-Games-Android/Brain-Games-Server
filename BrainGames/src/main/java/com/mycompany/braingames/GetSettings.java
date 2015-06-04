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
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;

/**
 * REST Web Service
 *
 * @author Paris
 */
@Path("getSettings")
public class GetSettings {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of GetSettings
     */
    public GetSettings() {
    }

    /**
     * Retrieves representation of an instance of
     * com.mycompany.braingames.GetSettings
     *
     * @return an instance of java.lang.String
     */
    @GET
    @Path("{un}/{fn}/{ln}/{sub}/{dif}")
    @Produces("application/json")
    public String getJson(@PathParam("un") String un, @PathParam("fn") String fn, @PathParam("ln") String ln, @PathParam("sub") String sub, @PathParam("dif") String dif) {
        int user_id, sub_id, dif_id;
        try {
            SingletonMysqlConnection dbcon = SingletonMysqlConnection.getDbCon();

            String sqlString = "insert into users (username,first_name,last_name) values ('" + un + "','" + fn + "','" + ln + "');";
            dbcon.insert(sqlString);

            //find id's
            String sqlString1 = "select max(user_id) from users;";
            ResultSet rs1 = dbcon.query(sqlString1);
            if (rs1.next()) {
                user_id = rs1.getInt(1);
            } else {
                return new Gson().toJson("bas select!");
            }

            String sqlString2 = "select difficulty_id from difficulties where difficulty='" + dif + "'";
            ResultSet rs2 = dbcon.query(sqlString2);
            if (rs2.next()) {
                sub_id = rs2.getInt("difficulty_id");
            } else {
                return new Gson().toJson("bad select 1!");
            }

            String sqlString3 = "select subject_id from subjects where subject='" + sub + "'";
            ResultSet rs3 = dbcon.query(sqlString3);
            if (rs3.next()) {
                dif_id = rs3.getInt(1);
            } else {
                return new Gson().toJson("bad select 2!");
            }

            String sqlString4 = "insert into stats (user_id,score,subject_id,difficulty_id) values ('" + user_id + "',-1,'" + sub_id + "','" + dif_id + "');";
            dbcon.insert(sqlString4);
            
            String sqlStringg = "select max(stats_id) from stats;";
            ResultSet rss = dbcon.query(sqlStringg);
            int stats_id;
            if (rss.next()) {
                stats_id = rss.getInt(1);
            } else {
                return new Gson().toJson("bas select!");
            }
            
            
            int q_id;
            String res="";
            String sqlString5 = "select question_id,question from questions where subject_id=" + sub_id + " and difficulty_id=" + dif_id + ";";
            System.out.println(sqlString5);
            ResultSet rs5 = dbcon.query(sqlString5);
            if (rs5.next()) {
                res = rs5.getString("question");
                q_id = rs5.getInt("question_id");
            } else {
                return new Gson().toJson("bad select 3!");
            }
            res += "#";

            String sqlString6 = "select choice from question_choices where question_id='" + q_id + "'; ";
            ResultSet rs6 = dbcon.query(sqlString6);
            if (rs6.next()) {
                for(int i=0;i<=3;i++){
                    res += rs6.getString("choice")+"#";
                    rs6.next();
                }
            } else {
                return new Gson().toJson("bad select 4!");
            }
                        
            
            return res+q_id+"#"+stats_id; // erwthsh#ap1#ap2#ap3#ap4#id erwthshs#anagnwristiko xrhsth ston pinaka stats
        } catch (SQLException e) {
            return new Gson().toJson("BAD!");
        }
    }

    /**
     * PUT method for updating or creating an instance of GetSettings
     *
     * @param content representation for the resource
     * @return an HTTP response with content of the updated or created resource.
     */
    @PUT
    @Consumes("application/json")
    public void putJson(String content) {
    }
}
