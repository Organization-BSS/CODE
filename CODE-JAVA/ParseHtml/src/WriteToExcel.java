import java.awt.Label;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

/**
 * 
 */

/**
 * @author Administrator
 * 
 */
public class WriteToExcel {

	/**
	 * @throws IOException
	 * @throws WriteException
	 * @throws RowsExceededException
	 * 
	 */
	public WriteToExcel() throws IOException, RowsExceededException,
			WriteException {
		// TODO Auto-generated constructor stub

		OutputStream outputStream = null;

		File filewrite = new File("D:/bfeook3s.xls");
		filewrite.createNewFile();

		try {
			outputStream = new FileOutputStream(filewrite);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WritableWorkbook wwb = Workbook.createWorkbook(outputStream);
		WritableSheet ws = wwb.createSheet("Sheet", 0);

		jxl.write.Label label = new jxl.write.Label(1, 1, "fwe");
		ws.addCell(label);
		wwb.write();
		wwb.close();
		outputStream.close();

	}
}
