//
//  Setting.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 14/02/24.
//

import Foundation

@Observable
final class Setting {
    var showingLoadingSettingsError = false
    var settingsItems: SettingsItems {
        didSet {
            save()
        }
    }
    
    func save() {
        if let encodedSettings = try? JSONEncoder().encode(settingsItems){
            UserDefaults.standard.set(encodedSettings, forKey: "Settings")
        }
    }
    
    func load() {
        if let savedSettings = UserDefaults.standard.data(forKey: "Settings"){
            if let decodedSettings = try? JSONDecoder().decode(SettingsItems.self, from: savedSettings) {
                settingsItems = decodedSettings
                return
            }
        }
        settingsItems = SettingsItems(timesTableOf: 1, dificultyLevel: 1)
        showingLoadingSettingsError = true
    }
    
    init() {
        if let savedSettings = UserDefaults.standard.data(forKey: "Settings"){
            if let decodedSettings = try? JSONDecoder().decode(SettingsItems.self, from: savedSettings) {
                settingsItems = decodedSettings
                return
            }
        }
        settingsItems = SettingsItems(timesTableOf: 1, dificultyLevel: 1)
        showingLoadingSettingsError = true
    }
}
