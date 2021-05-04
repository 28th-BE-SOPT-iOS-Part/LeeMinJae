//
//  FTFirstViewController.swift
//  iosAssignment1Tests
//
//  Created by 민 on 2021/04/16.
//

import UIKit

class FTFirstViewController: UIViewController {

    @IBOutlet weak var serviceTableView: UITableView!
    
    var friendList: [FriendListDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFriendList()

        serviceTableView.delegate = self
        serviceTableView.dataSource = self
        serviceTableView.separatorStyle = .none
    }
    
    func setFriendList()
    {
        friendList.append(contentsOf: [
            FriendListDataModel(imageName: "profileImage1",
                                name: "안솝트",
                                state: "배고파요"),
            
            FriendListDataModel(imageName: "profileImage2",
                                name: "최솝트",
                                state: "피곤해요"),
            
            FriendListDataModel(imageName: "profileImage3",
                                name: "정솝트",
                                state: "시험언제끝나죠?"),
            
            FriendListDataModel(imageName: "profileImage4",
                                name: "이솝트",
                                state: "ㅠㅠㅠㅠ"),
            
            FriendListDataModel(imageName: "profileImage5",
                                name: "유솝트",
                                state: "나는 상태메세지!"),
            
            FriendListDataModel(imageName: "profileImage6",
                                name: "박솝트",
                                state: "원하는대로 바꿔보세요 ^_^"),
            
            FriendListDataModel(imageName: "profileImage7",
                                name: "최솝트",
                                state: "넘 덥다.."),
            
            FriendListDataModel(imageName: "profileImage8",
                                name: "원솝트",
                                state: "배고파요"),
            
            FriendListDataModel(imageName: "profileImage9",
                                name: "투솝트",
                                state: "내꿈은 대나무부자"),
            
            FriendListDataModel(imageName: "profileImage10",
                                name: "권솝트",
                                state: "걱정말라구!")
        ])
    }
    
    @IBAction func ProfileButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "FTSecondViewController") as? FTSecondViewController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension FTFirstViewController:UITableViewDelegate
{
    
}

extension FTFirstViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let serviceCell = tableView.dequeueReusableCell(withIdentifier: FirstTabTableViewCell.identifier, for: indexPath)
                as? FirstTabTableViewCell else {return UITableViewCell() }
        
        serviceCell.setData(imageName: friendList[indexPath.row].imageName,
                            name: friendList[indexPath.row].name,
                            state: friendList[indexPath.row].state)
        
        return serviceCell
    }
}
