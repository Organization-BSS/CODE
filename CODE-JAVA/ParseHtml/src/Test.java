import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.net.MalformedURLException;
import java.rmi.server.LoaderHandler;
import java.util.StringTokenizer;
import java.util.Timer;
import java.util.TimerTask;

/**
 * 
 */

/**
 * @author Administrator
 * 
 */
public class Test {

	/**
	 * @param args
	 */

	public static void load() {
		int startIndex = ConditionHelper.startIndex();
		int endIndex = ConditionHelper.endIndex();

		WriteToFile.WriteContentToFile(String.valueOf(endIndex),
				ConditionHelper.indexPathString);
		
		for (int i = startIndex; i < endIndex; i++) {
			BookNode bookNode = new BookNode();
			bookNode.loadHtml(ConditionHelper.address(i));
			String content = bookNode.log();
			if(content != null)
			WriteToFile
					.appendContentToFile(content, ConditionHelper.fileName(startIndex));
			if(endIndex==i+1)
			{
				timer1();
			}

		}
	}

	public static void main(String[] args) {
//		load();
		unionFiles();
	}
	 public static void timer1() {
	        Timer timer = new Timer();
	        timer.schedule(new TimerTask() {
	            public void run() {
	                System.out.println("-------设定要指定任务--------");
	                load();
	            }
	        }, 500);// 设定指定的时间time,此处为2000毫秒 1miao 100haomiao
	    }

	 public static void unionFiles() {
		 String fileName = "D:/IT-EBOOK/";
		 int startIndex = 1000;
		 int nu = 1000;
		 
		 for(int i = startIndex;i<startIndex+1000;i =i+100){
			 String string = String.valueOf(i);
				File file = new File(fileName+string);
				BufferedReader reader = null;

				try {
					reader = new BufferedReader(new FileReader(file));

					String content = null;

					while ((content = reader.readLine()) != null) {

						System.out.println(content);

					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (reader != null) {
						try {
							reader.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}		 

		 }

			
	 }
	

}
