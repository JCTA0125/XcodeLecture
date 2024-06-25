//
//  Dust.swift
//  DustSwiftUI
//
//  Created by dheum on 2020/07/09.
//  Copyright © 2020 dheum. All rights reserved.
//

import Foundation

struct Data : Codable {
    let ListAirQualityByDistrictService : DustData
}

struct DustData : Codable {
    let row : [Air]
}

struct Air : Codable {
    let MSRDATE : String
    let MSRSTENAME : String
    let CARBON : String
    let NITROGEN : String
    let OZONE : String
    let PM10 : String
    let PM25 : String
    let GRADE : String
}

struct wData : Codable{
    let response: Response
}
struct Response: Codable{
    let body: Body
}
struct Body: Codable{
    let items: Items
}
struct Items: Codable{
    let item: [Item]
}
struct Item: Codable{
    let wfSv: String
}


