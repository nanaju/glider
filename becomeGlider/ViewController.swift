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
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // フィールドの初期化
        lm = CLLocationManager()
        longitude = CLLocationDegrees()
        latitude = CLLocationDegrees()
        
        // CLLocationManagerをDelegateに指定
        lm.delegate = self
        
        // 位置情報取得の許可を求めるメッセージの表示．必須．
        lm.requestAlwaysAuthorization()
        // 位置情報の精度を指定．任意，
        // lm.desiredAccuracy = kCLLocationAccuracyBest
        // 位置情報取得間隔を指定．指定した値（メートル）移動したら位置情報を更新する．任意．
        // lm.distanceFilter = 1000
        
        // GPSの使用を開始する
        lm.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* 位置情報取得成功時に実行される関数 */
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation){
        // 取得した緯度がnewLocation.coordinate.longitudeに格納されている
        latitude = newLocation.coordinate.latitude
        // 取得した経度がnewLocation.coordinate.longitudeに格納されている
        longitude = newLocation.coordinate.longitude
        // 取得した緯度・経度をLogに表示
        print("slatiitude: \(latitude) , longitude: \(longitude)")
        
        // GPSの使用を停止する．停止しない限りGPSは実行され，指定間隔で更新され続ける．
        // lm.stopUpdatingLocation()
    }
    /* 位置情報取得失敗時に実行される関数 */
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        // この例ではLogにErrorと表示するだけ．
        print("Error")
        
    }


}

