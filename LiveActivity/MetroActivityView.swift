//
//  MetroActivityView.swift
//  LiveActivityDemo
//
//  Created by Vong on 2022/7/30.
//

import SwiftUI

struct MetroActivityView: View {
    @State var attribute: MetroAttributes
    @State var state: MetroAttributes.ContentState
    var body: some View {
        ZStack {
            LinearGradient(colors: [.teal, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(alignment: .trailing, spacing: 4) {
                Link(destination: URL(string: "metro://top")!) {
                    topView
                }
                
                Link(destination: URL(string: "metro://bottom")!) {
                    bottomView
                }
            }
        }
        .frame(height: 200)
    }
    
    var topView: some View {
        HStack(alignment: .center, spacing: 2) {
            topLeftView
            topRightView
        }
        .padding(.trailing, 8)
    }
    
    var topLeftView: some View {
        VStack(alignment: .leading) {
            currentLocation
            HStack(alignment: .bottom, spacing: 1) {
                metroLogo
                dashedSegment
                previousStation
                strokedSegment
                currentStation
                strokedSegment
                nextStation
                dashedSegment
            }
            
        }
        .padding(.leading, 16)
        .padding(.top, 8)
    }
    
    var topRightView: some View {
        VStack(spacing: 10) {
            Text("预计耗时")
                .font(.system(size: 12))
            Text(state.estimateArriveTime, style: .timer)
                .font(.system(size: 24, weight: .semibold))
        }
        .foregroundColor(.white)
        .offset(y: 8)
        .frame(width: 70)
    }
    
    var bottomView: some View {
        Group {
            Text("列车正开往\(state.arrivingStation)站， 距离本站还有 ")
                .font(.system(size: 12))
            +
            Text("\(state.stationGap)")
                .font(.system(size: 32, weight: .semibold))
            +
            Text(" 站")
        }
        .padding(.trailing, 16)
        .foregroundColor(.white)
        .padding(.bottom, 8)
    }
    
    var currentLocation: some View {
        Group {
            Text("当前站点: ")
                .font(.system(size: 12))
            +
            Text("\(attribute.currentStation)站")
                .font(.system(size: 18, weight: .semibold))
        }
            .foregroundColor(.white)
    }
    
    var metroLogo: some View {
        Image(systemName: "train.side.front.car")
            .foregroundColor(.white)
            .font(.system(size: 24))
    }
    
    var dashedSegment: some View {
        RoundedRectangle(cornerRadius: 3)
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
            .frame(height: 6)
            .foregroundColor(.white)
    }
    
    var previousStation: some View {
        VStack(spacing: 2) {
            Text(attribute.previousStation)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white)
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(.teal)
        }
    }
    
    var currentStation: some View {
        VStack(spacing: 2) {
            Image(systemName: "mappin.circle.fill")
            .font(.system(size: 18, weight: .semibold))
            Circle()
                .frame(width: 12, height: 12)
        }
        .foregroundColor(.indigo)
    }
    
    var nextStation: some View {
        VStack(spacing: 2) {
            Text(attribute.nextStation)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.white)
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(.teal)
        }
    }
    
    var strokedSegment: some View {
        RoundedRectangle(cornerRadius: 3)
            .foregroundColor(.teal)
            .frame(height: 6)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        MetroActivityView(attribute: MetroAttributes(currentStation: "客村", previousStation: "鹭江", nextStation: "赤岗"), state: MetroAttributes.MetroStatus(estimateArriveTime: Date().addingTimeInterval(20*60), stationGap: 10, arrivingStation: "文化公园"))
            .cornerRadius(20)
    }
}
