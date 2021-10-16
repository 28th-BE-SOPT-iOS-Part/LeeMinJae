//
//  FfthFirstViewController.swift
//  iosAssignment1
//
//  Created by 민 on 2021/05/02.
//

import UIKit

class FfthFirstViewController: UIViewController {

    // CollectionView를 Outlet 변수로 선언
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    // DetailListDataModel형을 가지는 빈 Array 생성
    private var detailList : [DetailListDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 선언해둔 빈 Array에 내용을 집어 넣는 set함수를 호출하면서, 내용이 채워짐
        setDetailList()
        
        // Delegate pattern -> 해당 CollectionView의 delegate와 dataSource의 위임자는 자기자신이라는 뜻
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
    }
    
    // 선언해둔 빈 Array에 내용을 집어 넣는 함수
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

// UICollectionViewDataSource 프로토콜
extension FfthFirstViewController : UICollectionViewDataSource
{
    // CollectionView의 Cell을 얼마나 만들어야 할까? -> Array의 개수만큼 만들어줘!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // reuse를 사용해서 cell을 가져오거나 생성 -> guard - let 구문을 통해 안전하게 값을 가져와서 CollectionViewCell에 넣어준다
        // identifier: Cell을 구분, indexPath: 순서를 관리
        guard let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier:   FifthTabCollectionViewCell.identifier, for: indexPath)
                as? FifthTabCollectionViewCell else {return UICollectionViewCell() }
        
        // 위에서 안전하게 생성한 MusicCell에 대해서 값을 -> detailList의 값으로 차곡차곡 채워준다
        detailCell.setData(name: detailList[indexPath.row].detailName)
        
        // 데이터가 담겨있는 detailcell을 return 한다
        return detailCell
    }
    
}

// UICollectionViewDelegate 프로토콜
extension FfthFirstViewController: UICollectionViewDelegate
{
    
}

// UICollectionViewDelegateFlowLayout 프로토콜 -> 보통 4가지 메서드를 통해 Cell들의 Layout을 구성하게 된다!
extension FfthFirstViewController : UICollectionViewDelegateFlowLayout
{
    // sizeForItemAt 메서드: 각 Cell의 크기를 CGSize 형태로 return
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width      // 현재 사용하는 기기의 width를 가져와서 저장
        
        let cellWidth = width * (70/375)            // 제플린에서의 비율만큼 곱해서 width를 결정
        let cellHeight = cellWidth * (70/70)        // 제플린에서의 비율만큼 곱해서 height를 결정
        
        return CGSize(width: cellWidth, height: cellHeight)     // 정해진 가로/세로를 CGSize형으로 return
    }
    
    // ContentInset 메서드: Cell에서 Content 외부에 존재하는 Inset의 크기를 결정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero    //  Inset을 사용하지 않는다는 뜻
    }
    
    // minimumLineSpacing 메서드: Cell 들의 위, 아래 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 19       // 상하 19포인트 : lineSpacing -> return 19
    }
    
    // minimumInteritemSpacing 메서드: Cell 들의 좌,우 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3        // 좌우 3포인트 : InterItemSpacing -> return 3
    }
}
