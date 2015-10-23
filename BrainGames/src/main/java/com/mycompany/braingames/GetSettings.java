/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.braingames;

import com.google.gson.Gson;
import static java.lang.Math.random;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

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
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public String getJson(@PathParam("un") String un, @PathParam("fn") String fn, @PathParam("ln") String ln, @PathParam("sub") String sub, @PathParam("dif") String dif) {
        int user_id, sub_id, dif_id,dif_time=0;
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
                dif_id = rs2.getInt("difficulty_id");
            } else {
                return new Gson().toJson("bad select 1!");
            }

            String sqlString3 = "select subject_id from subjects where subject='" + sub + "'";
            System.out.println(sqlString3);
            ResultSet rs3 = dbcon.query(sqlString3);
            if (rs3.next()) {
                sub_id = rs3.getInt(1);
            } else {
                return new Gson().toJson("bad select 2!"+sqlString3);
            }

            String sqlString4 = "insert into stats (user_id,score,subject_id,difficulty_id) values (" + user_id + ",-1,'" + sub_id + "','" + dif_id + "');";
            dbcon.insert(sqlString4);
            
            String sqlStringg = "select max(stats_id) from stats;";
            ResultSet rss = dbcon.query(sqlStringg);
            int stats_id;
            if (rss.next()) {
                stats_id = rss.getInt(1);
            } else {
                return new Gson().toJson("bas select!");
            }
            
            
            
            
            String res="";
            String sqlString5 = "select COUNT(*) from questions where subject_id=" + sub_id + " and difficulty_id=" + dif_id + ";";
            //System.out.println(sqlString5);
            ResultSet rs5 = dbcon.query(sqlString5);
            
            //DEN ELEGXW KATI OMWS EDW :/
            rs5.next();  //EDW KAI NA MHN UPARXOUN QUESTION TO COUNT(*) PANTA DEN EPISTREFEI KATI?
            int num_of_questions=rs5.getInt("COUNT(*)");
            String questions[]=new String[num_of_questions];
            Integer q_id[] = new Integer[num_of_questions];
            
            sqlString5 = "select question_id,question from questions where subject_id=" + sub_id + " and difficulty_id=" + dif_id + ";";
            System.out.println(sqlString5);
            rs5 = dbcon.query(sqlString5);
//            if (rs5.next()) {
                int i=0;
                while(rs5.next()){//do{
                    //res = rs5.getString("question");
                    questions[i] = rs5.getString("question");
                    q_id[i] = rs5.getInt("question_id");
                    //rs5.next();
                    i++;
                    
                }//while(rs5.next());
                 
                    System.out.println("edwwwwwww " + i + " " +  num_of_questions);
//            } else {
//                System.out.println("lalalala====" +sqlString5);
//                return new Gson().toJson("bad select 3!");
//            }
            //res += "#";
            
                Integer random10[]=new Integer[10];
                int cur_random;
                int counter=0;//8eloume na ftasei 10
                random10[0]=random10[1]=random10[2]=random10[3]=random10[4]=random10[5]=random10[6]=random10[7]=random10[8]=random10[9]=-1;
                Random random= new Random();
                while(counter<10){
                    cur_random=random.nextInt((num_of_questions-1) - 1 + 1) + 1;
                    boolean already_exists=false;
                    //search an uparxei hdh
                    for(int k=0;k<10;k++){
                        if(cur_random==random10[k].intValue()){
                            already_exists=true;
                            break;}
                    }
                    if(!already_exists){
                        random10[counter]=cur_random;
                        counter++;
                    }
                }
                
//                for(int lo=0;lo<10;lo++){
//                    System.out.println("HOHO "+random10[lo] +" " + q_id[lo] + " " + questions[lo] );
//                }
                for(int lo=0;lo<10;lo++){
                    //System.out.println("HOHO "+random10[lo] +" " + q_id[lo] + " " + questions[lo] );
                    
                    res+=q_id[random10[lo]]+"#"+questions[random10[lo]]+"#";
                    
                    String sqlString6 = "select choice from question_choices where question_id='" + q_id[random10[lo]] + "'; ";//q_id[lo] + "'; ";
                    System.out.println(sqlString6); 
                    ResultSet rs6 = dbcon.query(sqlString6);
                    if (rs6.next()) {
                        for(int ii=0;ii<=3;ii++){
                            res += rs6.getString("choice")+"#";
                            rs6.next();
                        }
                    } else {
                        return new Gson().toJson("bad select 4!");
                    }

                }
                
                String sqlString77 = "select time from difficulties where difficulty_id=" + dif_id + "; ";//q_id[lo] + "'; ";
                    System.out.println(sqlString77); 
                    ResultSet rs77 = dbcon.query(sqlString77);
                if(rs77.next()){
                    dif_time=rs77.getInt("time");
                }
                else{
                    System.out.println("not possible");
                }
                if(rs77.next()){
                    System.out.println("not possible as well");
                }
                    
                    
            return res+"#"+stats_id+"##"+dif_time; // erwthsh#ap1#ap2#ap3#ap4#id erwthshs#anagnwristiko xrhsth ston pinaka stats
        } catch (SQLException e) {
            return new Gson().toJson(e.getMessage());
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
