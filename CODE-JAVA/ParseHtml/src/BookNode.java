import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class BookNode {

	static String addressPrexString = "http://it-ebooks.info";

	private String bookTitle;
	private String author;
	private String year;
	private String size;
	private String imageAddress;
	private String page;
	private String downloadAddress;
	private String publisher;
	private String ISBN;
	private String bookIndex;

	public String getBookIndex() {
		return bookIndex;
	}

	public void setBookIndex(String bookIndex) {
		this.bookIndex = bookIndex;
	}

	public String getBookAddress() {
		return bookAddress;
	}

	public void setBookAddress(String bookAddress) {
		this.bookAddress = bookAddress;
	}

	private String detail;
	private String format;
	private String language;
	private String bookAddress;

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getImageAddress() {
		return imageAddress;
	}

	public void setImageAddress(String imageAddress) {
		this.imageAddress = imageAddress;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getDownloadAddress() {
		return downloadAddress;
	}

	public void setDownloadAddress(String downloadAddress) {
		this.downloadAddress = downloadAddress;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	// load url
	@SuppressWarnings("unused")
	public void loadHtml(String urlString) {

		bookAddress = urlString;
		// System.out.println("book address: " + bookAddress);

		String[] addsStrings = urlString.split("/");
		bookIndex = addsStrings[addsStrings.length - 1];
		// System.out.println("book index:"+bookIndex);

		Document doc = null;
		try {
			doc = Jsoup.connect(urlString).timeout(34443000).get();
		} catch (IOException e) {
			e.printStackTrace();
			for (int i = 0; i < 100; i++) {
				try {
					doc = Jsoup.connect(urlString).timeout(3000000).get();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				System.out.println("������");

			}

		}
		System.out.println(doc.text());
		@SuppressWarnings("unused")
		String title = doc.title();// ����
		bookTitle = title.split(" - ")[0];
		// System.out.println("book name: " + bookTitle);
		if (bookTitle.equals("IT eBooks")) // ��ʾû�и�ҳ
			return;

		Elements linkss = doc.select("a[href]"); // ����href���Ե�aԪ��
		Elements pics = doc.select("img[src$=.jpg]"); // ��ȡ����
		for (Element link : pics) {
			String title1 = link.attr("title");
			if (bookTitle.equals(title1)) {
				imageAddress = addressPrexString + link.attr("src");
				// System.out.println("�����ַ��" + imageAddress);
			}
		}

		// ��ȡ����
		Elements despripationElements = doc.select("span[itemprop]");// ��ȡ����
		Element deElement = despripationElements.first();
		detail = deElement.text();

		// ��ȡ����ϸ�ڣ����ߣ�ʱ�䣬 e.g
		Elements detailElements = doc.select("b[itemprop]");
		int j = 0;
		for (Element de : detailElements) {
			j++;
			String text = de.text();
			// System.out.println("������" + de.text());
			switch (j) {
			case 1:
				author = text;

				break;
			case 2:
				ISBN = text;

				break;
			case 3:
				year = text;

				break;

			case 4:
				page = text;

				break;
			case 5:
				language = text;
				break;
			case 6:
				format = text;

			default:
				break;
			}
		}

		// �@ȡ��С
		Elements sizebElements = doc.getElementsByTag("b");
		for (Element sizeElement : sizebElements) {
			String linkText = sizeElement.text();
			if (linkText.contains("MB")) // ��ȡ��С
			{
				// System.out.println("file size:" + linkText);
				size = linkText;
			}
		}

		Elements hrefs = doc.select("a[href]"); // Ѱ�� ���ص�ַ
		for (Element element : hrefs) {
			String hrefString = element.attr("href");
			if (hrefString.contains("filepi")) {
				downloadAddress = hrefString;
				// System.out.println("���ص�ַ��" + downloadAddress);
			}
		}

	}

	public String log() {
		String spitString = "$";
		String logString = null;
		if (author == null)
			return null;
		else {
			logString = new String(bookIndex + spitString + bookAddress
					+ spitString + bookTitle + spitString + author + spitString
					+ imageAddress + spitString + page + spitString + size
					+ spitString + year + spitString + downloadAddress + "\n");

			System.out.println(bookIndex + spitString + bookAddress
					+ spitString + bookTitle + spitString + author + spitString
					+ imageAddress + spitString + page + spitString + size
					+ spitString + year + spitString + downloadAddress);

			return logString;

		}
	}

}
