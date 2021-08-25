///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///

import UIKit
import SwiftyDropbox



class ViewController: UIViewController {
    @IBOutlet weak var runTestsButton: UIButton!
    @IBOutlet weak var codeFlowlinkButton: UIButton!
    @IBOutlet weak var unlinkButton: UIButton!
    @IBOutlet weak var runBatchUploadTestsButton: UIButton!
    
    // note if you add new scopes, you need to relogin to update your token
    private let userScopes = "account_info.read files.content.read files.content.write files.metadata.read files.metadata.write sharing.read sharing.write".components(separatedBy: " ")
    private let teamScopes = "groups.read groups.write members.delete members.read members.write sessions.list team_data.member team_info.read files.content.write files.content.read sharing.write account_info.read".components(separatedBy: " ")
    
    @IBAction func codeFlowLinkButtonPressed(_ sender: AnyObject) {
        let scopeRequest: ScopeRequest
        switch(appPermission) {
        case .fullDropboxScoped:
            scopeRequest = ScopeRequest(scopeType: .user, scopes: userScopes, includeGrantedScopes: false)
        case .fullDropboxScopedForTeamTesting:
            scopeRequest = ScopeRequest(scopeType: .team, scopes: teamScopes, includeGrantedScopes: false)
        }
        DropboxClientsManager.authorizeFromControllerV2(UIApplication.shared,
                                                        controller: self,
                                                        loadingStatusDelegate: nil,
                                                        openURL: {(url: URL) -> Void in UIApplication.shared.open(url, options: [:], completionHandler: nil) },
                                                        scopeRequest: scopeRequest)
    }

    @IBAction func unlinkButtonPressed(_ sender: AnyObject) {
        DropboxClientsManager.unlinkClients()
        checkButtons()
    }

    @IBAction func runTestsButtonPressed(_ sender: AnyObject) {
        let unlink = {
            DropboxClientsManager.unlinkClients()
            self.checkButtons()
            exit(0)
        }
        
        switch(appPermission) {
        case .fullDropboxScoped:
            DropboxTester().testAllUserEndpoints(asMember: false, nextTest:unlink)
        case .fullDropboxScopedForTeamTesting:
            DropboxTeamTester().testTeamMemberFileAcessActions(unlink)
        }
    }

    @IBAction func runBatchUploadTestsButtonPressed(_ sender: Any) {
        DropboxTester().testBatchUpload()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkButtons()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        checkButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkButtons() {
        if DropboxClientsManager.authorizedClient != nil || DropboxClientsManager.authorizedTeamClient != nil {
            codeFlowlinkButton.isHidden = true
            unlinkButton.isHidden = false
            runTestsButton.isHidden = false
            runBatchUploadTestsButton.isHidden = false
        } else {
            codeFlowlinkButton.isHidden = false
            unlinkButton.isHidden = true
            runTestsButton.isHidden = true
            runBatchUploadTestsButton.isHidden = true
        }
    }

    /**
        To run these unit tests, you will need to do the following:

        Navigate to TestSwifty/ and run `pod install` to install AlamoFire dependencies.

        There are three types of unit tests here:

        1.) Regular Dropbox User API tests (requires app with 'Full Dropbox' permissions)
        2.) Dropbox Business API tests (requires app with 'Team member file access' permissions)
        3.) Dropbox Business API tests (requires app with 'Team member management' permissions)

        To run all of these tests, you will need three apps, one for each of the above permission types.

        You must test these apps one at a time.

        Once you have these apps, you will need to do the following:

        1.) Fill in user-specific data in `TestData` and `TestTeamData` in TestData.swift
        2.) For each of the above apps, you will need to add a user-specific app key. For each test run, you
            will need to call `DropboxClientsManager.setupWithAppKey` (or `DropboxClientsManager.setupWithTeamAppKey`) and supply the
            appropriate app key value, in AppDelegate.swift
        3.) Depending on which app you are currently testing, you will need to toggle the `appPermission` variable
            in AppDelegate.swift to the appropriate value.
        4.) For each of the above apps, you will need to add a user-specific URL scheme in Info.plist >
            URL types > Item 0 (Editor) > URL Schemes > click '+'. URL scheme value should be 'db-<APP KEY>'
            where '<APP KEY>' is value of your particular app's key

        To create an app or to locate your app's app key, please visit the App Console here:

        https://www.dropbox.com/developers/apps
    */
}
