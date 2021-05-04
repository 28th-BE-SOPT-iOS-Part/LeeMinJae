//
//  FfthFirstViewController.swift
//  iosAssignment1
//
//  Created by 민 on 2021/05/02.
//

import UIKit

class FfthFirstViewController: UIViewController {

    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    private var detailList : [DetailListDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDetailList()
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
    }
    
    func setDetailList()
    {
        detailList.append(contentsOf: [
            DetailListDataModel(detailName: "메일"), DetailListDataModel(detailName: "캘린더"),
            DetailListDataModel(detailName: "서랍"), DetailListDataModel(detailName: "카카오콘"),
            DetailListDataModel(detailName: "메이커스"), DetailListDataModel(detailName: "선물하기"),
            DetailListDataModel(detailName: "이모티콘"), DetailListDataModel(detailName: "프렌즈"),
            DetailListDataModel(detailName: "쇼핑하기"), DetailListDataModel(detailName: "스타일"),
            DetailListDataModel(detailName: "주문하기"), DetailListDataModel(detailName: "멜론티켓"),
            DetailListDataModel(detailName: "게임"), DetailListDataModel(detailName: "멜론"),
            DetailListDataModel(detailName: "헤어샵"), DetailListDataModel(detailName: "전체서비스")
        ])
    }
}

extension FfthFirstViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier: FifthTabCollectionViewCell.identifier, for: indexPath)
                as? FifthTabCollectionViewCell else {return UICollectionViewCell() }
        
        detailCell.setData(name: detailList[indexPath.row].detailName)
        
        return detailCell
    }
    
}

extension FfthFirstViewController: UICollectionViewDelegate
{
    
}

extension FfthFirstViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (70/375)
        let cellHeight = cellWidth * (70/70)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
