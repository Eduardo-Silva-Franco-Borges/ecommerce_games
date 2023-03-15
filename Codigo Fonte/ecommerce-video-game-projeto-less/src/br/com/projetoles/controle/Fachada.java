package br.com.projetoles.controle;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.projetoles.dao.CartaoDAO;
import br.com.projetoles.dao.EnderecoDAO;
import br.com.projetoles.dao.IDAO;
import br.com.projetoles.dao.PessoaDAO;
import br.com.projetoles.domain.Cartao;
import br.com.projetoles.domain.Endereco;
import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;
import br.com.projetoles.domain.Result;

public class Fachada implements IFachada {
	Result Result = null;
	private Map<String, IDAO> daos;
	private Map<String, List<IStrategy>> rns;
	
	public Fachada() {
		definirDAOS();
		definirRNS();

	}
	
	
	private void definirDAOS() {
		daos = new HashMap<String, IDAO>();
		daos.put(Pessoa.class.getName(), new PessoaDAO());
		daos.put(Endereco.class.getName(), new EnderecoDAO());
		daos.put(Cartao.class.getName(), new CartaoDAO());
	}
	
	private void definirRNS() {
		rns = new HashMap<String, List<IStrategy>>();

		ValidarDadosObrigatoriosCliente vCliente = new ValidarDadosObrigatoriosCliente();
		ValidarCpf vCpf = new ValidarCpf();
		ValidarExistenciaCliente vExistenciaCliente = new ValidarExistenciaCliente();
		ValidarTerritorioNacional vTerritorioNacional = new ValidarTerritorioNacional();
		ValidarDadosObrigatorios vDados = new ValidarDadosObrigatorios();
		

		List<IStrategy> rnsCliente = new ArrayList<IStrategy>();
		rnsCliente.add(vCliente);
		rnsCliente.add(vCpf);
		rnsCliente.add(vExistenciarCliente);
		rnsCliente.add(vTerritorioNacional);

		rns.put(Cliente.class.getName(), rnsCliente);
	}
	
	@Override
	public Result cadastrar(EntidadeDominio entidade) {
		Result result = new Result();
		
		String nmClasse = entidade.getClass().getName();
		
		String msg = executarRegras(entidade);
		
		if (msg == null) {		
			IDAO dao = daos.get(nmClasse);
			
			dao.salvar(entidade);
			return result;
		}else{
			return msg;
		}
		
	}

	@Override
	public Result alterar(EntidadeDominio entidade) {
		Result result = new Result();
		
		String nmClasse = entidade.getClass().getName();
		
		String msg = executarRegras(entidade);
		
		if (msg == null) {		
			IDAO dao = daos.get(nmClasse);
			
			dao.alterar(entidade);

			return Result;
		}else{
			return msg;
		}

			
			
	}

	@Override
	public Result excluir(EntidadeDominio entidade) {
		
		return Result;
	}

	@Override
	public Result consultar(EntidadeDominio entidade) {
		Result result = new Result();
		String nmClass = entidade.getClass().getName();
		List<EntidadeDominio> listaRetorno = null;
		IDAO dao = daos.get(nmClass);
		
		listaRetorno = dao.consultar(entidade);
		result.setEntities(listaRetorno);
		
		return result;
	}
	
	
	private String executarRegras(EntidadeDominio entidade) {
		String nmClasse = entidade.getClass().getName();
		StringBuilder msg = new StringBuilder();

		List<IStrategy> regras = rns.get(nmClasse);

		if (regras != null) {
			for (IStrategy s : regras) {
				String m = s.processar(entidade);

				if (m != null) {
					msg.append(m);
					//msg.append("\n");
				}
			}
		}

		if (msg.length() > 0)
			return msg.toString();
		else
			return null;
	}

}
