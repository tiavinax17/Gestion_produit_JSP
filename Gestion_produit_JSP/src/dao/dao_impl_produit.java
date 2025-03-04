package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mysql.jdbc.PreparedStatement;

import model.model_produit;

public class dao_impl_produit implements dao_produit {
	public List<model_produit> getListaffichage_produit(){
		Connection con = connectionDB.SiConnectionDB();
		String sql = "select * from produit";
		List<model_produit> list = new ArrayList<model_produit>();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int numProduit = rs.getInt("numProduit");
				String design = rs.getString("design");
				int prix = rs.getInt("prix");
				int quantite = rs.getInt("quantite");
				list.add(new model_produit(numProduit, design, prix,quantite));
			}
			con.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void ajout_prod(model_produit p) {
		Connection con = connectionDB.SiConnectionDB();
		String sql = "insert into produit (design, prix, quantite)value(?,?,?)";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setString(1, p.getDesign());
			ps.setInt(2, p.getPrix());
			ps.setInt(3, p.getQuantite());
			ps.executeUpdate();
			con.close();
		}
		catch (SQLException e) {
			System.out.print("tsy tafiditra base");
			e.printStackTrace();
		}
	}
	public void modif_prod(model_produit p) {
		Connection con = connectionDB.SiConnectionDB();
		String sql = "update produit set design=?, prix=?, quantite=? where numProduit=?";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setString(1, p.getDesign());
			ps.setInt(2, p.getPrix());
			ps.setInt(3, p.getQuantite());
			ps.setInt(4, p.getNumProduit());
			ps.executeUpdate();
			con.close();
		}
		catch (SQLException e) {
			System.out.print("tsy modifiee base");
			e.printStackTrace();
		}
	}
	
	public void suppr_prod(int numProduit) {
		Connection con = connectionDB.SiConnectionDB();
		String sql = "delete from produit where numProduit='" + numProduit
				+ "'";
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ps.executeUpdate();
			con.close();
			 System.out.println("user effaceee");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	

}
