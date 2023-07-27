//
//  SwipableCard.swift
//  loveMyPet
//
//  Created by Tiago Vargas on 26/07/23.
//

import SwiftUI

struct SwipableCard<Content: View, RightButton: View>: View {
    @State private var offSet = 0.0
    @State private var isSwipe = false

    let rightButtonAction: () -> Void

    @ViewBuilder let content: Content
    @ViewBuilder let rightButton: RightButton

    var body: some View {
        content
            .offset(x: offSet)
            .background(rightButton)
            .gesture(DragGesture().onChanged(onChanged).onEnded(onEnded))
    }

    func onChanged(_ value: DragGesture.Value) {
        if value.translation.width < 0 {
            if isSwipe {
                offSet = value.translation.width - 90
            } else {
                offSet = value.translation.width
            }
        }
    }

    func onEnded(_ value: DragGesture.Value) {
        withAnimation {
            let deltaX: CGFloat = value.translation.width
            let isGestureToTheLeft: Bool = deltaX < 0
            if isGestureToTheLeft {
                if -deltaX > (UIScreen.main.bounds.width / 2) {
                    offSet = (-1000)
                    rightButtonAction()
                } else if -offSet > 50 {
                    isSwipe = true
                    offSet = (-90)
                } else {
                    isSwipe = false
                    offSet = 0
                }
            } else {
                isSwipe = false
                offSet = 0
            }
        }
    }
}

struct SwipableCard_Previews: PreviewProvider {
    static var previews: some View {
        SwipableCard {
            print("OIa")
        } content: {
            Card {
                HStack {
                    Text("Content")
                    Spacer()
                }
            }
        } rightButton: {
            Color.red
        }
    }
}
