
public class ConditionHelper {
	static String indexPathString = "D:/IT-EBOOK/index.txt";

 public static	String address(int i) {
		String addStringPreString = "http://it-ebooks.info/book/";
		String string = String.valueOf(i);
		String abAddressString = addStringPreString + string;// µÿ÷∑
		return abAddressString;
	}
 // startIndex
 public static int startIndex () {
	 String numberString = WriteToFile.readContentFromFile(indexPathString);
	 int index = 500;
	 if(numberString != null)
		 index = Integer.parseInt(numberString) ;
	 return index;
 }
 
 // endIndex
 public static int endIndex () {
	 return ConditionHelper.startIndex()+100;
 }
 
 public static String fileName(int index) {
	String string = "D:/IT-EBOOK/"+String.valueOf(index)+".txt";
	
	return string;
}
}
