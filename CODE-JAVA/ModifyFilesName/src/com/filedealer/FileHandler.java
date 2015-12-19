package com.filedealer;

import java.io.File;
import java.util.ArrayList;

public class FileHandler {

	String copyPath = "F:\\IT-EBOOK\\books\\copyBooks\\";
	int falseNuber = 0;
	public ArrayList<String> errorFileNameStrings = new ArrayList<String>();
	public ArrayList<String> newFileNameStrings = new ArrayList<String>();

	// ��ȡ�ļ���·���µ������ļ���
	public static String[] getFileName(String path) {
		File file = new File(path);
		String[] fileName = file.list();
		return fileName;
	}

	// ��ȡ��ǰ�ļ���·�����ж����ļ�����
	public Integer fileNumbers(String path) {
		File file = new File(path);
		String[] fileName = file.list();
		return fileName.length;
	}

	/** */
	/**
	 * �ļ�������
	 * 
	 * @param path
	 *            �ļ�Ŀ¼
	 * @param oldname
	 *            ԭ�����ļ���
	 * @param newname
	 *            ���ļ���
	 */
	public void renameFile(String path, String oldname, String newname) {

		if (oldname.equals("xnsJ5zC.pdf")) {
			myPrintln(newname);
		}
		if (!oldname.equals(newname)) {// �µ��ļ�������ǰ�ļ�����ͬʱ,���б�Ҫ����������
			String oldPathString = path + "\\" + oldname;
			String newPathString = path + "\\" + deleteColon(newname);
			String copyPathString = copyPath + newname;

			// File oldfile = new File(path + "/" + oldname);
			// File newfile = new File(path + "/" + newname);
			File oldfile = new File(oldPathString);
			File newfile = new File(newPathString);
			if (newfile.exists())// ���ڸ�Ŀ¼���Ѿ���һ���ļ������ļ�����ͬ��������������
			{
				System.out.println(newname + "�Ѿ����ڣ�");
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
	 * ɾ��ð��
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