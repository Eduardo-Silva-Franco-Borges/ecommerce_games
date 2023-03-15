package br.com.projetoles.negocio;

import br.com.projetoles.domain.EntidadeDominio;
import br.com.projetoles.domain.Pessoa;

public class validarCpf implements IStrategy{
	
	public String process(EntidadeDominio entity) {
		String msg = null;
		String cpf = null;
		Pessoa pessoa = new Pessoa();
		pessoa = (Pessoa)entity;
		
		cpf = pessoa.getCliente().getDocumento().getCodigo();

		
		if(cpf!=null && cpf.length()>0) {
			cpf = cpf.replaceAll("[/. _-]", "");
			if (!cpf.equals("00000000000") && !cpf.equals("11111111111")
					&& !cpf.equals("22222222222") && !cpf.equals("33333333333")
					&& !cpf.equals("44444444444") && !cpf.equals("55555555555")
					&& !cpf.equals("66666666666") && !cpf.equals("77777777777")
					&& !cpf.equals("88888888888") && !cpf.equals("99999999999")
					&& cpf.length()==11)	{
				int digito1 = 0, digito2 = 0;
				for (int i = 0; i < cpf.length() - 2; i++) {
					digito1 += Integer.parseInt(cpf.charAt(i) + "") * (10 - i);
				}
				if (11 - (digito1 % 11) > 9) {
					digito1 = 0;
				} else {
					digito1 = 11 - (digito1 % 11);
				}
	
				for (int j = 0; j < cpf.length() - 1; j++) {
					digito2 += Integer.parseInt(cpf.charAt(j) + "") * (11 - j);
				}
				if (11 - (digito2 % 11) > 9) {
					digito2 = 0;
				} else {
					digito2 = 11 - (digito2 % 11);
				}
				if (!(digito1 == Integer.parseInt(cpf.charAt(cpf.length() - 2) + "")
						&& digito2 == Integer.parseInt(cpf.charAt(cpf.length() - 1)
								+ "")))
					msg = "CPF inválido";
			}else {
				msg = "CPF inválido";
			}
		}
		return msg;
	}
}
