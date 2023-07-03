//
//  TaskView.swift
//  loveMyPet
//
//  Created by José Winny on 28/06/23.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(CustomColor.BackgroundColor)
                    .ignoresSafeArea()
                
                VStack {
                    CuriosityCard()
                        .padding(.vertical)
                    Text("Tarefa")
                Spacer()
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(Assets.Image.namedLogo)
                        .padding(.horizontal)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(Assets.Icon.calendar)
                        .padding(.horizontal)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(Assets.Icon.add)
                }
            }
        }
        .environmentObject(viewModel)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
