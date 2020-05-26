//
//  CollectionViewFlowLayout.swift
//  DynamicHeightCollectionView
//
//  Created by Payal Gupta on 11/02/19.
//  Copyright © 2019 Payal Gupta. All rights reserved.
//

import UIKit

class LeftModeCollectionViewFlowLayout : UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
        var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
        
        var leftMargin: CGFloat = self.sectionInset.left
        
        for attributes in attributesForElementsInRect! {
            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                var newLeftAlignedFrame = attributes.frame
                
                if leftMargin + attributes.frame.width < self.collectionViewContentSize.width {
                    newLeftAlignedFrame.origin.x = leftMargin
                } else {
                    newLeftAlignedFrame.origin.x = self.sectionInset.left
                }
                
                attributes.frame = newLeftAlignedFrame
            }
            leftMargin += attributes.frame.size.width + 8
            newAttributesForElementsInRect.append(attributes)
        }
        
        return newAttributesForElementsInRect
    }
}

