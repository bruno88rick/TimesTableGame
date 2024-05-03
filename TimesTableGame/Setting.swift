//
//  Setting.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 14/02/24.
//

import Foundation

@Observable
class Setting {
    var showingSeetingFirtsTime = false
    var showingLoadingSettingsError = false
    var settingsItems: SettingsItems {
        didSet {
            if let encodedSettings = try? JSONEncoder().encode(settingsItems){
                UserDefaults.standard.set(encodedSettings, forKey: "Settings")
            }
        }
    }
    
    init() {
        if let savedSettings = UserDefaults.standard.data(forKey: "Settings"){
            if let decodedSettings = try? JSONDecoder().decode(SettingsItems.self, from: savedSettings) {
                settingsItems = decodedSettings
                return
            }
        }
        settingsItems = SettingsItems(timesTableOf: 2, dificultyLevel: 1)
        showingLoadingSettingsError = true
    }
}
