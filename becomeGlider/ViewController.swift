//
//  ViewController.swift
//  becomeGlider
//
//  Created by NaoKONDO on 2015/12/17.
//  Copyright © 2015年 NaoKONDO. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController , CLLocationManagerDelegate {
    
    //現在位置の取得
    var lm : CLLocationManager!

    //緯度の保持
    var latitude :CLLocationDegrees!
    //経度の保持
    var longitude : CLLocationDegrees!
    
    @IBOutlet weak var gpsLabel: UILabel!
    @IBOutlet var gpsButton: UIButton!
    @IBAction func gpsGet(sender : AnyObject){
        gpsLabel.text = "latiitude: \(latitude) , longitude: \(longitude)"
        
        
    }
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // フィールドの初期化
        lm = CLLocationManager()
        // CLLocationManagerをDelegateに指定
        lm.delegate = self
        // GPSの使用を開始する
        lm.startUpdatingLocation()
        print("GPS使用開始")
        
        


        // セキュリティ認証のステータスを取得.
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if(status == CLAuthorizationStatus.NotDetermined) {
            print("ステータスが変更されました:\(status)");
            // まだ承認が得られていない場合は、認証ダイアログを表示.
            self.lm.requestAlwaysAuthorization()
            print("ステータス変更完了")
        }
        
        
        
        
        // 位置情報の精度を指定．任意，
         lm.desiredAccuracy = kCLLocationAccuracyBest
        // 位置情報取得間隔を指定．指定した値（メートル）移動したら位置情報を更新する．任意．
         //lm.distanceFilter = 20
        
        // GPSの使用を開始する
        //lm.startUpdatingLocation()
        //print("GPS使用開始")
        //self.lm.requestAlwaysAuthorization()
        //print("もう一回")
    }

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 現状のステータス状態を表示します
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus");
        var statusStr = "";
        switch (status) {
        case .NotDetermined:        statusStr = "NotDetermined"
        case .Restricted:           statusStr = "Restricted"
        case .Denied:               statusStr = "Denied"
        case .Authorized:           statusStr = "Authorized"
        case .AuthorizedWhenInUse:  statusStr = "AuthorizedWhenInUse"
        }
        print(" CLAuthorizationStatus: \(statusStr)")
    }
    
    
    /* 位置情報取得成功時に実行される関数 */
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation){
        // 取得した緯度がnewLocation.coordinate.longitudeに格納されている
        latitude = newLocation.coordinate.latitude
        // 取得した経度がnewLocation.coordinate.longitudeに格納されている
        longitude = newLocation.coordinate.longitude
        // 取得した緯度・経度をLogに表示
        print("latiitude: \(latitude) , longitude: \(longitude)")
        
        
        //メソッドとの関連付け
        gpsButton.addTarget(self, action: "tapped", forControlEvents: .TouchUpInside)
        
        
        // GPSの使用を停止する．停止しない限りGPSは実行され，指定間隔で更新され続ける．
        // lm.stopUpdatingLocation()
    }
    /* 位置情報取得失敗時に実行される関数 */
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        // この例ではLogにErrorと表示するだけ．
        print("Error")
        
    }
    


}

