package br.csi.model;

public class Voluntario extends Usuario{
    private String endereco;

    public Voluntario(Usuario usuario, String endereco) {
        super(usuario.getId(), usuario.getNome(), usuario.getCpf(), usuario.getData_cad(), usuario.getIdade(), usuario.getPermissao(), usuario.getAbrigo());
        this.endereco = endereco;
    }

    public Voluntario(int id, String nome, String cpf, String data_cad, int idade, String endereco, Permissao permissao, Abrigo abrigo) {
        super(id, nome, cpf, data_cad, idade, permissao, abrigo);
        this.endereco = endereco;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
}
