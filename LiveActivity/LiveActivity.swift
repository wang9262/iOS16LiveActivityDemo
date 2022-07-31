//
//  LiveActivity.swift
//  LiveActivity
//
//  Created by Vong on 2022/7/30.
//

import WidgetKit
import SwiftUI
import ActivityKit

@main
struct LiveActivity: Widget {
    let kind: String = "LiveActivity"
    
    var body: some WidgetConfiguration {
      ActivityConfiguration(attributesType: MetroAttributes.self) { context in
          MetroActivityView(attribute: context.attributes, state: context.state)
      }
    }
}

struct LiveActivity_Previews: PreviewProvider {
    static var previews: some View {
        MetroActivityView(attribute: MetroAttributes(currentStation: "客村", previousStation: "鹭江", nextStation: "赤岗"), state: MetroAttributes.MetroStatus(estimateArriveTime: Date().addingTimeInterval(20*60), stationGap: 10, arrivingStation: "文化公园"))
            .previewContext(
                WidgetPreviewContext(
                    family: .systemMedium
                )
        )
    }
}
