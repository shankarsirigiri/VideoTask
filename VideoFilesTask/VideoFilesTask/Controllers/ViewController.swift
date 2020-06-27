//
//  ViewController.swift
//  VideoFilesTask
//
//  Created by Shankar Sirigiri on 27/06/20.
//  Copyright © 2020 Shankar Sirigiri. All rights reserved.
//
import UIKit
import AlamofireImage

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
   var videos = [VideoObject]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.register(UINib(nibName: "CustoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustoCollectionViewCell")
        self.designNavBar()
        
        self.getVideoDetails()
    }
    
    func designNavBar(){
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Video Files";
        label.font = UIFont.boldSystemFont(ofSize: 16)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        
        let searchImage       = UIImage(named: "searchImage")!
        let calImage   = UIImage(named: "calImage")!

        let searchButton      = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: #selector(didTapSearchButton))
        let calButton  = UIBarButtonItem(image: calImage,  style: .plain, target: self, action: #selector(didTapCalButton))

        navigationItem.rightBarButtonItems = [calButton, searchButton]
    }
    
    @objc func didTapSearchButton(sender: AnyObject) {
        print("Search")
    }

    @objc func didTapCalButton(sender: AnyObject) {
        print("Calender")
    }

    func getVideoDetails(){
        APIClient.getAllVideos(offset: 0, page: 6) { result in
            switch result {
            case .success(let res):
                print("_____________________________")
                print(res)
                self.videos = res
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
   
    //UICollectionViewDatasource methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell : CustoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustoCollectionViewCell", for: indexPath as IndexPath) as! CustoCollectionViewCell
        
        let res = videos[indexPath.row]
        let url = URL(string: res.thumbnail)!
        cell.imgIcon.af_setImage(withURL: url, placeholderImage: nil)
        if res.status == "STATUS_DOWNLOADED"{
            cell.imgStatus.image = UIImage(named: "STATUS_DOWNLOADED")!
        } else if res.status == "STATUS_UPLOADED"{
            cell.imgStatus.image = UIImage(named: "STATUS_UPLOADED")!
        }else{
            cell.imgStatus.image = UIImage(named: "STATUS_NONE")!
        }
        cell.lblData.text = res.fileSize
        cell.lblDate.text = res.dateTime
        return cell
    }
    
}


