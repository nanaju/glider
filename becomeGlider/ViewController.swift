import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var lm: CLLocationManager! = nil
    var longitude: CLLocationDegrees!
    var latitude: CLLocationDegrees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(scheme: "http", host: "ofnow-api.herokuapp.com", path: "/1.0/users")
        let request = NSURLRequest(URL: url!)
        var json: NSDictionary
        do {
            let data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
            json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
        } catch {
            // エラー処理
        }
        
        longitude = 0.0
        latitude = 0.0
        
        lm = CLLocationManager()
        lm.delegate = self
        //位置情報取得の可否。バックグラウンドで実行中の場合にもアプリが位置情報を利用することを許可する
        lm.requestAlwaysAuthorization()
        //位置情報の精度
        lm.desiredAccuracy = kCLLocationAccuracyBest
        //位置情報取得間隔(m)
        lm.distanceFilter = 300
        
        // 位置情報を取得
        lm.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** 位置情報取得成功時 */
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation){
        longitude = newLocation.coordinate.longitude
        latitude = newLocation.coordinate.latitude
        
        print(String(longitude))
        print(String(latitude))
    }
    
    /** 位置情報取得失敗時 */
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        NSLog("Error")
    }
    
}