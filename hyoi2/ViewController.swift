//
//  ViewController.swift
//  hyoi2
//
//  Created by Sota Saito on 2018/12/19.
//  Copyright © 2018 unwithdrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

class ViewController_Subscribe : UIViewController{
    
    @IBAction func username(_ sender: Any) {
    }
    @IBAction func mail(_ sender: Any) {
    }
    
    @IBAction func password(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

import UIKit
import MapKit

class ViewControllerMap: UIViewController {
    
    @IBOutlet weak var mapview: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 緯度経度を指定
        let initialCoordinate = CLLocationCoordinate2DMake(35.6811716,139.7648576)
        
        // 表示する範囲を指定
        let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        
        // 領域を作成
        let region = MKCoordinateRegion(center: initialCoordinate, span: span)
        
        // 領域をmapViewに設定
        mapview.setRegion(region, animated:true)
        
        // ピンを複数立てる
        addAnnotation(_latitude: 35.6815014,139.7636097, _title: "タリーズコーヒー", "東京都千代田区丸の内１丁目２−１")
        addAnnotation(_latitude: 35.6816773,139.7634722, _title: "カフェ レクセル", "東京都千代田区丸の内２丁目４−１")
        addAnnotation(_latitude: 35.6800494,139.7609786, _title: "カフェ・ド・クリエ 丸の内MYPLAZA店", "東京都千代田区丸の内２丁目１−１")
    }
    
    func addAnnotation( _latitude: CLLocationDegrees,_ longitude: CLLocationDegrees, _title:String,_ subtitle:String) {
        
        // ピンの生成
        let annotation = MKPointAnnotation()
        
        // 緯度経度を指定
        annotation.coordinate = CLLocationCoordinate2DMake(longitude, longitude)
        
        // タイトル、サブタイトルを設定
        annotation.title = title
        annotation.subtitle = subtitle
        
        // mapViewに追加
        mapview.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
