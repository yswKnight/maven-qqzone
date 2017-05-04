package org.t1.qqzone.util;

import java.util.UUID;

/**
 * 
 * 
 * 
 * @author Ashy
 * 
 *         获取唯一ID
 *
 */
public class AlbumID {

	public static void main(String[] args) {
		String[] ss = getUUID(1);
		for (int i = 0; i < ss.length; i++) {
			System.out.println(ss[i]);
		}
	}
	
	/**
	 * 
	 * 
	 * @return 获取32位UUID
	 */

	public static String getUUID() {
		String s = UUID.randomUUID().toString();
		// 去掉"-"符号         32位UUid
		return s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
		//return s;
	}

	public static String[] getUUID(int number) {
		if (number < 1) {
			return null;
		}
		String[] ss = new String[number];
		for (int i = 0; i < number; i++) {
			ss[i] = getUUID();
		}
		return ss;
	}
	
	
	//8位
	public static String[] chars = new String[]
	        {
	            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	            "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
	            "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V","W", "X", "Y", "Z"
	        }; 
	 
	    public static String getShortUuid()
	    { 
	        StringBuffer stringBuffer = new StringBuffer(); 
	        String uuid = UUID.randomUUID().toString().replace("-", ""); 
	        for (int i = 0; i < 8; i++)
	        { 
	            String str      = uuid.substring(i * 4, i * 4 + 4); 
	            int strInteger  = Integer.parseInt(str, 16); 
	            stringBuffer.append(chars[strInteger % 0x3E]); 
	        } 
	         
	        return stringBuffer.toString(); 
	    }

}
