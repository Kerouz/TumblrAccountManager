//
//  tmbViewController.h
//  TumblrAccountManager
//
//  Created by Apple on 12/08/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tmbViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *accounts;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
