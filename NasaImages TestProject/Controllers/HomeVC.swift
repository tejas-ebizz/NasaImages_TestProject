//
//  HomeVC.swift
//  NasaImages TestProject
//
//  Created by TL-1 on 06/03/23.
//

import UIKit
import SVProgressHUD

class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayPictures = [PicturesModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        APICalling()
    }

    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageListViewCell.nib, forCellWithReuseIdentifier: ImageListViewCell.identifier)
        collectionView.reloadData()
        
        collectionView.layer.shadowColor = UIColor.darkGray.cgColor
        collectionView.layer.shadowOffset = .zero
        collectionView.layer.shadowRadius = 2
        collectionView.layer.shadowOpacity = 0.3
    }
}

//MARK: UICollectionView
extension HomeVC : UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayPictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageListViewCell.identifier, for: indexPath) as! ImageListViewCell
        cell.configCell(arrayPictures[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.collectionView.bounds.width - 30)/2
        let height = (width + 60)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: DetailsVC.identifier) as! DetailsVC
        vc.arrayPictures = arrayPictures
        vc.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


//MARK: API Calling
extension HomeVC {
    
    func APICalling(){
        SVProgressHUD.show()
        APICallingManager.shared.getPictures { array in
            SVProgressHUD.dismiss()
            if let array = array {
                DispatchQueue.main.async {
                    self.arrayPictures = array
                    self.collectionView.reloadData()
                }
            }
        }
    }
}
