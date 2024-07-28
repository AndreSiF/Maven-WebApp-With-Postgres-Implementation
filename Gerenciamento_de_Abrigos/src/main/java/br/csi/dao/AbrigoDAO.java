package br.csi.dao;

import br.csi.model.*;

import java.sql.*;
import java.util.ArrayList;

public class AbrigoDAO {
    private String sql;
    private Statement statement;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;
    private String status;

    public ArrayList<Abrigo> getAbrigos() {
//        FUNÇÃO QUE RETORNA TODOS OS ABRIGOS
        ArrayList<Abrigo> abrigos = new ArrayList<>();
        try (Connection cbd = new ConexaoBD().getConexao()) {
            this.sql = "SELECT * FROM abrigo ORDER BY nome_abrigo;";
            this.statement = cbd.createStatement();
            this.resultSet = this.statement.executeQuery(sql);
            while (this.resultSet.next()) {
                Abrigo ab = new Abrigo(this.resultSet.getInt("id_abrigo"), (this.resultSet.getInt("vagas") - this.resultSet.getInt("cadastros")), this.resultSet.getString("nome_abrigo"), this.resultSet.getString("endereco"));
                abrigos.add(ab);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            this.status = "error";
        }
        return abrigos;
    }

    public Abrigo getAbrigo(int id) {
//        FUNÇÃO QUE RETORNA UM ABRIGO ESPECIFICO
        try (Connection cbd = new ConexaoBD().getConexao()) {
            this.sql = "SELECT * FROM abrigo WHERE abrigo.id_abrigo = '"+id+"';";
            this.statement = cbd.createStatement();
            this.resultSet = this.statement.executeQuery(sql);
            this.resultSet.next();
            return new Abrigo(this.resultSet.getInt("id_abrigo"), (this.resultSet.getInt("vagas") - this.resultSet.getInt("cadastros")), this.resultSet.getString("nome_abrigo"), this.resultSet.getString("endereco"));
        } catch (SQLException e) {
            e.printStackTrace();
            this.status = "error";
        }
        return null;
    }

    public String cadastrar(Abrigo abrigo) {
        try (Connection cbd = new ConexaoBD().getConexao()) {
            cbd.setAutoCommit(false);
//            CADASTRANDO ABRIGO
            this.sql = "INSERT INTO abrigo(nome_abrigo, endereco, vagas, cadastros) VALUES(?, ?, ?, ?)";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setString(1, abrigo.getNome());
            this.preparedStatement.setString(2, abrigo.getEndereco());
            this.preparedStatement.setInt(3, abrigo.getVagas());
            this.preparedStatement.setInt(4, 0);
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if (this.resultSet.getInt(1) > 0) {
                this.status = "OK";
                System.out.println("Abrigo foi inserido... ");
            }
            cbd.commit();
            return this.status;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
