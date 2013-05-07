//
//  DVDCharactersViewController.m
//  StarWars
//
//  Created by Dvid Silva on 5/7/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDCharactersViewController.h"
#import "DVDCharacterArray.h"
#import "DVDCharacterViewController.h"

@interface DVDCharactersViewController ()
@property (strong, nonatomic) DVDCharacterArray *model;

@end

@implementation DVDCharactersViewController

-(id) initWithStyle:(UITableViewStyle)aStyle
              model:(DVDCharacterArray *) aModel
{
    self = [super initWithStyle:aStyle];
    if (self) {
        _model = aModel;
        self.title = @"StarWars Encyclopedia";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == IMPERIAL_SECTION){
        return self.model.imperialCount;
    }else{
        return self.model.rebelCount;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    // Averiguamos de que personaje nos estan hablando para mostrar en esta celda
    DVDCharacterModel *character = nil;
    if (indexPath.section == IMPERIAL_SECTION) {
        character  = [self.model imperialCharacterAtIndex:indexPath.row];
    }else{
        character  = [self.model rebelCharacterAtIndex:indexPath.row];
    }
    
    // Reutilizamos una celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        //si no tiene una reutilizable hay que crearla desde cero
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:CellIdentifier];
    }
    
    
    
    // Configuramos la celda // sincronizmos con la vista y el modelo
    cell.imageView.image = character.photo;
    cell.textLabel.text = character.alias;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", character.firstName, character.lastName];
    
    // dequeueReusableCellWithIdentifier is specially used with custom rows

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == IMPERIAL_SECTION)
    {
        return @"IMPERIALS";
    }else{
        return @"REBELS";
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DVDCharacterViewController *charVC = nil;
    
    if(indexPath.section == IMPERIAL_SECTION){
        charVC = [ [DVDCharacterViewController alloc] initWithModel: [self.model imperialCharacterAtIndex:indexPath.row]];
    }else{
        charVC = [ [DVDCharacterViewController alloc] initWithModel: [self.model rebelCharacterAtIndex:indexPath.row]];
    }
    [self.navigationController pushViewController:charVC animated:YES];
}

@end
