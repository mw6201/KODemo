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
    
    //@IBOutlet var collectionView: UICollectionView?
    
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
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        let label = cell.contentView.subviews[0] as! UILabel
        
        var _kc = (UIApplication.sharedApplication().delegate! as! AppDelegate)._KOClient
        
        label.text = "\(indexPath.section) \(indexPath.row) \(_kc.TransportStatusList[indexPath.section].allKeys[indexPath.row])";
        
        println(label.text)
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println("numberOfItemsInSection \(section)")
        
        var _kc = (UIApplication.sharedApplication().delegate! as! AppDelegate)._KOClient
        
        return _kc.TransportStatusList[0].count
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
        
        refreshUI()
        
        getData(self)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getData(sender: AnyObject) {
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
