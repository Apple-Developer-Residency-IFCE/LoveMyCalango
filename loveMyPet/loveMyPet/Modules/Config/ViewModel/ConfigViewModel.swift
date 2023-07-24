//
//  ConfigViewModel.swift
//  loveMyPet
//
//  Created by Vitor Costa on 14/06/23.
//

import SwiftUI

final class ConfigViewModel: ObservableObject {
    @Published var isON = false
    private(set) var selectedScheme: Int?
    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system
    @AppStorage("notification") var notifications: Bool = false
    @State private var notificationEnable: Bool = false

    init() {
        isON = notifications
    }

    func changeScheme(index: Int?) {
        switch index {
        case 0:
            preferredColor = .system
        case 1:
            preferredColor = .light
        case 2:
            preferredColor = .dark
        default:
            break
        }
    }

    func allowNotification(noticationValue: Bool) {
        if noticationValue {
            notifications = true
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge,
                .sound]) { success, error in
                if success {
                    print("All set")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
            checkNotificationPermission(showAlert: true)
        } else {
            notifications = false
        }
    }

     func checkNotificationPermission(showAlert: Bool) {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                DispatchQueue.main.async {
                    if !(settings.authorizationStatus == .authorized) {
                        if showAlert {
                            self.showSettingsAlert()
                        } else {
                            self.isON = false
                        }
                    }
                }
            }
        }

    private func showSettingsAlert() {
        let alert = UIAlertController(title: "Notificacões estão desativadas",
        message: "Para ativar as notificações, vá para Settings > Notifications e permita notificações para esse app.",
        preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.isON = false
        })
        alert.addAction(UIAlertAction(title: "Settings", style: .default) { _ in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl)
            }
        })
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
