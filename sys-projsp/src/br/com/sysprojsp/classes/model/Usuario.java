package br.com.sysprojsp.classes.model;

public class Usuario {

	private Long id;
	private String primeironome;
	private String sobrenome;
	private String ultimonome;
	private String email;
	private String telefone;
	private String login;
	private String senha;
	private boolean ativo;
	private String perfil;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPrimeironome() {
		return primeironome;
	}

	public void setPrimeironome(String primeironome) {
		this.primeironome = primeironome;
	}

	public String getSobrenome() {
		return sobrenome;
	}

	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}

	public String getUltimonome() {
		return ultimonome;
	}

	public void setUltimonome(String ultimonome) {
		this.ultimonome = ultimonome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

}
