//
//  ViewController.swift
//  KakaoOAuth
//
//  Created by 정동원 on 2023/09/23.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        kakaoTalkLogin()
//        kakaoAccountLogin()
    }

    private func kakaoTalkLogin() {
        print("카카오톡 로그인")
        
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    
    private func kakaoAccountLogin() {
        print("카카오 계정 로그인")
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")

                //do something
                _ = oauthToken
            }
        }
    }
}
