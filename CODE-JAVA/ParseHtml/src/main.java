import java.io.IOException;

import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;


import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class main {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws WriteException 
	 * @throws RowsExceededException 
	 */
	
	
	@SuppressWarnings("unused")
	public void  main(String[] args) {
//		
//		int startIndex = 100;
//		int endIndex = 300;
//		String addStringPreString = "http://it-ebooks.info/book/";
//		for(int i = startIndex;i<endIndex;i++) {
//			String string = String.valueOf(i);
//			String abAddressString = addStringPreString+string;// ��ַ
//			BookNode bookNode = new BookNode();
//			bookNode.loadHtml(abAddressString);
//		}
//		
//		
//		String urlString = "http://www.it-ebooks.info/book/6419/";
//		// TODO Auto-generated method stub
//		System.out.println("fewf");
//
//		Document doc = null;
//		try {
//			doc = Jsoup.connect(urlString).get();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		@SuppressWarnings("unused")
//		String title = doc.title();//����
//		String ti = title.split(" - ")[0];//����
//		
//		String string = doc.toString();
//		System.out.println(string);
//		Element  elements = doc.body();
//		Elements links = doc.getElementsByTag("a");
//		Elements tdsElements = doc.getElementsByTag("td");
//		
//		for (Element link : links) {
//			  String linkHref = link.attr("href");
//			  System.out.println(linkHref);
//			  String linkText = link.text();
//			  System.out.println(linkText);
//			}
//		Elements linkss = doc.select("a[href]"); //����href���Ե�aԪ��
//		for(Element element:links) {
//			
//			
//		}
//			
//		Elements pngs = doc.select("img[src$=.jpg]"); // ��ȡ����
//		for (Element link : pngs) {
//			  String title1 = link.attr("title");
//			  System.out.println(title1);
//			  if(ti.equals(title1))
//				  System.out.println(link.attr("src"));
//			
//			}
//
//		Elements tableElements = doc.getElementsByTag("tbody");
//		Elements despripationElements = doc.select("span[itemprop]");//��ȡ����
//		Elements detailElements = doc.select("b[itemprop]");//��ȡ����ϸ�ڣ����ߣ�ʱ�䣬 e.g
//		Elements sizebElements = doc.getElementsByTag("b");
//		for (Element link : sizebElements) {
//			  String linkText = link.text();
//			  if(linkText.contains("MB")) //��ȡ��С
//			  System.out.println(linkText);
//			}
//		
		
	}

}
