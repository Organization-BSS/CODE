package com.filedealer;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

public class FileHandler {

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

	/**
	 * �����ļ���
	 */
	static public void createFolder(String superPath, String folderName) {

		File file = new File(superPath + "\\" + folderName);
		// ����ļ��в������򴴽�
		if (!file.exists() && !file.isDirectory()) {
			System.out.println("//������");
			file.mkdir();
		} else {
			System.out.println("//Ŀ¼����");
		}
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

		if (!oldname.equals(newname)) {// �µ��ļ�������ǰ�ļ�����ͬʱ,���б�Ҫ����������
			String oldPathString = path + "\\" + oldname;
			String newPathString = path + "\\" + deleteColon(newname);

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

					// CopyFile copyFile = new CopyFile();
					// copyFile.copyFile(oldPathString, copyPathString);
				} else {
					oldfile.delete();
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