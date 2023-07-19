//
//  EmptyTask.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 19/07/23.
//

import SwiftUI

struct EmptyTask: View {
    var body: some View {
        VStack(alignment: .center, spacing: 22) {
            Image(Assets.Image.lazyCat)
            VStack {
                Text("Você não possui nenhuma tarefa pendente! :)")
                    .font(.custom(Font.SemiBold, size: 16))
                Text("As tarefas que você criar, aparecerão aqui.")
                    .font(.custom(Font.Regular, size: 14))
            }
            .foregroundColor(Color(CustomColor.FontColor))
            .multilineTextAlignment(.center)
            .frame(width: 310, alignment: .top)
            NavigationLink(destination: EmptyView()) {
                HStack {
                    Image(systemName: "plus")
                    Text("Adicionar Tarefa")
                }
                .font(.custom(Font.SemiBold, size: 16))
                .padding(.vertical, 16)
                .padding(.horizontal, 40)
                .background(Color(CustomColor.MainColor))
                .foregroundColor(Color(CustomColor.FontColor))
                .cornerRadius(8)

            }
        }
    }
}

struct EmptyTask_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTask()
    }
}
