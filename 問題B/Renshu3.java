package renshu1kaime;

import java.util.Scanner;

public class Renshu3 {

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		Scanner scn = new Scanner(System.in);
		int ran = scn.nextInt();
		int[] arpha = new int[ran];
		
		
		for(int i = 0;i < ran;i++) {
			arpha[i] = scn.nextInt();
		}
		
		
		//for(int i = 0;i < ran;i++) {
		//	arpha[i] = (int)(Math.random()*100)+1;
		//}
		
		
		R3Qsort qs =  new R3Qsort();
		qs.setX(arpha);
		qs.quick_sort(0, ran-1);
		arpha = qs.getX();
		
		R3calc c = new R3calc();
		System.out.println(c.Calc(arpha));
		
	}
	
	

}

class R3Qsort{
	int[] x;
	int[] s;
	
	public void setX(int[] x) {
		this.x =x;
	}
	
	public int[] getX() {
		return x;
	}
	
	public void quick_sort(int left, int right) {
	        if (left>=right) {
	            return;
	        }
	        int p = x[(left+right)/2];
	        int l = left, r = right, tmp;
	        while(l<=r) {
	            while(x[l] < p) { l++; }
	            while(x[r] > p) { r--; }
	            if (l<=r) {
	                tmp = x[l]; x[l] = x[r]; 
	                x[r] = tmp;
	                l++; r--;
	            }
	        }
	        quick_sort(left, r);  // ピボットより左側をクイックソート
	        quick_sort(l, right); // ピボットより右側をクイックソート
	    }
	
	
}

class R3calc{
	public int Calc(int[] arpha) {
		
		int first;
		int count = 0;
		int max = 1;
		int save = 0;
		
		for(int i = 0;i<arpha.length;i++) {
			first = arpha[i];
			while(arpha[i]==first) {
				i++;
				count++;
				save++;
				if(i==arpha.length) break;
			}
			while(i<arpha.length && (arpha[i]==first+1 || arpha[i]==first+2)) {
				i++;
				count++;
				if(i==arpha.length) break;
			}
			if(max<=count) max = count;
			
			count = 0;
			
			i = save -1;
		}
		return max;
	}
}
		
		/*while(true) {
			
			first = arpha[i];//一番最初の比較相手を入れる
			while(arpha[i]==first&&i<arpha.length-2){
				i++;
				count++;
			}
			
			save = i;
			if((arpha[i] == first+1 || arpha[i] == first+2)&&i<arpha.length-1) { 
			//比較相手と1違う値か、一下げたら一致するかどうかを確認する
				
				second = arpha[i];//二番最初の比較相手を入れる
				while(arpha[i] == second&&i<arpha.length-1) { 
					i++;
					count++;
				}

				if(arpha[i]==second+1&&i<arpha.length) {
					while((arpha[i]==second+1)&&(i<arpha.length-1)) {
						i++;
						count++;
					}
				}
			}
			if(max <= count)	max = count;
			
			count = 0;
			i = save;
			
			if(i < arpha.length-3) break;
		}*/
	

/*
 	コピペしてきたもの、クイックソートアルゴリズム
 	static void quick_sort(int[] d, int left, int right) {
        if (left>=right) {
            return;
        }
        int p = d[(left+right)/2];
        int l = left, r = right, tmp;
        while(l<=r) {
            while(d[l] < p) { l++; }
            while(d[r] > p) { r--; }
            if (l<=r) {
                tmp = d[l]; d[l] = d[r]; d[r] = tmp;
                l++; r--;
            }
        }
        quick_sort(d, left, r);  // ピボットより左側をクイックソート
        quick_sort(d, l, right); // ピボットより右側をクイックソート
    }
*/


