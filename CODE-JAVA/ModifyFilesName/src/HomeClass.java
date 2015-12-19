import java.io.IOException;
import java.util.ArrayList;

import jxl.read.biff.BiffException;

import com.excelldealer.ExcellReader;
import com.filedealer.CopyFile;
import com.filedealer.FileHandler;

public class HomeClass {
	
/**
 * 
 *  记录 本代码用于给我下载的书籍修改名称,要注意的地方是：在java中给文件重新命名的是时候，名称不应该出现 ：/ \  其他情况还没有碰到，
 */

	/**
	 * @param args
	 * @throws IOException
	 * @throws BiffException
	 */
	public static void main(String[] args) throws BiffException, IOException {
		// TODO Auto-generated method stubs
		//
		String booksPathString = "F:\\IT-EBOOK\\books\\bookss";// F:\IT-EBOOK\books\bookss
		String oldbookSuperPath = "F:\\IT-EBOOK\\books\\bookss\\";// F:\IT-EBOOK\books\bookss
		String newbookSuperPath = "F:\\IT-EBOOK\\books\\copyBooks\\";// F:\IT-EBOOK\books\bookss
		CopyFile copyFile = new CopyFile();

		FileHandler fileHandler = new FileHandler();
		String[] nameStrings = FileHandler.getFileName(booksPathString);
		for (int i = 0; i < nameStrings.length; i++) {
			System.out.println(i);
			FileHandler.myPrintln(nameStrings[i]);
		}
		//
		// 读取Excel 文件 C:\Users\Administrator\Desktop
		ExcellReader excellReader = new ExcellReader();
		String pathString = "F:\\IT-EBOOK\\union\\6000.xls";// F:\\IT-EBOOK\\union\\1000\\1000-2000

		ArrayList<String> bookNamesArrayList = excellReader
				.GetBookNameAndDownLoadCode(pathString, 2);
		ArrayList<String> bookDownLodesArrayList = excellReader
				.GetBookDownLoadCodes(pathString, 8);

		for (int i = 0; i < bookNamesArrayList.size(); i++) {

			String bookName = bookNamesArrayList.get(i);
			String bookDownCodeString = bookDownLodesArrayList.get(i);
			FileHandler.myPrintln(bookDownCodeString);

		}
		for (int i = 0; i < nameStrings.length; i++) {
			String currentBookNameString = nameStrings[i];
			String lastBookNameString = getNameOfBook(currentBookNameString,
					bookNamesArrayList, bookDownLodesArrayList);
			FileHandler.myPrintln("原来：" + currentBookNameString + "      现在： "
					+ lastBookNameString);

			fileHandler.renameFile(booksPathString, currentBookNameString,
					lastBookNameString);

		}

	}

	/**
	 * 获取更改的名称
	 * 
	 * @param bookNamet
	 * @param bookNamesList
	 * @param downloadCodesList
	 * @return
	 */
	public static String getNameOfBook(String bookNamet,
			ArrayList<String> bookNamesList, ArrayList<String> downloadCodesList) {

		String bookName = bookNamet;
		if (bookNamet.contains(".")) {

			String[] ssStrings = bookNamet.split("\\.");
			bookName = ssStrings[0];
			FileHandler.myPrintln(bookName);
		}

		String nameString = null;
		for (int i = 0; i < bookNamesList.size(); i++) {

			String nameString2 = bookNamesList.get(i);
			String nameString3 = downloadCodesList.get(i);

			if (bookName.equals(nameString2) || bookName.equals(nameString3))
				nameString = nameString2;
		}
		return nameString + ".pdf";

	}
}
