package renshu1kaime;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Renshu2 {

	public static void main(String[] args) {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		
		
	}

}


class Calc{
	int x[];//距離計算用。x[]でn次元の長さを表している
	
	public Calc(int x[]) {
		this.x = x;
	}
	
	int[] getX() {
		return x;
	}
	
	public double CalcLong(int[] x) {
		double clc = x[0];
		for(int i = 1;i < x.length;i++) {
			clc *= x[i];
		}
		return clc;
	}
	
}
