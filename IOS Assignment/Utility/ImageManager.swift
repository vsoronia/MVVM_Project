//
//  ImageManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 14/3/24.
//

import Foundation
import SwiftUI

struct ImageManager {
    //User List Row View Images
    let isActiveUser: Image = Image(systemName: "smallcircle.filled.circle.fill")
    let isInactiveUser: Image = Image(systemName: "smallcircle.filled.circle.fill")
    
    //About Us View Images
    let applicationIcon: Image = Image(systemName: "apps.iphone")
    let compatibilityIcon: Image = Image(systemName: "info.circle")
    let technologyIcon: Image = Image(systemName: "swift")
    let versionIcon: Image = Image(systemName: "gear")
    let developerIcon: Image = Image(systemName: "ellipsis.curlybraces")
    let designerIcon: Image = Image(systemName: "paintpalette")
    let facebookIcon: Image = Image(systemName: "f.square")
    let instagramIcon: Image = Image(systemName: "camera.metering.center.weighted")
    let contactAndSupportIcon: Image = Image(systemName: "questionmark.circle")
    
    //User Detail View
    let trashIcon = "trash"
    
    //SignUp View
    let lockShieldIcon = "lock.shield"
    
    //Home List Row View
    let placeHolderUserImageIcon: Image = Image(systemName: "person.circle.fill")
    let expandedIcon: Image = Image(systemName: "arrow.up.right.and.arrow.down.left.square")
    let expandIcon: Image = Image(systemName: "arrow.down.left.and.arrow.up.right.square")
    
    //Todo List Row ViewModel
    let todoIsPending: Image = Image(systemName: "ellipsis.circle")
    let todoIsCompleted: Image = Image(systemName: "checkmark.circle")
    
    //Side menu row view model
    let sideMenuHomeIcon: Image = Image(systemName: "house")
    let sideMenuUsersIcon: Image = Image(systemName: "person")
    let sideMenuTodosIcon: Image = Image(systemName: "list.bullet")
    let sideMenuAboutusIcon: Image = Image(systemName: "info.circle")
    
    //Side menu Button View
    let hideSideMenuIcon: Image = Image(systemName: "text.justify")
    let showSideMenuIcon: Image = Image(systemName: "text.justify.left")
}
