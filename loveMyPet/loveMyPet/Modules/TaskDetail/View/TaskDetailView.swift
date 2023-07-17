//
//  TaskDetailView.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 17/07/23.
//

import SwiftUI

struct TaskDetailView: View {
    var task: NewTask
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: UIImage(data: task.pet.image ?? Data()) ?? UIImage(named: Assets.Image.logo) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 194)
                .clipped()
            
            VStack(alignment: .leading, spacing: 24.0) {
                Text(task.title)
                    .font(.custom(Font.SemiBold, size: 28))
                
                VStack(alignment: .leading, spacing: 16.0) {
                    HStack(spacing: 8.0) {
                        Image(Assets.Icon.petPaw)
                        Text(task.pet?.name ?? "Não Informado").font(.custom(Font.Regular, size: 16))
                    }
                    HStack(spacing: 8.0) {
                        Image(Assets.Icon.calendarAux)
                        Text(Helper.shared.formattedBirthDate(date: task.date ?? .now)).font(.custom(Font.Regular, size: 16))
                    }
                    HStack(spacing: 8.0) {
                        Image(Assets.Icon.circleClock)
                        Text(Helper.shared.timeFormatter(time: task.time ?? .now)).font(.custom(Font.Regular, size: 16))
                    }
                    HStack(spacing: 8.0) {
                        Image(Assets.Icon.notification)
                        Text(task.reminder.rawValue).font(.custom(Font.Regular, size: 16))
                    }
                }
                
                Text(task.summary).font(.custom(Font.Regular, size: 16))
            }.padding()
            
            HStack {
                Spacer()
                Button("Marcar como concluída") {
                    task.isDone.toggle()
                }
                .font(.custom(Font.Regular, size: 16))
                .padding(.vertical, 15.0)
                .padding(.horizontal, 40.0)
                .foregroundColor(.white)
                .background(Color(red: 0.24, green: 0.2, blue: 0.81))
                .cornerRadius(8)
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView()
    }
}
