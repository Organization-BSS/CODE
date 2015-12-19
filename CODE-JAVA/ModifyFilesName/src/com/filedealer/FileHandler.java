package com.filedealer;

import java.io.File;
import java.util.ArrayList;

public class FileHandler {

	String copyPath = "F:\\IT-EBOOK\\books\\copyBooks\\";
	int falseNuber = 0;
	public ArrayList<String> errorFileNameStrings = new ArrayList<String>();
	public ArrayList<String> newFileNameStrings = new ArrayList<String>();

	// 获取文件夹路径下的所有文件名
	public static String[] getFileName(String path) {
		File file = new File(path);
		String[] fileName = file.list();
		return fileName;
	}

	// 获取当前文件夹路径下有多少文件数量
	public Integer fileNumbers(String path) {
		File file = new File(path);
		String[] fileName = file.list();
		return fileName.length;
	}

	/** */
	/**
	 * 文件重命名
	 * 
	 * @param path
	 *            文件目录
	 * @param oldname
	 *            原来的文件名
	 * @param newname
	 *            新文件名
	 */
	public void renameFile(String path, String oldname, String newname) {

		if (oldname.equals("xnsJ5zC.pdf")) {
			myPrintln(newname);
		}
		if (!oldname.equals(newname)) {// 新的文件名和以前文件名不同时,才有必要进行重命名
			String oldPathString = path + "\\" + oldname;
			String newPathString = path + "\\" + deleteColon(newname);
			String copyPathString = copyPath + newname;

			// File oldfile = new File(path + "/" + oldname);
			// File newfile = new File(path + "/" + newname);
			File oldfile = new File(oldPathString);
			File newfile = new File(newPathString);
			if (newfile.exists())// 若在该目录下已经有一个文件和新文件名相同，则不允许重命名
			{
				System.out.println(newname + "已经存在！");
				oldfile.delete();

			} else {
				boolean bo = oldfile.renameTo(newfile);
				System.out.println("modify: " + bo);
				if (!bo) {
					falseNuber++;
					FileHandler.myPrintln("false numbers :" + falseNuber);

					CopyFile copyFile = new CopyFile();
					copyFile.copyFile(oldPathString, copyPathString);
				}
			}
		}
	}

	static public void myPrintln(String string) {
		System.out.println(string);
	}

	/**
	 * 删除冒号
	 * 
	 * @param str
	 * @return
	 */
	static public String deleteColon(String str) {
		String string = str;
		if (string.contains(":")) {
			String[] strings = string.split(":");
			string = strings[0];
			for (int i = 1; i < strings.length; i++) {
				string += "-" + strings[i];
			}
		}

		if (string.contains("\\")) {
			String[] strings = string.split("\\");
			string = strings[0];
			for (int i = 1; i < strings.length; i++) {
				string += "-" + strings[i];
			}
		}

		if (string.contains("/")) {
			String[] strings = string.split("/");
			string = strings[0];
			for (int i = 1; i < strings.length; i++) {
				string += "-" + strings[i];
			}
		}
		return string;
	}
}