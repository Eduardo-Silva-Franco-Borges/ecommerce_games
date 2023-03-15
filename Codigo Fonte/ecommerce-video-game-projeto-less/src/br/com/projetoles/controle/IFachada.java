package br.com.projetoles.controle;




import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Result;

public interface IFachada {

	public Result cadastrar(EntidadeDominio entidade);

	public Result alterar(EntidadeDominio entidade);

	public Result excluir(EntidadeDominio entidade);

	public Result consultar(EntidadeDominio entidade);

	

}
