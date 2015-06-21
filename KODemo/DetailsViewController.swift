//
//  DetailsViewController.swift
//  KODemo
//
//  Created by Michael Walter on 12.06.15.
//  Copyright (c) 2015 Michael Walter. All rights reserved.
//

import UIKit

class DetailsViewController: UICollectionViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var weaponImageView: UIImageView!
    
    @IBOutlet var _collectionView: UICollectionView!
    
    var monster: Monster! {
        didSet (newMonster) {
            self.refreshUI()
        }
    }
    
    func refreshUI() {
        /*nameLabel?.text = monster.name
        descriptionLabel?.text = monster.description
        iconImageView?.image = UIImage(named: monster.iconName)
        weaponImageView?.image = monster.weaponImage() */
        
        
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        var _kc = (UIApplication.sharedApplication().delegate! as! AppDelegate)._KOClient
        return _kc.TransportStatusList.count
        
        //return 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        //var _x = indexPath.row * 150;
        
        //cell.backgroundColor = UIColor.brownColor()
        //cell.bounds = CGRect(x: 0,y: 0,width: 150,height: 20)
        
        /*
        cell.frame.size.width = 250.0;
        cell.frame.size.height = 50.0;
        
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth = 0.5
        */
        
        let label = cell.contentView.subviews[0] as! UILabel
        label.font = UIFont(name: label.font.fontName, size: 8);
        
        var _kc = (UIApplication.sharedApplication().delegate! as! AppDelegate)._KOClient
        
        var columnname = _kc.TransportStatusList[indexPath.section].allKeys[indexPath.row] as? String
        
        var ovalue: AnyObject? = _kc.TransportStatusList[indexPath.section].valueForKey(columnname!)
        
        var value: String = ""
        
        if let tmp = ovalue as? String {
            value = ovalue as! String
        }
        
        if let tmp = ovalue as? NSInteger {
            value = String(ovalue as! NSInteger)
        }
        
        label.text = value;
        
        println(label.text)
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println("numberOfItemsInSection \(section)")
        
        var _kc = (UIApplication.sharedApplication().delegate! as! AppDelegate)._KOClient
        
        if _kc.TransportStatusList.count > 0 {
            return _kc.TransportStatusList[0].count
        } else {
            return 0
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 90)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
        */
        
        /*
        let layout = (self.collectionViewLayout as! DetailsUICollectionViewLayout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        */
        //self.si CGSize(width: 1024, height: 480)
        
        //refreshUI()
        
        let nib = UINib(nibName: "GalleryItemCommentView", bundle: nil)
        _collectionView.registerNib(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "GalleryItemCommentView")
        
        LoginKO(self)
        
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(animated: Bool) {
        println("DetailsViewController: viewDidAppear")
        
        self.collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func LoginKO(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue(), {
            
            var _kc = (UIApplication.sharedApplication().delegate! as! AppDelegate)._KOClient
            _kc.Login()
            
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsViewController: MonsterSelectionDelegate {
    func monsterSelected(newMonster: Monster) {
        monster = newMonster
    }
}
