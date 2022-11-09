import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class index{
    private String name=null;
    private int num=0;
    public index(String nickname, int gamenum){
        this.name=nickname;
        this.num=gamenum;
    }
    public void main(String[] args) throws Exception {
        Class.forName("com.mysql.jdbc.Connection");
        Connection con =DriverManager.getConnection("jdbc:localhost:3306/userinfo?serverTimezone=GMT","root","20416330");
        Statement stat = con.createStatement();
        String sql="INSERT INTO user(username,gametimes) VALUES("+this.name+",'"+this.num+"')";
        stat.close();
        con.close();
    }
}
