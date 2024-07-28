package br.csi.model;

public class Abrigo {
    private int id_abrigo;
    private int vagas;
    private String nome;
    private String endereco;

    public Abrigo(int id_abrigo) {
        this.id_abrigo = id_abrigo;
    }

    public Abrigo(int vagas, String nome, String endereco) {
        this.vagas = vagas;
        this.nome = nome;
        this.endereco = endereco;
    }

    public Abrigo(int id_abrigo, int vagas, String nome, String endereco) {
        this.id_abrigo = id_abrigo;
        this.vagas = vagas;
        this.nome = nome;
        this.endereco = endereco;
    }

    public int getId_abrigo() {
        return id_abrigo;
    }

    public void setId_abrigo(int id_abrigo) {
        this.id_abrigo = id_abrigo;
    }

    public int getVagas() {
        return vagas;
    }

    public void setVagas(int vagas) {
        this.vagas = vagas;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
}
