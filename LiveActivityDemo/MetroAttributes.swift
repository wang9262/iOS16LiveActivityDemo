//
//  TaskAttributes.swift
//  LiveActivityDemo
//
//  Created by Vong on 2022/7/30.
//

import Foundation
import ActivityKit

struct MetroAttributes: ActivityAttributes {
    public typealias MetroStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var estimateArriveTime: Date
        var stationGap: Int
        var arrivingStation: String
    }
    
    var currentStation: String
    var previousStation: String
    var nextStation: String
}
