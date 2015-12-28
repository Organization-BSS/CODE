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
//		String from = "F:\\I_Work\\Gis221Data\\VillageNames\\�ܺ�ѧԺ.110115109286";
//		String to = "F:\\I_Work\\Gis221Data\\Vi";
//		fileMove(from, to);
	}

	// �޸ĳɴ���river �� road��village�ı��
	static void ModifyName() {

		String directoryPath = "F:\\I_Work\\Gis221Data\\GisData\\DataResult\\Village";
		String markString = "village.";

		FileHandler fileHandler = new FileHandler();

		String[] fileNames = FileHandler.getFileName(directoryPath);

		// �޸��ļ���
		for (int i = 0; i < fileNames.length; i++) {
			String oldName = fileNames[i];
			String newName = markString + oldName;
			fileHandler.renameFile(directoryPath, oldName, newName);
		}
	}

	// ���ļ��У��Դ���Ϊ�ļ��A����
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

	// �ļ�Ǩ�ƹ���
	static void moveFiles() {
		String oldFileSuperPath = "F:\\I_Work\\Gis221Data\\GisData\\DataResult\\TotalFiles"; // F:\I_Work\Gis221Data\GisData\DataResult\TotalFiles
		String destinationFolderSuperPath = "F:\\I_Work\\Gis221Data\\VillageNames";
		int numberOnHandling = 0;

		// ��ȡĿ���ļ��е�����
		String[] destinationFoldeNames = FileHandler
				.getFileName(destinationFolderSuperPath);

		// ��ȡҪ�ƶ����ļ�������
		String[] oldFileNames = FileHandler.getFileName(oldFileSuperPath);

		for (String string : destinationFoldeNames) {
			String folderName = string;
			numberOnHandling++;
			FileHandler.myPrintln(numberOnHandling + " ������...");
			for (String fileName : oldFileNames) {
				// ��ȡ������
				String[] spliteStrings = fileName.split("\\."); // �Ե�ָ�
				String code = spliteStrings[1]; // ����
				if (folderName.equals(code)) {
					CopyFile copyFile = new CopyFile();
					copyFile.copyFile(oldFileSuperPath + "\\" + fileName,
							destinationFolderSuperPath + "\\" + folderName
									+ "\\" + fileName);
				}
			}
		}
	}

	// �޸������ļ��е�����
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
			FileHandler.myPrintln(numbersOfFolder + " �޸���...");
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

	// ���������ļ���
	static public void createFoldersByThreeLevels() {
		String excelPath = "F:\\I_Work\\Gis221Data\\xzc.xls";
		String superPath = "F:\\I_Work\\Gis221Data\\daxingResult\\����";
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

	// ���ļ��ƶ���Ŀ���ļ�����
	static public void moveFileToVillage() throws Exception {
		String superPath = "F:\\I_Work\\Gis221Data\\daxingResult\\����";
		String villagesPath = "F:\\I_Work\\Gis221Data\\VillageNames";

		String[] villageNames = FileHandler.getFileName(villagesPath); // ��ȡ���еĴ�ׯ�ļ�

		String[] folderNames = FileHandler.getFileName(superPath); // ��ȡ����б�
		for (String folderName : folderNames) {
			String subPath = superPath + "\\" + folderName;
			String[] subFolderNames = FileHandler.getFileName(subPath); // �õ��������б�
			for (String xzcName : subFolderNames) {
				for (String villageName : villageNames) {
					String village_chinese = villageName.split("\\.")[0];
					if (xzcName.equals(village_chinese)) {
						FileHandler.myPrintln("�ƶ�  " + villageName);
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
			// �ļ�һ��
			File[] files = dir.listFiles();
			if (files == null)
				return;
			// Ŀ��
			File moveDir = new File(to);
			if (!moveDir.exists()) {
				moveDir.mkdirs();
			}
			// �ļ��ƶ�
			for (int i = 0; i < files.length; i++) {
				if (files[i].isDirectory()) {
					fileMove(files[i].getPath(), to + "\\" + files[i].getName());
					// �ɹ���ɾ��ԭ�ļ�
					files[i].delete();
				}
				File moveFile = new File(moveDir.getPath() + "\\"
						+ files[i].getName());
				// Ŀ���ļ����´��ڵĻ���ɾ��
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
