//
//  NeonImagesHandler.swift
//  Neon-Ios
//
//  Created by Neha Mishra on 08/02/19.
//  Copyright © 2019 Girnar. All rights reserved.
//

import Foundation

class NeonImagesHandler {
    static let singleonInstance = NeonImagesHandler()
    
    var clearInstance : Bool!
    var imagesCollection = [FileInfo]()
    var imageTagArray = [ImageTagModel]()
    var neutralEnabled : Bool!
    var imageResultListener : OnImageCollectionListener!
    var livePhotosListener : LivePhotosListener!
    var livePhotoNextTagListener : LivePhotoNextTagListener!
    var currentTag : String = ""
    var requestCode : Int!
    var imageLocalPathSaved = NSCache<NSString, UIImage>()
    
    private init(){
        
    }
    
    
    public func addCustomObjectInArray() -> String {

        let jsonString = """
{
        "filePath" : "1" ,
        "fileName" : "fileName" ,
        "displayName" : "displayName",
        "selected" : false,
        "isSelected" : true,
        "fileCount" : 4,
        "fileTag" : "Select Tag"

}
"""
       
        
        if let jsonData = jsonString.data(using: .utf8)
        {
            let decoder = JSONDecoder()
            
            do {
                //let configureValue = try decoder.decode(ImageTagModel.self, from: jsonData)
                let configureValue = try decoder.decode(FileInfo.self, from: jsonData)
                 print(configureValue.filePath)
                 print(configureValue.displayName)


                
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        
        
        imageTagArray.removeAll()
        for i in 0...2 {
            if i % 2 == 0 {
                let fileTag = ImageTagModel.init(tagId: "\(i + 1)", tagName: "*Tag \(i + 1)", mandatory: true, noOfPhotos: i, location: nil, isSelected: false)
                self.imageTagArray.append(fileTag)
            }else{
                let fileTag = ImageTagModel.init(tagId: "\(i + 1)", tagName: "Tag \(i + 1)", mandatory: false, noOfPhotos: i, location: nil, isSelected: false)
                self.imageTagArray.append(fileTag)
            }
        }
        
        var tags = ""
        for tagModel in imageTagArray {
            if tagModel.mandatory! {
                tags = tags + "\(tagModel.tagName ?? "")" + "\n"
            }else{
                tags = tags + tagModel.tagName! + "\n"
            }

        }
        return tags
    }
    
    public func getNumberOfPhotosCollected() -> Int {
        return 0
            }
    
    public func getImageResultListener() -> OnImageCollectionListener {
        return imageResultListener
        
    }
    
    public func getLivePhotosListener() -> LivePhotosListener {
        return livePhotosListener
    }
    
    public func getLivePhotoNextTagListener() -> LivePhotoNextTagListener {
        return livePhotoNextTagListener
    }
    
    public func setLivePhotoNextTagListener(livePhotoNextTagListener : LivePhotoNextTagListener) -> Void {
        self.livePhotoNextTagListener = livePhotoNextTagListener
    }
    
    public func getCurrentTag() -> String {
        return currentTag
    }
    
    public func setCurrentTag(currentTag : String) -> Void {
        self.currentTag = currentTag
    }
   
    public func isNeutralEnabled() -> Bool {
        return neutralEnabled
    }
    
    public func setNeutralEnabled(neutralEnabled : Bool) -> Void {
        self.neutralEnabled = neutralEnabled
    }
    

    public func getImagesCollection() -> [FileInfo] {
        return imagesCollection
    }
    
    public func setImagesCollection(allreadyAdded : [FileInfo]) -> Void {
        if allreadyAdded.count > 0 {
            for i in 0..<allreadyAdded.count {
                let cloneFile = FileInfo()
                let originalFile = allreadyAdded[i]
                
                if originalFile.fileTag != nil {
                    cloneFile.fileTag = ImageTagModel(tagId: originalFile.fileTag!.tagId!, tagName: originalFile.fileTag!.tagName!, mandatory: originalFile.fileTag!.mandatory!, noOfPhotos: originalFile.fileTag!.noOfPhotos!, location: originalFile.fileTag?.location, isSelected: originalFile.fileTag!.isSelected!)
                    
                    
               
                    cloneFile.selected = originalFile.selected
                    cloneFile.source = originalFile.source
                    cloneFile.fileName = originalFile.fileName
                    cloneFile.dateTimeTaken = originalFile.dateTimeTaken
                    cloneFile.displayName = originalFile.displayName
                    cloneFile.fileCount = originalFile.fileCount
                    cloneFile.type = originalFile.type

                    imagesCollection.append(cloneFile)
                }
            }
        }
    }
    
    public func checkImagesAvailableForTag(tagModel : ImageTagModel) -> Bool {
        if imagesCollection.count <= 0 {
            return false;
        }
        for i in 0..<imagesCollection.count {
            if imagesCollection[i].fileTag != nil && imagesCollection[i].fileTag?.tagId == tagModel.tagId &&
                imagesCollection[i].fileTag?.tagName == tagModel.tagName {
                return true
            }
        }
        return false
    }
    
    public func checkImageAvailableForPath(fileInfo : FileInfo) -> Bool {
        if imagesCollection.count <= 0 {
            return false;
        }
        for i in 0..<imagesCollection.count {
            if imagesCollection[i].filePath.lowercased() == fileInfo.filePath.lowercased() {
                return true;
            }
        }
        return false;
    }
    
    public func removeFromCollection(fileInfo : FileInfo) -> Bool {
        if imagesCollection.count <= 0 {
            return true;
        }
        for i in 0..<imagesCollection.count {
            if imagesCollection[i].filePath == fileInfo.filePath {
                return imagesCollection.remove(at: i) != nil
            }
        }
        return true;
    }
    
}
