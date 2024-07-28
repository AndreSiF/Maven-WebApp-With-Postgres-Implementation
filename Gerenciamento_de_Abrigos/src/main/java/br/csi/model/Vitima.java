package br.csi.model;


public class Vitima extends Usuario{
    private String ultimoEnd;
    private boolean presente;
    private Riscos riscos;
    private Desastre desastre;

    public Vitima(Usuario usuario, Riscos riscos, String ultimoEnd, Desastre desastre, boolean presente) {
        super(usuario.getId(), usuario.getNome(), usuario.getCpf(), usuario.getData_cad(), usuario.getIdade(), usuario.getPermissao(), usuario.getAbrigo());
        this.ultimoEnd = ultimoEnd;
        this.presente = presente;
        this.desastre = desastre;
        this.riscos = riscos;
    }

    public Vitima(String nome, String cpf, int idade, Permissao permissao, String ultimoEnd, Abrigo abrigo, boolean presente) {
        super(nome, cpf, idade, permissao, abrigo);
        this.ultimoEnd = ultimoEnd;
        this.presente = presente;
    }

    public Desastre getDesastre() {
        return desastre;
    }

    public void setDesastre(Desastre desastre) {
        this.desastre = desastre;
    }

    public Riscos getRiscos() {
        return riscos;
    }

    public void setRiscos(Riscos riscos) {
        this.riscos = riscos;
    }

    public String getUltimoEnd() {
        return ultimoEnd;
    }

    public void setUltimoEnd(String ultimoEnd) {
        this.ultimoEnd = ultimoEnd;
    }

    public boolean isPresente() {
        return presente;
    }

    public void setPresente(boolean presente) {
        this.presente = presente;
    }
}
