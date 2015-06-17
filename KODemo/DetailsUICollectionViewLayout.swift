//
//  DetailsUICollectionViewLayout.swift
//  KODemo
//
//  Created by Michael Walter on 17.06.15.
//  Copyright (c) 2015 Michael Walter. All rights reserved.
//

import UIKit

class DetailsUICollectionViewLayout: UICollectionViewFlowLayout {

    override func collectionViewContentSize() -> CGSize {
    
        var screenSize = UIScreen.mainScreen().bounds
        var screenWidth = screenSize.width
        var screenHeight = screenSize.height
        
        println("collectionViewContentSize: w=\(screenWidth) + h=\(screenHeight) " )
        
        // Do any additional setup after loading the view, typically from a nib
        //let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        return CGSize(width: 1024, height: 480)
    }
}