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
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Paris
 */
@Path("CheckResults")
public class CheckResultsResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of CheckResultsResource
     */
    public CheckResultsResource() {
    }

    @GET
    @Path("{id0}/{ans0}/{id1}/{ans1}/{id2}/{ans2}/{id3}/{ans3}/{id4}/{ans4}/{id5}/{ans5}/{id6}/{ans6}/{id7}/{ans7}/{id8}/{ans8}/{id9}/{ans9}/{stats_id}")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public String putJson(@PathParam("id0") int id0, @PathParam("ans0") String ans0, @PathParam("id1") int id1, @PathParam("ans1") String ans1,
            @PathParam("id2") int id2, @PathParam("ans2") String ans2, @PathParam("id3") int id3, @PathParam("ans3") String ans3,
            @PathParam("id4") int id4, @PathParam("ans4") String ans4, @PathParam("id5") int id5, @PathParam("ans5") String ans5,
            @PathParam("id6") int id6, @PathParam("ans6") String ans6, @PathParam("id7") int id7, @PathParam("ans7") String ans7,
            @PathParam("id8") int id8, @PathParam("ans8") String ans8, @PathParam("id9") int id9, @PathParam("ans9") String ans9,
            @PathParam("stats_id") int stats_id) {
        try {
            int count = 0,j = 0;
            int rows=0;
            int[] id = {id0, id1, id2, id3, id4, id5, id6, id7, id8, id9};
            String[] ans = {ans0, ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8, ans9};
            String[] correct_wrong_answers = new String[10];
            String correct_answer;

            SingletonMysqlConnection dbcon = SingletonMysqlConnection.getDbCon();

            Gson gson = new Gson();
            String res = "";
            String sqlString = "";
            for (int i = 0; i <= 9; i++) {
                sqlString = "SELECT choice FROM question_choices where question_id=" + id[i] + " and correct=1;";
                ResultSet rs1 = dbcon.query(sqlString);
                
                if(rs1.next()){
                    correct_answer=rs1.getString("choice");
                    if(correct_answer.equalsIgnoreCase(ans[i])){
                        count++;
                    }
                    else{
                        correct_wrong_answers[i] = correct_answer;
                        //j++;
                    }
                }
                if(rs1.next()){
                    System.out.println("WUT MPALALAIKA!");
                }
            }
            sqlString="update stats set score="+count+" where stats_id="+stats_id;
            rows=dbcon.insert(sqlString);
            
            if(rows<=0){
                return new Gson().toJson("alou auta!");
            }
            
            res = new Gson().toJson(correct_wrong_answers);
            res += "#";
            res += new Gson().toJson(count);

            return res;
        } catch (SQLException e) {
            return new Gson().toJson("well....shit "+e.getMessage());
        }

    }
}
