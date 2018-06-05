package renshu1kaime;

import java.util.Scanner;

public class Main {
	 
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		
		Scanner input = new Scanner(System.in);
		
		String into  = input.next();
		char longer;
		
		while(into != null) {
			int i = into.length();
			
			if(i % 2 == 0 && i != 0) {
				longer = into.charAt((i/2)-1);
				into.replace(into.charAt((i/2)-1), into.charAt(0));
				into.replace(into.charAt(0), longer);
				longer = into.charAt((i/2));
				into.replace(into.charAt((i/2)), into.charAt(i));
				into.replace(into.charAt(i), longer);
			}else if(i % 2 == 1 && i > 3) {
				longer = into.charAt((i/2)-1);
				into.replace(into.charAt((i/2)-1), into.charAt(0));
				into.replace(into.charAt(0), longer);
				longer = into.charAt((i/2)+1);
				into.replace(into.charAt((i/2)+1), into.charAt(i-1));
				into.replace(into.charAt(i-1), longer);
			}
			
			for(int j = 0;j < i;j++) System.out.print(into.charAt(j));
			
			into  = input.next();
			System.out.println();
			
		}
		
		System.exit(0);
	}
 
 
}

/*public class Main {
	 
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		
		String input = new Scanner(System.in).nextLine();
		
		char[] into  = input.toCharArray();
		char longer;
		
		while(into != null) {
			int i = into.length;
			
			if(i==0) {
				
			}else if(i % 2 == 0) {
				longer = into[(i/2)-1];
				into[(i/2)-1] = into[0];
				into[0]=longer;
				longer = into[i/2];
				into[i/2] = into[i-1];
				into[i-1] = longer;
			}else if(i % 2 == 1 && i != 1) {
				longer = into[(i/2)-1];
				into[(i/2)-1] = into[0];
				into[0]=longer;
				longer = into[i/2+1];
				into[i/2+1] = into[i-1];
				into[i-1] = longer;	
			}
			
			for(char c:into) System.out.print(c);
			
			input = Scanner(System.in).nextLine();
			into  = input.toCharArray();
			System.out.println();
			
		}
		
		System.exit(0);
	}
 
 
}
*/

/*	public static void main(String[] args) throws IOException {
		
		//String input = new Scanner(System.in).nextLine();
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		String input = null;
		char longer;
		int i;
		
		input = in.readLine();
		char[] into = null;
		while(input!=null) {
			into  = input.toCharArray();
			i = into.length;
			
			if(i==0) {
				System.exit(0);
			}else if(i % 2 == 0) {
				longer = into[(i/2)-1];
				into[(i/2)-1] = into[0];
				into[0]=longer;
				longer = into[i/2];
				into[i/2] = into[i-1];
				into[i-1] = longer;
			}else if(i % 2 == 1 && i != 1) {
				longer = into[(i/2)-1];
				into[(i/2)-1] = into[0];
				into[0]=longer;
				longer = into[i/2+1];
				into[i/2+1] = into[i-1];
				into[i-1] = longer;	
			}
			
			for(char c:into) System.out.print(c);
			
			System.out.println();
			input = in.readLine();
		}
		
		
		System.out.println();
		System.exit(0);
	}
*/

