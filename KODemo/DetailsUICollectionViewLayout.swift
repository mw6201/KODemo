//
//  DetailsUICollectionViewLayout.swift
//  KODemo
//
//  Created by Michael Walter on 17.06.15.
//  Copyright (c) 2015 Michael Walter. All rights reserved.
//

import UIKit

class DetailsUICollectionViewLayout: UICollectionViewFlowLayout {

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        
        super.init(coder: aDecoder)
        
    //    self.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    }
    
    /*
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    */
    
    /*
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attributesToReturn:[UICollectionViewLayoutAttributes] = super.layoutAttributesForElementsInRect(rect) as! [UICollectionViewLayoutAttributes]
        
        for  attributes in attributesToReturn {
            
            if let elemedKind = attributes.representedElementKind {
                var indexPath: NSIndexPath  = attributes.indexPath;
                attributes.frame = self.layoutAttributesForItemAtIndexPath(indexPath).frame
            }
        }
        return attributesToReturn;
    }
    */
    
    /*
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        
        var attributesToReturn: [UICollectionViewLayoutAttributes] = super.layoutAttributesForElementsInRect(rect) as! [UICollectionViewLayoutAttributes]
        
        for (index, attributes) in enumerate(attributesToReturn) {
            
            if attributes.representedElementKind != nil {
                
                var indexPath: NSIndexPath  = attributes.indexPath
                attributes.frame = layoutAttributesForItemAtIndexPath(indexPath).frame
            }
        }
        return attributesToReturn
    }
    */
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        
        //        let kMaxCellSpacing: CGFloat = 30.0
        
        let currentItemAttributes: UICollectionViewLayoutAttributes = super.layoutAttributesForItemAtIndexPath(indexPath)
        
        let sectionInset: UIEdgeInsets = UIEdgeInsetsMake(50.0, 20.0, 50.0, 20.0)
        
        if indexPath.item == 0 { // first item of section
            var frame: CGRect = currentItemAttributes.frame
            frame.origin.x = sectionInset.left // first item of the section should always be left aligned
            currentItemAttributes.frame = frame
            return currentItemAttributes
        }
        
        let previousIndexPath: NSIndexPath = NSIndexPath(forItem: indexPath.item - 1, inSection: indexPath.section)
        let previousFrame: CGRect = layoutAttributesForItemAtIndexPath(previousIndexPath).frame
        let previousFrameRightPoint: CGFloat = previousFrame.origin.x + previousFrame.size.width/* + kMaxCellSpacing */
        
        let currentFrame: CGRect = currentItemAttributes.frame
        let strecthedCurrentFrame: CGRect = CGRectMake(
            0.0,
            currentFrame.origin.y,
            self.collectionView!.frame.size.width,
            currentFrame.size.height)
        
        if !CGRectIntersectsRect(previousFrame, strecthedCurrentFrame) { // if current item is the first item on the line
            // the approach here is to take the current frame, left align it to the edge of the view
            // then stretch it the width of the collection view, if it intersects with the  previous   frame then that means it
            // is on the same line, otherwise it is on it's own new line
            var frame: CGRect = currentItemAttributes.frame
            frame.origin.x = sectionInset.left // first item on the line should always be left aligned
            currentItemAttributes.frame = frame
            return currentItemAttributes
        }
        
        var frame: CGRect = currentItemAttributes.frame
        frame.origin.x = previousFrameRightPoint
        currentItemAttributes.frame = frame
        return currentItemAttributes
    }
    
    override func collectionViewContentSize() -> CGSize {
    
        var screenSize = UIScreen.mainScreen().bounds
        var screenWidth = screenSize.width
        var screenHeight = screenSize.height
        
        println("collectionViewContentSize: w=\(screenWidth) + h=\(screenHeight) " )
        
        // Do any additional setup after loading the view, typically from a nib
        //let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        return CGSize(width: 12048, height: 480)
    }
}