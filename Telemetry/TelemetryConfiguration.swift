//
//  TelemetryConfiguration.swift
//  Telemetry
//
//  Created by Justin D'Arcangelo on 4/18/17.
//
//

import Foundation

public class TelemetryConfiguration {
    public var appName: String
    public var appVersion: String
    public var buildId: String
    public var updateChannel: String
    public var serverEndpoint: String
    public var userAgent: String
    public var defaultSearchEngineProvider: String
    public var sessionConfigurationBackgroundIdentifier: String
    public var dataDirectory: FileManager.SearchPathDirectory
    public var profileFilename: String
    public var timeoutIntervalForRequest: TimeInterval
    public var timeoutIntervalForResource: TimeInterval
    public var minimumEventsForUpload: Int
    public var maximumNumberOfEventsPerPing: Int
    public var maximumNumberOfPingsPerType: Int
    public var maximumNumberOfPingUploadsPerDay: Int

    public var isCollectionEnabled: Bool
    public var isUploadEnabled: Bool

    public var userDefaultsSuiteName: String?
    private(set) public var measuredUserDefaults: [[String : Any?]]
    
    public init() {
        let info = Bundle.main.infoDictionary

        self.appName = info?["CFBundleDisplayName"] as? String ?? TelemetryDefaults.AppName
        self.appVersion = info?["CFBundleShortVersionString"] as? String ?? TelemetryDefaults.AppVersion
        self.buildId = info?["CFBundleVersionKey"] as? String ?? TelemetryDefaults.BuildId
        self.updateChannel = TelemetryDefaults.UpdateChannel
        self.serverEndpoint = TelemetryDefaults.ServerEndpoint
        self.userAgent = TelemetryDefaults.UserAgent
        self.defaultSearchEngineProvider = TelemetryDefaults.DefaultSearchEngineProvider
        self.sessionConfigurationBackgroundIdentifier = TelemetryDefaults.SessionConfigurationBackgroundIdentifier
        self.dataDirectory = TelemetryDefaults.DataDirectory
        self.profileFilename = TelemetryDefaults.ProfileFilename
        self.timeoutIntervalForRequest = TelemetryDefaults.TimeoutIntervalForRequest
        self.timeoutIntervalForResource = TelemetryDefaults.TimeoutIntervalForResource
        self.minimumEventsForUpload = TelemetryDefaults.MinNumberOfEventsPerUpload
        self.maximumNumberOfEventsPerPing = TelemetryDefaults.MaxNumberOfEventsPerPing
        self.maximumNumberOfPingsPerType = TelemetryDefaults.MaxNumberOfPingsPerType
        self.maximumNumberOfPingUploadsPerDay = TelemetryDefaults.MaxNumberOfPingUploadsPerDay
        
        self.isCollectionEnabled = true
        self.isUploadEnabled = true
        
        self.userDefaultsSuiteName = nil
        self.measuredUserDefaults = []
    }
    
    public func measureUserDefaultsSetting(forKey key: String, withDefaultValue defaultValue: Any?) {
        measuredUserDefaults.append(["key": key, "defaultValue": defaultValue])
    }
    
    public func measureUserDefaultsSetting<T : RawRepresentable>(forKey key: T, withDefaultValue defaultValue: Any?) where T.RawValue == String {
        measureUserDefaultsSetting(forKey: key.rawValue, withDefaultValue: defaultValue)
    }
}
