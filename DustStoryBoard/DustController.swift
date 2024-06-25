//
//  DustController.swift
//  DustStoryBoard
//
//  Created by dheum on 2020/07/13.
//  Copyright © 2020 dheum. All rights reserved.
//

import UIKit
import Alamofire

class DustController: UIViewController {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var dustTable: UITableView!
    @IBOutlet var minmaxLabel: UILabel!
    var airArray: [Air] = []
    var weatherInfo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDusts()
        self.getWeather()
        
    }
    
    @IBAction func refresh(_ sender: Any) {
        self.airArray.removeAll()
        self.getDusts()
        self.getWeather()
    }
    
    func getDusts() -> Void {
        let url = "http://openapi.seoul.go.kr:8088/4659706c6a67616235324c44736766/json/" +
        "ListAirQualityByDistrictService/1/25/";
        
        AF.request(url).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(let value):
                self.parseJson(json: value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getWeather() -> Void{
        var url = "https://apis.data.go.kr/1360000/MidFcstInfoService/getMidFcst?serviceKey=o%2BNjItdiOddNzU2y6mZewsvm7rac7aZEfLFkJRDsXG1764RAO2trx%2B%2BWYXVcSdRplbjbQGyX5m6D2CuXm%2BUuyQ%3D%3D&pageNo=1&numOfRows=10&dataType=json&stnId=109&tmFc="

        let date = Date()
        let calendar = Calendar.current
            
        let components = calendar.dateComponents([.hour, .minute], from: date)
            
        if let hour = components.hour{
            if hour >= 6{
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyyMMdd"
                var formattedDate = formatter.string(from: date)
                formattedDate += "0600"
                url += formattedDate
                print(url)
                AF.request(url).responseString(encoding: .utf8) { response in
                    switch response.result {
                    case .success(let value):
                        print(value)
                        self.parseWeatherJson(json: value)
                    case .failure(let error):
                        print(error)
                    }
                }
            } else{
                weatherInfo = "not available until 6am"
            }
        }
    }
    
    func parseWeatherJson(json:String) -> Void{
        let decoder = JSONDecoder()
        let data = json.data(using: .utf8)
        if let data = data, let obj = try? decoder.decode(wData.self, from: data) {
            if let wInfo = obj.response.body.items.item.first?.wfSv{
                weatherInfo = wInfo
            }
        }
        else{
            print("none")
        }
    }
    
    func parseJson(json: String) -> Void {
        let decoder = JSONDecoder()
        let data = json.data(using: .utf8)
        if let data = data, let obj = try? decoder.decode(Data.self, from: data) {
            self.airArray = obj.ListAirQualityByDistrictService.row
        }
        self.dustTable.reloadData()
        if airArray.count != 0 {
            var str = String(airArray[0].MSRDATE.dropLast(2))
            str = str + " 기준"
            self.dateLabel.text = str
            let pm10 = airArray.map{$0.PM10}
            minmaxLabel.text = "최고:\(pm10.max()!) / 최저:\(pm10.min()!)"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailController
        let index = dustTable.indexPathForSelectedRow
        if let destination = destination, let index = index {
            destination.infoStr += "일산화탄소 : \(airArray[index.row].CARBON)\n"
            destination.infoStr += "이산화탄소 : \(airArray[index.row].NITROGEN)\n"
            destination.infoStr += "오존 : \(airArray[index.row].OZONE)\n"
            destination.infoStr += "미세먼지 : \(airArray[index.row].PM10)\n"
            destination.infoStr += "초미세먼지 : \(airArray[index.row].PM25)"
            destination.weatherStr = weatherInfo
        }
    }
}

extension DustController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.airArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "DustCell", for: indexPath)
        if let label = cell.contentView.viewWithTag(1) as? UILabel {
            label.text = self.airArray[indexPath.row].MSRSTENAME
        }
        if let label = cell.contentView.viewWithTag(2) as? UILabel {
            label.text = self.airArray[indexPath.row].PM10
        }
        if let label = cell.contentView.viewWithTag(3) as? UILabel {
            if self.airArray[indexPath.row].GRADE == "" {
                label.text = "N/A"
            } else {
                label.text = self.airArray[indexPath.row].GRADE
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
