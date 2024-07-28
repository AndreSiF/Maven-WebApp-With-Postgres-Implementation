package br.csi.dao;

import br.csi.model.*;

import java.sql.*;
import java.util.ArrayList;

public class VitimaDAO{
    private String sql;
    private Statement statement;
    private ResultSet resultSet;
    private PreparedStatement preparedStatement;
    private String status;

    public ArrayList<Vitima> getVitimas(int id){
//        FUNÇÃO QUE RETORNA TODAS AS VÍTIMAS DE UM ABRIGO
        ArrayList<Vitima> vitimas = new ArrayList<>();
        try(Connection cbd = new ConexaoBD().getConexao()){
            this.sql = "SELECT * FROM usuario us, vitima vi, usuario_perm up, perm pe, riscos ri, abrigo ab, desastre de WHERE vi.id_usuario = us.id_usuario AND us.id_usuario = up.id_usuario AND up.id_perm = pe.id_perm AND ri.id_vitima = vi.id_vitima AND de.id_vitima = vi.id_vitima AND us.id_abrigo = ab.id_abrigo AND us.id_abrigo = '"+id+"';";
            this.statement = cbd.createStatement();
            this.resultSet = this.statement.executeQuery(sql);
            while(this.resultSet.next()){
                Abrigo abrigo = new Abrigo(this.resultSet.getInt("id_abrigo"), (this.resultSet.getInt("vagas") - this.resultSet.getInt("cadastros")), this.resultSet.getString("nome_abrigo"), this.resultSet.getString("endereco"));
                Desastre desastre = new Desastre(this.resultSet.getInt("id_desastre"), this.resultSet.getString("nome_desastre"), this.resultSet.getString("data_desastre"));
                Riscos riscos = new Riscos(this.resultSet.getBoolean("frio"), this.resultSet.getBoolean("nutricao"), this.resultSet.getBoolean("desidrat"), this.resultSet.getBoolean("machucado"));
                Permissao permissao = new Permissao(this.resultSet.getInt("id_perm"), this.resultSet.getString("nome_perm"));
                Usuario u = new Usuario(this.resultSet.getInt("id_usuario"), this.resultSet.getString("nome"), this.resultSet.getString("cpf"), this.resultSet.getString("data_cad"), this.resultSet.getInt("idade"), permissao, abrigo);
                Vitima v = new Vitima(u, riscos, this.resultSet.getString("ultimo_end"), desastre, this.resultSet.getBoolean("presente"));
                vitimas.add(v);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
            this.status = "error";
        }
        return vitimas;
    }

    public String cadastrar(Vitima vitima) {
        try(Connection cbd = new ConexaoBD().getConexao()){
            cbd.setAutoCommit(false);
//            CADASTRANDO USUARIO
            this.sql = "INSERT INTO usuario(nome, cpf, data_cad, idade, id_abrigo) VALUES(?, ?, CURRENT_DATE, ?, ?)";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setString(1, vitima.getNome());
            this.preparedStatement.setString(2, vitima.getCpf());
            this.preparedStatement.setInt(3, vitima.getIdade());
            this.preparedStatement.setInt(4, vitima.getAbrigo().getId_abrigo());
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if (this.resultSet.getInt(1) > 0) {
                vitima.setId(this.resultSet.getInt(1));
                System.out.println(vitima.getId());
                System.out.println("Usuário foi inserido... ");
            }
//            ATUALIZANDO ABRIGO
            this.sql = "UPDATE abrigo SET cadastros = cadastros + 1 WHERE id_abrigo = ?;";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, vitima.getAbrigo().getId_abrigo());
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if (this.resultSet.getInt(1) > 0) {
                System.out.println("Abrigo atualizado... ");
            }
//            INSERINDO A VITIMA
            this.sql = "INSERT INTO vitima(id_usuario, ultimo_end, presente) VALUES(?, ?, ?)";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, vitima.getId());
            this.preparedStatement.setString(2, vitima.getUltimoEnd());
            this.preparedStatement.setBoolean(3, vitima.isPresente());
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                System.out.println("Vitima foi cadastrada... ");
            }

//            INSERINDO A PERMISSAO DO USUARIO COMO VITIMA
            this.sql = "INSERT INTO usuario_perm(id_usuario, id_perm) VALUES (?, ?)";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, vitima.getId());
            this.preparedStatement.setInt(2, vitima.getPermissao().getId_perm());
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                System.out.println("Permissoes da vitima foi cadastrada... ");
            }

//            PEGANDO O ID DA VITIMA
            this.sql = "SELECT * FROM VITIMA WHERE id_usuario = ?";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, vitima.getId());
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getResultSet();
            this.resultSet.next();
            vitima.setId(this.resultSet.getInt("id_vitima"));

            //            INSERINDO O DESASTRE QUE A VITIMA SOFREU
            this.sql = "INSERT INTO desastre(id_vitima, nome_desastre, data_desastre) VALUES(?, ?, CURRENT_DATE)";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, vitima.getId());
            this.preparedStatement.setString(2, vitima.getDesastre().getNome());
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                System.out.println("Desastre da vítima foi cadastrado... ");
            }

//            INSERINDO O ESTADO DA VITIMA CADASTRADA
            this.sql = "INSERT INTO riscos(id_vitima, frio, nutricao, desidrat, machucado) VALUES(?, ?, ?, ?, ?)";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, vitima.getId());
            this.preparedStatement.setBoolean(2, vitima.getRiscos().isFrio());
            this.preparedStatement.setBoolean(3, vitima.getRiscos().isNutricao());
            this.preparedStatement.setBoolean(4, vitima.getRiscos().isDesidrat());
            this.preparedStatement.setBoolean(5, vitima.getRiscos().isMachucado());
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                this.status = "OK";
                System.out.println("Estado da vitima foi cadastrado... ");
            }
            cbd.commit();
        }
        catch (SQLException e) {
            e.printStackTrace();
            this.status = "error";
        }
        return this.status;
    }

    public String excluir(String id, int abrigoId) {
        int idInt = Integer.parseInt(id);
        try (Connection cbd = new ConexaoBD().getConexao()) {
            cbd.setAutoCommit(false);
//            PEGANDO ID DA VITIMA
            this.sql = "SELECT * FROM vitima WHERE id_usuario = ?";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, idInt);
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getResultSet();
            this.resultSet.next();
            int idVitima = this.resultSet.getInt("id_vitima");

//            DELETANDO OS RISCOS DA VITIMA
            this.sql = "DELETE FROM riscos WHERE id_vitima = ?";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, idVitima);
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                this.status = "DEL";
                System.out.println("Riscos removidos...");
            }

//            DELETANDO O DESASTRE QUE A VITIMA ESTEVE
            this.sql = "DELETE FROM desastre WHERE id_vitima = ?";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, idVitima);
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                this.status = "DEL";
                System.out.println("Desastre removido...");
            }

//            DELETANDO A VITIMA
            this.sql = "DELETE FROM vitima WHERE id_usuario = ?";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, idInt);
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                this.status = "DEL";
                System.out.println("Vitima removida...");
            }

//            DELETANDO PERMISSOES DO USUARIO
            this.sql = "DELETE FROM usuario_perm WHERE id_usuario = ?";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, idInt);
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                this.status = "DEL";
                System.out.println("Permissões Removidas...");
            }

//            REMOVENDO USUARIO
            this.sql = "DELETE FROM usuario WHERE id_usuario = ?";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, idInt);
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if(this.resultSet.getInt(1) > 0){
                this.status = "DEL";
                System.out.println("Usuário removido...");
            }
            //            ATUALIZANDO ABRIGO
            this.sql = "UPDATE abrigo SET cadastros = cadastros - 1 WHERE id_abrigo = ?;";
            this.preparedStatement = cbd.prepareStatement(this.sql, PreparedStatement.RETURN_GENERATED_KEYS);
            this.preparedStatement.setInt(1, abrigoId);
            this.preparedStatement.execute();
            this.resultSet = this.preparedStatement.getGeneratedKeys();
            this.resultSet.next();

            if (this.resultSet.getInt(1) > 0) {
                System.out.println("Abrigo atualizado... ");
            }
            cbd.commit();
        }
        catch (SQLException e) {
            e.printStackTrace();
            this.status = "error";
        }
        return this.status;
    }
}
