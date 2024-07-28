package br.csi.model;

public class Usuario {
    private int id;
    private String nome;
    private String cpf;
    private String data_cad;
    private int idade;
    private Permissao permissao;
    private Abrigo abrigo;

    public Usuario(String nome, String cpf, int idade, Permissao permissao, Abrigo abrigo) {
        this.nome = nome;
        this.cpf = cpf;
        this.idade = idade;
        this.permissao = permissao;
        this.abrigo = abrigo;
    }

    public Usuario(int id, String nome, String cpf, String data_cad, int idade, Permissao permissao, Abrigo abrigo) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.data_cad = data_cad;
        this.idade = idade;
        this.permissao = permissao;
        this.abrigo = abrigo;
    }

    public Abrigo getAbrigo() {
        return abrigo;
    }

    public void setAbrigo(Abrigo abrigo) {
        this.abrigo = abrigo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getData_cad() {
        return data_cad;
    }

    public void setData_cad(String data_cad) {
        this.data_cad = data_cad;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public Permissao getPermissao() {
        return permissao;
    }

    public void setPermissao(Permissao permissao) {
        this.permissao = permissao;
    }
}
