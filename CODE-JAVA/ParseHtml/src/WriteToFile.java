import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class WriteToFile {

//	д������
 static	public void WriteContentToFile(String content, String fileName) {
		Writer out = null;
		try {
			out = new FileWriter(fileName, false);
		} catch (IOException e) {
			e.printStackTrace();
		} // true��ʾ׷�� 
		String str = content;
		try {
			out.write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// ׷������
 static	public void appendContentToFile(String content, String fileName) {
		Writer out = null;
		try {
			out = new FileWriter(fileName, true);
		} catch (IOException e) {
			e.printStackTrace();
		} // true��ʾ׷�� String str = "\r\n���\r\nHello World!"; out.writer(str);
		String str = content;
		try {
			out.write("\r\n"+str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// �����ļ��е�����
	public static String readContentFromFile(String fileName) {
		FileReader reader = null;
		try {
			 reader = new FileReader(new File(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		BufferedReader bufferedReader = new BufferedReader(reader);
		String str = null;
		try {
		 str = bufferedReader.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return str;
	}
	
	
}
