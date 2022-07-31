//
//  LiveActivityManagere.swift
//  LiveActivityDemo
//
//  Created by Vong on 2022/7/30.
//

import Foundation
import ActivityKit

final class LiveActivityManager {
    static func start() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
          print("Live Activity is not available!")
          return
        }
        
        let attributes = MetroAttributes(currentStation: "客村", previousStation: "鹭江", nextStation: "赤岗")
        let initialState = MetroAttributes.MetroStatus(estimateArriveTime: Date().addingTimeInterval(10*60), stationGap: 4, arrivingStation: "昌岗")
        do {
            let activity = try Activity.request(attributes: attributes, contentState: initialState, pushType: nil)
            print("start activity \(activity.id)")
        } catch (let error) {
            print("start activity failed: \(error.localizedDescription)")
        }
    }
    
    static func update() {
        Task {
            let status = MetroAttributes.MetroStatus(estimateArriveTime: Date().addingTimeInterval(6*60), stationGap: 2, arrivingStation: "中大")
            
            for activity in Activity<MetroAttributes>.activities{
                print("update activity: \(activity.id)")
                await activity.update(using: status)
            }
        }
    }
    
    static func end() {
        Task {
            for activity in Activity<MetroAttributes>.activities{
                await activity.end()
            }
        }
    }
}
