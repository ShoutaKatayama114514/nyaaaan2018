package renshu1kaime;

import java.io.IOException;
import java.util.Scanner;

public class Renshu2 {

	public static void main(String[] args) throws IOException {
		
		@SuppressWarnings("resource")
		Scanner br = new Scanner(System.in);
		
		int j = 0;
		int dimension = br.nextInt();
		long[] inX = new long[dimension];
		long[] inY = new long[dimension];
		long[] x = new long[dimension];
		
		for(int i = 0; i < dimension; i++) {
			inX[i] = br.nextInt();
		}
		
		for(int i = 0;i<dimension;i++) {
			inY[i] = br.nextInt();
		}
		
		for(int i = 0;i<dimension;i++) {
			x[i] = inX[i]-inY[i]; 
			if(x[i]==0) j++;
		}
		
		if(j==dimension) {
			System.exit(1);
		}
		
		Calc c = new Calc(x);
		System.out.println(String.format("%.2f", c.CalcLong()));
		
		
	}

}


class Calc{
	long[] x;//距離計算用。x[]でn次元の長さを表している
	
	public Calc(long[] x) {
		this.x = x;
	}
	
	public double CalcLong() {
		double clc = x[0]*x[0];
		for(int i = 1;i < x.length;i++) {
			clc += x[i]*x[i];
		}
		return Math.sqrt(clc);
	}
	
}
