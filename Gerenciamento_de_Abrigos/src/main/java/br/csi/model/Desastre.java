package br.csi.model;

public class Desastre {
    private int id_desastre;
    private String nome;
    private String data;

    public Desastre(String nome) {
        this.nome = nome;
    }

    public Desastre(int id_desastre, String nome, String data) {
        this.id_desastre = id_desastre;
        this.nome = nome;
        this.data = data;
    }

    public int getId_desastre() {
        return id_desastre;
    }

    public void setId_desastre(int id_desastre) {
        this.id_desastre = id_desastre;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}
