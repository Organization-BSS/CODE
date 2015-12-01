//
//  HomeViewController.m
//  SelfRecord
//
//  Created by bss on 11/30/15.
//  Copyright © 2015 DevilTaining. All rights reserved.
//

#import "HomeViewController.h"
#import "BSFileDealer.h"
#import "addContentViewController.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView * tableView;
    
    
}
@property (nonatomic,strong)NSArray *filesNameArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self addControlls];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)refreshButtonPressed:(id)sender {
    [self initData];
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark--
#pragma mark instance method
- (void)initData {
    _filesNameArray = [BSFileDealer fileNamesInDirectoryPath:[BSFileDealer appDocumentsDirectoryPath]];
}

- (void)addControlls {
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (IBAction)addContent:(id)sender {
    addContentViewController *addVC = [[addContentViewController alloc]initWithNibName:@"addContentViewController" bundle:nil];
    addVC.type = VCTYPE_ADD;
    [self presentViewController:addVC animated:YES completion:nil];
}

#pragma mark--
#pragma mark datasource method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _filesNameArray.count;
}
- (UITableViewCell * )tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [_filesNameArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark--
#pragma mark UITableViewDelegate method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    addContentViewController *showVC = [[addContentViewController alloc]initWithNibName:@"addContentViewController" bundle:nil];
    showVC.type = VCTYPE_SHOW;
    showVC.path = [[BSFileDealer appDocumentsDirectoryPath] stringByAppendingPathComponent:cell.textLabel.text];
    [self presentViewController:showVC animated:YES completion:nil];
}
@end
