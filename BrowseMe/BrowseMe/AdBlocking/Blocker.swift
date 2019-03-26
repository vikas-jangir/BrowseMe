//
//  Blocker.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 18/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import UIKit

class Blocker: NSObject {
    
    var listName = MalWareList.generateList()
    
   static var domainList : Set<String> = []
    
    override init() {
        super.init()
        if Blocker.domainList.isEmpty {
            DispatchQueue.global(qos: .background).async {
                 self.fillDomainList()
            }
        }
    }
    
    
   static func shouldBlock(_ url: URL?) -> Bool {
    guard var baseDomain = url?.host else { return false }
    
    if baseDomain.hasPrefix("www.") {
        baseDomain = baseDomain.replacingOccurrences(of: "www.", with: "")
    }
    
        return Blocker.domainList.contains(baseDomain)
    }
    
    
    func fillDomainList() {
        
        var newList = Set<String>()
        
        self.listName.forEach { (malwareList) in
            if let list = self.openFile(withName: malwareList.name) {
                newList.formUnion(self.parse(list: list, regex: malwareList.regix))
            }
        }
        
        Blocker.domainList = newList
        
    }
    
    func parse(list : String , regex:NSRegularExpression) -> Set<String> {
        var domains = Set<String>()
        
        let nsList = list as NSString
        
        regex.matches(in: list, options: [], range: NSRange(location: 0, length: nsList.length))
            .map {
                nsList.substring(with: $0.range)
            }.forEach {
                domains.insert($0)
        }
        
        return domains;
    }
    
    
    
    func openFile(withName name:String) -> String? {
        guard let filePath = Bundle.main.path(forResource: name, ofType: "txt") else {
            print("File not found \(name)")
            return nil
        }
        
        do {
            return try String(contentsOfFile: filePath, encoding: .utf8)
        } catch {
            print("Not able to read the File \(filePath)")
            return nil
        }
    }
    
    
}


struct MalWareList {
    let name : String
    let regix : NSRegularExpression
    
    static func generateList() -> [MalWareList] {
        var lists = [MalWareList]()
        
        // Add adblock-list file with regular expression
        let adblockListRegex = "(?<=\\|\\|).+?(?=\\^)"
        let adblockListName = "adblock-list"
        
        do {
            let regex =  try NSRegularExpression(pattern: adblockListRegex, options: .caseInsensitive)
            lists.append(MalWareList(name: adblockListName, regix: regex))
        } catch  {
            print("Not able to crate the Regular expression")
        }
        
        // Add more files to the list
        return lists
    }
    
}
