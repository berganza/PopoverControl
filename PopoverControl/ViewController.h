//
//  ViewController.h
//  PopoverControl
//
//  Created by LLBER on 17/07/13.
//  Copyright (c) 2013 Berganza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPopoverControllerDelegate, UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic,strong)NSMutableArray* apellidoArray;
@property(nonatomic,strong)NSMutableArray* nombreArray;
@property (nonatomic,strong) UIPickerView* nombrePicker;
@property (nonatomic,strong) UIPickerView* apellidoPicker;

@property(nonatomic,strong)IBOutlet UITextField* apellido;
@property(nonatomic,strong)IBOutlet UITextField* nombre;

@property(nonatomic,strong)UIPopoverController* popover;

- (IBAction)mostrarPersonaje:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *personaje;
@property (strong, nonatomic) IBOutlet UILabel *etiqueta;


@end
