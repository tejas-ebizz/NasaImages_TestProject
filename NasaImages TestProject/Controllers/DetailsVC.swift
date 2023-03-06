//
//  DetailsVC.swift
//  NasaImages TestProject
//
//  Created by TL-1 on 06/03/23.
//

import UIKit

class DetailsVC: UIViewController {
    
    static let identifier = "DetailsVC"
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayPictures = [PicturesModel]()
    var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: IndexPath(row: self.selectedIndex, section: 0), at: .left, animated: false)
        }
    }
    
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.register(ImageDetailViewCell.nib, forCellWithReuseIdentifier: ImageDetailViewCell.identifier)
        collectionView.reloadData()
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: IndexPath(row: self.selectedIndex, section: 0), at: .left, animated: false)
        }
    }
}

//MARK: UICollectionView
extension DetailsVC : UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayPictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageDetailViewCell.identifier, for: indexPath) as! ImageDetailViewCell
        cell.configCell(arrayPictures[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
    }
}

