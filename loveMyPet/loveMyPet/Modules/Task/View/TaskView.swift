//
//  TaskView.swift
//  loveMyPet
//
//  Created by José Winny on 28/06/23.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(CustomColor.BackGroundColor)
                    .ignoresSafeArea()
                VStack { 
                    Text("Tarefa")
                }
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
