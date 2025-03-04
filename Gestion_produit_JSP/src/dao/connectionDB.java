package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectionDB implements configDB {
	
    public static Connection SiConnectionDB() {
        Connection objconnex = null;
        try {
            // Charger le Driver JDBC
            Class.forName("com.mysql.jdbc.Driver");

            // Établir la connexion
            objconnex = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("Connexion à la base de données réussie");
        } 
        catch (ClassNotFoundException e) {
            System.out.println("Driver non trouvé : " + e.getMessage());
        }
        catch (SQLException e) {
            System.out.println("Echec de connexion à la base de données : " + e.getMessage());
        }
        
        return objconnex;
    }
}
