package com.projeto1.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.projeto1.bean.Produto;

public class ProdutoDao {
	
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projeto1","root","");
		}catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static int deletarProduto(Produto p) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM produto WHERE id=?");
			ps.setInt(1, p.getId());
			status = ps.executeUpdate();
		}catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int salvarProduto(Produto p) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO produto (nome, categoria, valor, quantidade) VALUES (?, ?, ?, ?)");
			ps.setString(1, p.getNome());
			ps.setString(2, p.getCategoria());
			ps.setString(3, p.getValor());
			ps.setString(4, p.getQuantidade());
			status = ps.executeUpdate();
		}catch (Exception e) {
			System.out.println(e);
			}
			return status;
		}
	
	public static Produto getRegistroById(int id) {
		Produto produto = null;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM produto WHERE id=?");
			ps.setInt(1,  id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setCategoria(rs.getString("categoria"));
				produto.setValor(rs.getString("valor"));
				produto.setQuantidade(rs.getString("quantidade"));
			}
		}catch (Exception e) {
				System.out.println(e);
			}
			return produto;
		}
	
	public static int updateProduto(Produto p) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE produto SET nome=?, " 
					+ "categoria=?, valor=?, quantidade=? WHERE id=?");
			
			ps.setString(1, p.getNome());
			ps.setString(2, p.getCategoria());
			ps.setString(3, p.getValor());
			ps.setString(4, p.getQuantidade());
			ps.setInt(6, p.getId());
			status = ps.executeUpdate();
		}catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static List<Produto> getAllProdutos(){
		List<Produto> list = new ArrayList<Produto>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM produto");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setCategoria(rs.getString("categoria"));
				produto.setValor(rs.getString("valor"));
				produto.setQuantidade(rs.getString("quantidade"));
				list.add(produto);
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
}
