//
//  ComponentView.swift
//  App
//
//  Created by Mohsen on 29/04/2024.
//

import SwiftUI

struct TestComponentView: View {
    
    var info: CardComponentInfo
    @ObservedObject var model: TestModel
    
    var body: some View {
        ZStack {
            Color.red
//            Label(info.type.title, systemImage: info.type.systemImageName)
            Image(systemName: "rectangle")
                .resizable()
                .frame(width: .infinity,height: .infinity)
            ResizingControlsView { point, deltaX, deltaY in
                model.resizedComponentInfo = info
                model.updateForResize(using: point, deltaX: deltaX, deltaY: deltaY)
                //model.updateForResize(point: point, deltaX: deltaX, deltaY: deltaY) // other udpateForResize may work
            } dragEnded: {
                model.resizeEnded()
            }
        }
        .frame(
            width: model.widthForCardComponent(info: info),
            height: model.heightForCardComponent(info: info)
        )
        .background(.clear)
        .position(
            x: model.xPositionForCardComponent(info: info),
            y: model.yPositionForCardComponent(info: info)
        )
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    model.draggedComponentInfo = info
                    model.updateForDrag(deltaX: gesture.translation.width, deltaY: gesture.translation.height)
                }
                .onEnded { _ in
                    model.dragEnded()
                }
        )
    }
}
