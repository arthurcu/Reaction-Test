package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import bean.Game;

public class gameDAO {
    //public static void main(String[] args) throws Exception {
    public ArrayList queryallgame() throws Exception{
        //
        Connection conn=null;
        ArrayList gamedata=new ArrayList();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/userinfo?serverTimezone=GMT";
            conn = DriverManager.getConnection(url,"root","020618");
            String sql = "SELECT username,reactiontime FROM gamedata a WHERE reactiontime = (SELECT MIN(reactiontime) FROM gamedata b WHERE a.username = b.username) ORDER BY reactiontime;";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()){
                Game game=new Game();
                game.setName(rs.getString("username"));
                game.setReactiontime(rs.getInt("reactiontime"));
                gamedata.add(game);
            }
            rs.close();
            stat.close();
            }catch (SQLException e){
                e.printStackTrace();
        }finally {
            try{
                if(conn!=null){
                    conn.close();
                    conn=null;
                }
            }catch (Exception ignored){
            }
        }
        //return gamedata;
        for (Object gamedatum : gamedata) {
            System.out.println(gamedatum);
        }
        return gamedata;
    }
    public void senddata(String name,int time) throws Exception{
        //
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/userinfo?serverTimezone=GMT";
        Connection conn = DriverManager.getConnection(url,"root","020618");
        Statement stat = conn.createStatement();
        String sql = "INSERT INTO gamedata(username,reactiontime) VALUES("+name+","+time+")";
        int i = stat.executeUpdate(sql);
        System.out.println("成功添加" + i + "行");
        stat.close();
        conn.close();
    }

    public ArrayList besttime(String name) throws Exception{
        //
        Connection conn=null;
        ArrayList gamedata=new ArrayList();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/userinfo?serverTimezone=GMT";
            conn = DriverManager.getConnection(url,"root","020618");
            String sql = "SELECT username,reactiontime from gamedata WHERE username="+"'"+name+"'"+" order by reactiontime";
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()){
                Game game=new Game();
                game.setName(rs.getString("username"));
                game.setReactiontime(rs.getInt("reactiontime"));
                gamedata.add(game);
            }
            rs.close();
            stat.close();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try{
                if(conn!=null){
                    conn.close();
                }
            }catch (Exception ignored){
            }
        }
        //return gamedata;
        for (Object gamedatum : gamedata) {
            System.out.println(gamedatum);
        }
        return gamedata;
    }
}
//SELECT reactiontime from gamedata a WHERE reactiontime = (SELECT MIN(reactiontime) FROM) gamedata b WHERE a.reactiontime=b.reactiontime)
//SELECT name,reactiontime from gamedata ORDER BY reactiontime WHERE name="+name