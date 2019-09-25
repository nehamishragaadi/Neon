//
//  FileInfo.swift
//  Neon-Ios
//
//  Created by Neha Mishra on 2/5/19.
//  Copyright © 2019 Girnar. All rights reserved.
//

import Foundation
enum FILE_TYPE : String, Codable{
    case IMAGE
    case FOLDER
}
enum SOURCE : String, Codable{
    case PHONE_CAMERA
    case PHONE_GALLERY
}
class FileInfo : Serializable {

    public var filePath : String! // mandatory should be designated
    public var type : FILE_TYPE! // mand
    public var fileName : String! // mand
    public var displayName : String! // mand
    public var selected : Bool?
    public var source : SOURCE! // mand
    public var fileCount : Int? // convenient
    public var dateTimeTaken : String! // mand
    public var fileTag : ImageTagModel?
    public var latitude : String?
    public var longitude : String?
    public var timestamp : String?
    
    
    
    convenience init(filePath: String, type: FILE_TYPE,fileName: String,displayName: String,source: SOURCE,dateTimeTaken: String) {
        self.init()
        self.filePath = filePath
        self.type = type
        self.fileName = fileName
        self.displayName = displayName
        self.source = source
        self.dateTimeTaken = dateTimeTaken
    }
    
    public init()
    {
        self.selected = false
        self.filePath = ""
        self.fileName = ""
        self.displayName = ""
        self.fileCount = 0
        self.dateTimeTaken = ""
        self.latitude = ""
        self.longitude = ""
        self .timestamp = ""
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case filePath = "filePath"
        case type =  "type"
        case fileName = "fileName"
        case displayName = "displayName"
        case selected = "selected"
        case source = "source"
        case fileCount = "fileCount"
        case dateTimeTaken = "dateTimeTaken"
        case fileTag = "fileTag"
        case latitude = "latitude"
        case longitude = "longitude"
        case timestamp = "timestamp"
        

    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let filePath = try? container.decode(String.self, forKey: .filePath) {
            self.filePath = filePath
        }
        if let type = try? container.decode(FILE_TYPE.self, forKey: .type) {
            self.type = type
        }
        if let fileName = try? container.decode(String.self, forKey: .fileName) {
            self.fileName = fileName
        }
        if let displayName = try? container.decode(String.self, forKey: .displayName) {
            self.displayName = displayName
        }
        if let selected = try? container.decode(Bool.self, forKey: .selected) {
            self.selected = selected
        }
        if let source = try? container.decode(SOURCE.self, forKey: .source) {
            self.source = source
        }
        if let fileCount = try? container.decode(Int.self, forKey: .fileCount) {
            self.fileCount = fileCount
        }
        if let dateTimeTaken = try? container.decode(String.self, forKey: .dateTimeTaken) {
            self.dateTimeTaken = dateTimeTaken
        }
        if let fileTag = try? container.decode(ImageTagModel.self, forKey: .fileTag) {
            self.fileTag = fileTag
        }
        if let latitude = try? container.decode(String.self, forKey: .latitude) {
            self.latitude = latitude
        }
        if let longitude = try? container.decode(String.self, forKey: .longitude) {
            self.longitude = longitude
        }
        if let timestamp = try? container.decode(String.self, forKey: .timestamp) {
            self.timestamp = timestamp
        }
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(filePath, forKey: .filePath)
        try container.encode(type, forKey: .type)
        try container.encode(fileName, forKey: .fileName)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(selected, forKey: .selected)
        try container.encode(source, forKey: .source)
        try container.encode(fileCount, forKey: .fileCount)
        try container.encode(dateTimeTaken, forKey: .dateTimeTaken)
        try container.encode(fileTag, forKey: .fileTag)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(timestamp, forKey: .timestamp)

        
    }
    

}
