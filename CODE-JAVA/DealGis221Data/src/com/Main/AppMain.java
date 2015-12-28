package com.Main;

import java.io.File;
import java.util.ArrayList;

import com.excelldealer.ExcellReader;
import com.filedealer.CopyFile;
import com.filedealer.FileHandler;

public class AppMain {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		// ModifyName();
		// createFolders();
		// moveFiles();
		// modifyFoldersName();
		// createFoldersByThreeLevels();

		moveFileToVillage();
//		String from = "F:\\I_Work\\Gis221Data\\VillageNames\\总后学院.110115109286";
//		String to = "F:\\I_Work\\Gis221Data\\Vi";
//		fileMove(from, to);
	}

	// 修改成带有river 、 road、village的标记
	static void ModifyName() {

		String directoryPath = "F:\\I_Work\\Gis221Data\\GisData\\DataResult\\Village";
		String markString = "village.";

		FileHandler fileHandler = new FileHandler();

		String[] fileNames = FileHandler.getFileName(directoryPath);

		// 修改文件名
		for (int i = 0; i < fileNames.length; i++) {
			String oldName = fileNames[i];
			String newName = markString + oldName;
			fileHandler.renameFile(directoryPath, oldName, newName);
		}
	}

	// 建文件夹，以代号为文件夾名称
	static void createFolders() {
		String excelPath = "F:\\I_Work\\Gis221Data\\xzc.xls";
		String superPath = "F:\\I_Work\\Gis221Data\\VillageNames";
		int numbersOfFolder = 0;
		ExcellReader excellReader = new ExcellReader();
		ArrayList<String> namesList = excellReader.GetBookDownLoadCodes(
				excelPath, 4);
		for (String string : namesList) {
			numbersOfFolder++;
			FileHandler.myPrintln(numbersOfFolder + "     " + string);
			FileHandler.createFolder(superPath, string);
		}
	}

	// 文件迁移归类
	static void moveFiles() {
		String oldFileSuperPath = "F:\\I_Work\\Gis221Data\\GisData\\DataResult\\TotalFiles"; // F:\I_Work\Gis221Data\GisData\DataResult\TotalFiles
		String destinationFolderSuperPath = "F:\\I_Work\\Gis221Data\\VillageNames";
		int numberOnHandling = 0;

		// 获取目标文件夹的名称
		String[] destinationFoldeNames = FileHandler
				.getFileName(destinationFolderSuperPath);

		// 获取要移动的文件的名称
		String[] oldFileNames = FileHandler.getFileName(oldFileSuperPath);

		for (String string : destinationFoldeNames) {
			String folderName = string;
			numberOnHandling++;
			FileHandler.myPrintln(numberOnHandling + " 处理中...");
			for (String fileName : oldFileNames) {
				// 截取代号码
				String[] spliteStrings = fileName.split("\\."); // 以点分割
				String code = spliteStrings[1]; // 代号
				if (folderName.equals(code)) {
					CopyFile copyFile = new CopyFile();
					copyFile.copyFile(oldFileSuperPath + "\\" + fileName,
							destinationFolderSuperPath + "\\" + folderName
									+ "\\" + fileName);
				}
			}
		}
	}

	// 修改所有文件夹的名称
	static public void modifyFoldersName() {
		String excelPath = "F:\\I_Work\\Gis221Data\\xzc.xls";
		String superPath = "F:\\I_Work\\Gis221Data\\VillageNames";
		int numbersOfFolder = 0;
		FileHandler fileHandler = new FileHandler();
		ExcellReader excellReader = new ExcellReader();
		ArrayList<String> namesList = excellReader.GetBookDownLoadCodes(
				excelPath, 3);
		ArrayList<String> codesList = excellReader.GetBookDownLoadCodes(
				excelPath, 4);
		String[] codes = FileHandler.getFileName(superPath);

		for (String string : codes) {
			numbersOfFolder++;
			FileHandler.myPrintln(numbersOfFolder + " 修改中...");
			for (int j = 0; j < codesList.size(); j++) {
				String codeString = codesList.get(j);
				if (string.equals(codeString)) {
					String chineseName = namesList.get(j);
					String desName = chineseName + "." + string;
					fileHandler.renameFile(superPath, string, desName);
				}

			}

		}

	}

	// 建立三级文件夹
	static public void createFoldersByThreeLevels() {
		String excelPath = "F:\\I_Work\\Gis221Data\\xzc.xls";
		String superPath = "F:\\I_Work\\Gis221Data\\daxingResult\\大兴";
		int numbersOfFolder = 0;
		ExcellReader excellReader = new ExcellReader();
		ArrayList<String> xzList = excellReader.GetBookDownLoadCodes(excelPath,
				2);
		ArrayList<String> xzcList = excellReader.GetBookDownLoadCodes(
				excelPath, 3);
		for (String xzcName : xzcList) {
			numbersOfFolder++;
			FileHandler.myPrintln(numbersOfFolder + "     " + xzcName);
			FileHandler
					.createFolder(superPath, xzList.get(numbersOfFolder - 1));
			String paString = superPath + "\\"
					+ xzList.get(numbersOfFolder - 1);
			FileHandler.createFolder(paString, xzcName);

		}
	}

	// 将文件移动到目标文件夹下
	static public void moveFileToVillage() throws Exception {
		String superPath = "F:\\I_Work\\Gis221Data\\daxingResult\\大兴";
		String villagesPath = "F:\\I_Work\\Gis221Data\\VillageNames";

		String[] villageNames = FileHandler.getFileName(villagesPath); // 获取所有的村庄文件

		String[] folderNames = FileHandler.getFileName(superPath); // 获取镇的列表
		for (String folderName : folderNames) {
			String subPath = superPath + "\\" + folderName;
			String[] subFolderNames = FileHandler.getFileName(subPath); // 得到村名的列表
			for (String xzcName : subFolderNames) {
				for (String villageName : villageNames) {
					String village_chinese = villageName.split("\\.")[0];
					if (xzcName.equals(village_chinese)) {
						FileHandler.myPrintln("移动  " + villageName);
						String from = villagesPath + "\\" + villageName;
						String to = superPath + "\\" + folderName + "\\"
								+ xzcName;
						fileMove(from, to);

					}

				}

			}

		}

	}

	public static void fileMove(String from, String to) throws Exception {
		try {
			File dir = new File(from);
			// 文件一览
			File[] files = dir.listFiles();
			if (files == null)
				return;
			// 目标
			File moveDir = new File(to);
			if (!moveDir.exists()) {
				moveDir.mkdirs();
			}
			// 文件移动
			for (int i = 0; i < files.length; i++) {
				if (files[i].isDirectory()) {
					fileMove(files[i].getPath(), to + "\\" + files[i].getName());
					// 成功，删除原文件
					files[i].delete();
				}
				File moveFile = new File(moveDir.getPath() + "\\"
						+ files[i].getName());
				// 目标文件夹下存在的话，删除
				if (moveFile.exists()) {
					moveFile.delete();
				}
				files[i].renameTo(moveFile);
			}
		} catch (Exception e) {
			throw e;
		}
	}

}
