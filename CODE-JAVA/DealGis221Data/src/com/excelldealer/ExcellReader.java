package com.excelldealer;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class ExcellReader {
	/**
	 * 
	 * @param path
	 *            ：Excel 的全路径**.xlsx
	 * @throws IOException
	 * @throws BiffException
	 */
	public void readExcellFile(String path) {
		Sheet sheet;
		Workbook book = null;
		try {
			book = Workbook.getWorkbook(new File(path));
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 获得第一个工作表对象(excel中sheet的编号从0开始,0,1,2,3,....)
		sheet = book.getSheet(0);

		// 获取行数
		int rows = sheet.getRows();

		// 获取列数
		int columns = sheet.getColumns();

		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < columns; j++) {
				if (j == 2) {
					Cell cell = sheet.getCell(j, i);
					String string = cell.getContents();
					System.out.println("book's title: " + string);
				}
				if (j == 8) {
					Cell cell = sheet.getCell(j, i);
					String string = cell.getContents();
					System.out.println("download address is " + string);
					String codeString = xunLeiDownLoadCode(string); //
				}
			}
		}
	}

	/**
	 * @author Administrator
	 * @param downloadString
	 * @return
	 */
	// 获取迅雷下载码 //http://filepi.com/i/xtyDVc1 xtyDVc1
	public String xunLeiDownLoadCode(String downloadString) {
		if (downloadString == null) {
			System.out.println("没有迅雷下载码");
		}
		String[] arStrings = downloadString.split("/");
		String codeString = arStrings[arStrings.length - 1];
		return codeString;
	}

	/**
	 * @see 获取某一列的所有值
	 * @param path
	 * @return
	 */
	public ArrayList<String> GetBookNameAndDownLoadCode( String path, int column) {
		Sheet sheet;
		ArrayList<String> list = new ArrayList<String>();
		Workbook book = null;
		try {
			book = Workbook.getWorkbook(new File(path));
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 获得第一个工作表对象(excel中sheet的编号从0开始,0,1,2,3,....)
		sheet = book.getSheet(0);

		// 获取行数
		int rows = sheet.getRows();

		// 获取列数
		int columns = sheet.getColumns();

		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < columns; j++) {
				if (j == column) {
					Cell cell = sheet.getCell(j, i);
					String string = cell.getContents();
					list.add(string);
				}
			}
		}
		return list;
	}

	
	/**
	 * @see 获取下载码一列的所有值
	 * @param path
	 * @return
	 */
	public ArrayList<String> GetBookDownLoadCodes( String path, int column) {
		Sheet sheet;
		ArrayList<String> list = new ArrayList<String>();
		Workbook book = null;
		try {
			book = Workbook.getWorkbook(new File(path));
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 获得第一个工作表对象(excel中sheet的编号从0开始,0,1,2,3,....)
		sheet = book.getSheet(0);

		// 获取行数
		int rows = sheet.getRows();

		// 获取列数
		int columns = sheet.getColumns();

		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < columns; j++) {
				if (j == column) {
					Cell cell = sheet.getCell(j, i);
					String string = xunLeiDownLoadCode(cell.getContents());
					list.add(string);
				}
			}
		}
		return list;
	}

}
