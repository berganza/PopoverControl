//
//  ViewController.m
//  PopoverControl
//
//  Created by LLBER on 17/07/13.
//  Copyright (c) 2013 Berganza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nombreArray=[[NSMutableArray alloc] initWithObjects:@"Seleccione una opción",@"Steve",@"Leonardo",@"Ken", nil];
    self.apellidoArray=[[NSMutableArray alloc] initWithObjects:@"Seleccione una opción",@"Da Vinci",@"Robinson",@"Jobs", nil];
    self.nombrePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 270)];
    self.nombrePicker.delegate = self;
    self.nombrePicker.dataSource = self;
    self.apellidoPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 270)];
    self.apellidoPicker.delegate = self;
    self.apellidoPicker.dataSource = self;
    self.nombrePicker.showsSelectionIndicator=YES;
    self.apellidoPicker.showsSelectionIndicator=YES;
    self.apellidoPicker.tag=1;
    self.nombrePicker.tag=2;
    self.nombre.delegate=self;
    self.apellido.delegate=self;
    self.apellido.tag=1;
    self.nombre.tag=2;
}





#pragma mark -UIPcikerView
/*
 *Implementacion del pickerView
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (pickerView.tag==1){
        
        self.apellido.text=[self.apellidoArray objectAtIndex:row];
        
    } else if (pickerView.tag==2){
        
        self.nombre.text=[self.nombreArray objectAtIndex:row ];
        
    }
    
    if (self.popover != nil) {
        
        [self.popover dismissPopoverAnimated:YES];
        
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (pickerView.tag==1){
        
        return [self.apellidoArray count];
        
    } else {
        
        return [self.nombreArray count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (pickerView.tag==1){
        
        return  [self.apellidoArray objectAtIndex:row];
        
    } else  {
        
        return  [self.nombreArray objectAtIndex:row];
    }
}

#pragma  -Metodo para cargar popup con claves
- (BOOL)textFieldShouldBeginEditing:(UITextField *) textField {
    
    UIViewController* pickerController= [[UIViewController alloc]init];
    
    if (textField.tag==1) {
        
        [pickerController.view addSubview:self.apellidoPicker];
        
    } else if(textField.tag==2) {
        
        [pickerController.view addSubview:self.nombrePicker];
        
    }
    
    self.popover = [[UIPopoverController alloc] initWithContentViewController:pickerController];
    [self.popover setDelegate:self];
    
    if (textField.tag==1) {
        
        [self.popover presentPopoverFromRect:textField.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    } else if (textField.tag==2) {
        
        [self.popover presentPopoverFromRect:textField.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    }
    
    [self.popover setPopoverContentSize:CGSizeMake(320, 220)];
    
    return NO;
}


- (IBAction)mostrarPersonaje:(id)sender {
    
    if ([_nombre.text isEqual:@"Leonardo"] && [_apellido.text isEqual:@"Da Vinci"]) {
        _personaje.image = [UIImage imageNamed: @"LeonardoDaVinci.png"];
    } else if ([_nombre.text isEqual:@"Ken"] && [_apellido.text isEqual:@"Robinson"]) {
        _personaje.image = [UIImage imageNamed: @"KenRobinson.png"];
    } else if ([_nombre.text isEqual:@"Steve"] && [_apellido.text isEqual:@"Jobs"]) {
        _personaje.image = [UIImage imageNamed: @"SteveJobs.png"];
    } else {
        _personaje.image = [UIImage imageNamed: nil];
        _etiqueta.text = @"Te has equivocado";
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
