package br.com.projetoles.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String getFormatedDate(Date date) {
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		return formato.format(date);
	}
	public static String getFormatedDateBrasil(Date date) {
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		return formato.format(date);
	}

	public static Date setDate(String birthDate) {
		if (birthDate != null && birthDate.length() > 0) {
			try {
				return new SimpleDateFormat("yyyy-MM-dd").parse(birthDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
}
