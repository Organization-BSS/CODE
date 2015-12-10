import java.util.List;

import org.json.JSONException;

import javapns.Push;
import javapns.communication.exceptions.CommunicationException;
import javapns.communication.exceptions.KeystoreException;
import javapns.notification.*;

public class MainClass {

	/**
	 * @param args
	 * @throws JSONException 
	 * @throws KeystoreException 
	 * @throws CommunicationException 
	 */
	public static void main(String[] args) throws JSONException, CommunicationException, KeystoreException {
		// TODO Auto-generated method stub
		String deviceToken = "fwe";
		
		PushNotificationPayload payload = new PushNotificationPayload(); 
		//声明一个空的payload 
//		payload.setExpiry(1);  //设置payload的过期时间  
		payload.addAlert("少波的通知");  //设置alert消息 
		payload.addBadge(1);  //设置badge值  
		payload.addSound("beep.wav");  //设置声音 
//		payload.addCustomAlertActionLocKey("launch apns");  //设置ActionLocKey 
//		payload.addCustomAlertLocKey("locKey");  //设置LocKey 
//		payload.addCustomDictionary("custom1", "value1");  //增加一个自定义键值对  
		List<PushedNotification> notifications = Push.payload(payload, "push2.p12", "bss",   false,   "6108093c273c71e5dfecbd7b8e4746be71be8893f6f9442a0363ccfe3d3fd91e");  //调用Push.payload方法发送这个payload，发回一个已发送的notification的列表
//09b0823d 60d44ad9 df5e3768 5dc940e0 fc054120 73eea2bb abb705da c5352ce0
		List<PushedNotification> notifications2 = Push.payload(payload, "push2.p12", "bss",   false,   "09b0823d60d44ad9df5e37685dc940e0fc05412073eea2bbabb705dac5352ce0");  //调用Push.payload方法发送这个payload，发回一个已发送的notification的列表

		System.out.print(notifications2);
	}

}
