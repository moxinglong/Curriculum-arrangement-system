package com.course.utils;

import java.util.Random;

public class MyPke {

	/**
 	 * 随机指定范围内 n 个不重复的数
 	 * 在初始化的无重复待选数组中随机产生一个数放入结果中，
 	 * @param max  指定范围最大值
 	 * @param min  指定范围最小值
 	 * @param n  随机数个数
 	 */
	public static String randomArray(int min,int max,int n){		
 		int len = max - min + 1;		
 		if(max < min || n > len){
 			return null;
 		}
 		
 		//初始化给定范围的待选数组
 		int[] source = new int[len];
         for (int i = min; i < min + len; i++){
         	source[i-min] = i;
         }
         
         int[] result = new int[n];
         Random rd = new Random();
         int index = 0;
         for (int i = 0; i < result.length; i++) {
         	//待选数组0到(len-2)随机一个下标
             index = Math.abs(rd.nextInt() % len--);
             //将随机到的数放入结果集
             result[i] = source[index];
             //将待选数组中被随机到的数，用待选数组(len-1)下标对应的数替换
             source[index] = source[len];
         }
         String randidstr = "";
    		for(int i=0;i<n-1;i++)randidstr+=result[i]+",";
    		randidstr+=result[n-1];
    		return randidstr;
         //return result;
 	}
	
	/**
	 * 三个数中随机抽取两个数
	 */
	public static int[] three_3(int a,int b,int c){
		String s = randomArray(1,3,2);
		String[] sArray = s.split(",");
		//返回的数组
		int rArray[] = new int[2];
		int sum = Integer.parseInt(sArray[0]) + Integer.parseInt(sArray[1]);
		if(sum == 3){
			rArray[0] = a;rArray[1] = b;
		}else if(sum == 4){
			rArray[0] = a;rArray[1] = c;
		}else{
			rArray[0] = b;rArray[1] = c;
		}
		return rArray;
	}
	
	/**
	 * 
	 * @param s: 数组
	 * @return: 返回每列中的随机一个数字
	 */
	public static int rand2(String[] s){
		int a[] = new int[s.length];
		for(int i = 0;i < s.length; i++){
			a[i] = Integer.parseInt(s[i]);
		}
		Random random = new Random();
		int num = 0;
		int n = 0;
		while(n < 1){
			int index = random.nextInt(a.length);
			if(a[index] == 0){
				continue;
			}else{
				num = a[index];
				n++;
			}
		}       
        return num;
	}
	
	/**
	 * 随机抽取 n 个数
	 * @param s ：要抽数的数组
	 */
	public static int[] rand(String[] s,int n){
		boolean flag = false;
		int a[] = new int[12];
		String[] str =  randomArray(0,6,n).split(",");
		for(int i = 0;i < str.length; i++){
			int num = 0;
			String[] ss = s[Integer.parseInt(str[i])].split(",");
			for(int j = 0;j < ss.length;j ++){
				if(Integer.parseInt(ss[j]) == 0){
					num ++;
				}
			}
			if(num > 12){
				flag = true;
			}
		}
		if(flag){
			rand(s,n);
		}else{
			for(int i = 0,k = 0;i < str.length;i ++){
				int l = Integer.parseInt(str[i]);
				String[] str2 = s[l].split(",");

				String[] s1 = new String[str2.length/2];
				String[] s2 = new String[str2.length/2];
				
				for(int j = 0,f = 0;j < str2.length; j += 2,f++){
					s1[f] = str2[j];
					s2[f] = str2[j+1];
				}
				a[k] = rand2(s1);k++;
				a[k] = rand2(s2);k++;
			}
		}
		return a;
	}
	
	/**
	 * 班级数目较多时
	 * @param s:穿进来的7组数据(每三列为一组)
	 * @param n:随机抽取6个组
	 */
	public static int[] rand3(String[] s,int n){
		int m[] = new int[147];
		for(int i = 0;i < m.length; i++){
			m[i] = i + 1;
		}
		int a[] = new int[12];
		//记录随机抽到的6个数字拼成的字符串，并根据 "," 分割成6个数字
		String[] str =  randomArray(0,6,n).split(",");
		//判断相邻两个板块中为 “0” 的个数是否超过18个，超过则重新排序
		for(int i = 0;i < str.length; i++){
			int s_no = Integer.parseInt(str[i]);			
			//如果该组为 0 的数目 >=18 个,把该组的数据记下来，判断是否三列中有两列都为0
			String[] check = s[s_no].split(",");
			int sum = 0,sum2 = 0,sum3 = 0;
			for(int var = 0;var < check.length;var += 3){
				sum += Integer.parseInt(check[var]);
				sum2 += Integer.parseInt(check[var+1]);
				sum3 += Integer.parseInt(check[var+2]);
			}
			//如果是，排除该组
			if((sum == 0&&sum2 == 0)||(sum == 0&&sum3 == 0)||(sum2 == 0&&sum3 == 0)){
				best(m);
			}
			//如果不是，继续操作				
		}
		
		//在三列中随机抽取两个数
		for(int i = 0,k = 0;i < str.length;i ++){
			int l = Integer.parseInt(str[i]);
			String[] str2 = s[l].split(",");

			String[] s1 = new String[str2.length/3];
			String[] s2 = new String[str2.length/3];
			String[] s3 = new String[str2.length/3];
			
			for(int j = 0,f = 0;j < str2.length; j += 3,f++){
				s1[f] = str2[j];
				s2[f] = str2[j+1];
				s3[f] = str2[j+2];
			}			
			
			int s1_no = 0,s2_no = 0,s3_no = 0;
			
			for(int h = 0;h < s1.length; h++){
				if(Integer.parseInt(s1[h]) == 0){
					s1_no ++;
				}
				if(Integer.parseInt(s2[h]) == 0){
					s2_no ++;
				}
				if(Integer.parseInt(s3[h]) == 0){
					s3_no ++;
				}
			}
			
			if(s1_no == 7){
				a[k] = rand2(s2);k++;
				a[k] = rand2(s3);k++;
			}else if(s2_no == 7){
				a[k] = rand2(s1);k++;
				a[k] = rand2(s3);k++;
			}else if(s3_no == 7){
				a[k] = rand2(s1);k++;
				a[k] = rand2(s2);k++;
			}else{
				int three[] = new int[2];
				three = three_3(rand2(s1),rand2(s2),rand2(s3));
				a[k] = three[0];k++;
				a[k] = three[1];k++;
			}
											
		}	
		
		return a;
	}
	
	
	/**
	 * 当参与排课的班级 <=7 个班 时
	 * 每天的晚上不参与排课
	 */
	public static int[] pke1(int[] a){
		//创建字符串数组，每个元素的值等于每天的上下午的值
		String str[] = new String[7];
		int k = 0;
		int b[] = new int[12];
		for(int i = 0;i < str.length; i++){
			for(int j = k;j < a.length;j += 21){
				if(str[i] == null){
					str[i] = a[j]+","+a[j+1];
				}else{
					str[i] = str[i]+","+a[j]+","+a[j+1];
				}				
			}
			k += 3;
		}
		
		b = rand(str,6);
		
		return b;
	}
	
	/**
	 * 最多只能排 9 个班级
	 * 每天的晚上也参与排课
	 */
	public static int[] pke2(int a[]){
		//创建字符串数组，每个元素的值等于每天的上下午的值
		String str[] = new String[7];
		int k = 0;
		int b[] = new int[12];
		for(int i = 0;i < str.length; i++){
			for(int j = k;j < a.length;j += 21){
				if(str[i] == null){
					str[i] = a[j]+","+a[j+1]+","+a[j+2];
				}else{
					str[i] = str[i]+","+a[j]+","+a[j+1]+","+a[j+2];
				}				
			}
			k += 3;
		}
		b = rand3(str,6);
		return b;
	}
	
	//循环找到最优解
	public static int[][] best(int[] a){
		int model[] = new int[a.length];
		model = a;
		int b[] = new int[12];
		int c[][] = new int[9][12];
		String str[] = new String[7];
		int x = 0,y = 0;
		int g = 0;
		for(int k = 0;k < 8;k++){
			b = pke2(a);
			for(int i = 0;i < b.length; i++){
				c[y][i] = b[i];
			}
			y++;
			for(int i = 0;i < a.length; i++){
				for(int j = 0;j < b.length; j++){
					if(b[j] == a[i]){
						a[i] = 0;
					}
				}
			}
		}
		// 查询第9种排序开始
		for(int i = 0;i < str.length ; i++){
			for(int j = g ;j < a.length;j += 21){
				if(str[i] == null){
					str[i] = a[j]+","+a[j+1]+","+a[j+2];
				}else{
					str[i] = str[i]+","+a[j]+","+a[j+1]+","+a[j+2];
				}				
			}
			g += 3;
			String[] str2 = str[i].split(",");

			String[] s1 = new String[str2.length/3];
			String[] s2 = new String[str2.length/3];
			String[] s3 = new String[str2.length/3];
			
			for(int j = 0,f = 0;j < str2.length; j += 3,f++){
				s1[f] = str2[j];
				s2[f] = str2[j+1];
				s3[f] = str2[j+2];
			}
			
			int sum = 0,sum2 = 0,sum3 = 0;
			for(int var = 0;var < s1.length;var ++){
				sum  += Integer.parseInt(s1[var]);
				sum2 += Integer.parseInt(s2[var]);
				sum3 += Integer.parseInt(s3[var]);
			}
			if((sum != 0&&sum2 != 0)||(sum != 0&&sum3 != 0)||(sum2 != 0&&sum3 != 0)){
				x++;
			}
		}
		if(x < 6){
			best(model);
		}else{			
			b = pke2(a);
			for(int i = 0;i < b.length; i++){
				c[y][i] = b[i];
			}
			y++;
			for(int i = 0;i < a.length; i++){
				for(int j = 0;j < b.length; j++){
					if(b[j] == a[i]){
						a[i] = 0;
					}
				}
			}
		}
		// 查询第9种排序结束
		return c;
	}
	
	public static int[] start(int[] a,int type) {
		int b[] = new int[12];
		//pke1(a) 班级较少的算法
		//pke2(a) 班级较多的算法
		if(type == 0){
			b = pke1(a);
		}else{
			b = pke2(a);
		}		
		return b;
	}

}

