//
//  main.m
//  NSArray
//
//  Created by Nagam Pawan on 9/19/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating Array :
        NSArray *germanMake = @[@"Mercedes Benz", @"Volkawagon", @"Ferari", @"BMW", @"Porsche", @"Audi"];
        NSArray *ukMake = [[NSArray alloc]initWithObjects:@"Austin Martin", @"Jaguar", @"Lotus", @"Bently", nil];
        NSLog(@"German make is %@", germanMake);
        NSLog(@"UK make is %@", [ukMake objectAtIndex:0]);
        
        //Enumerating Array :
        NSArray *indianMake = @[@"Celkon", @"Carbon", @"Micromax", @"Zen"];
        for (NSString *item in indianMake) {
            NSLog(@"%@", item);
        }
        for (int i = 0; i < [indianMake count]; i++) {
            NSLog(@"%d %@", i, indianMake[i]);
        }
        [indianMake enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
            NSLog(@"%ld : %@", idx, obj);
        }];
        
        //Comparing Arrays :
        NSArray *germanMake1 = @[@"Mercedes Benz", @"Volswagon", @"Ferari", @"BMW", @"Porsche", @"Audi"];
        NSArray *sameGerman = [[NSArray alloc]initWithObjects:@"Mercedes Benz", @"Volswagon", @"Ferari", @"BMW", @"Porsche", @"Audi", nil];
        if ([germanMake1 isEqualToArray:sameGerman]) {
            NSLog(@"The cars are from the same country");
        }
        else{
            NSLog(@"cars are from different countries");
        }
        
        //Membership Checking :
         NSArray *germanMake2 = @[@"Mercedes Benz", @"Volswagon", @"Ferari", @"BMW", @"Porsche", @"Audi"];
        if ([germanMake2 containsObject:@"BMW"]) {
            NSLog(@"BMW is a germen auto maker");
        }
        else{
            NSLog(@"Sorry, its not a German auto make");
        }
        NSUInteger index = [germanMake2 indexOfObject:@"BMW"];
        if (index == NSNotFound) {
            NSLog(@"Auto maker not found");
        }
        else{
            NSLog(@"BMW is a German Auto make and is at index %ld", index);
        }
        
        //Sorting Arrays :
        NSArray *germanMake3 = @[@"Mercedes Benz", @"Volswagon", @"Ferari", @"BMW", @"Porsche", @"Audi"];
        NSArray *sortedMakes = [germanMake3 sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            if ([obj1 length] < [obj2 length]) {
                return NSOrderedAscending;
            }
            else if ([obj1 length] > [obj2 length]){
                return NSOrderedDescending;
            }
            else{
                return NSOrderedSame;
            }
        }];
        NSLog(@"%@", sortedMakes);
        
        //Filtering Arrays :
        NSArray *germanMake4 = @[@"Mercedes Benz", @"Volswagon", @"Ferari", @"BMW", @"Porsche", @"Audi"];
        NSPredicate *beforeL = [NSPredicate predicateWithBlock: ^BOOL(id evaluatedObject, NSDictionary *bindings) {
            NSComparisonResult result = [@"L" compare:evaluatedObject];
            if (result == NSOrderedDescending){
                return YES;
            }
            else{
                return NO;
            }
        }];
        NSArray *makeBeforeL = [germanMake4 filteredArrayUsingPredicate:beforeL];
        NSLog(@"%@", makeBeforeL);
        
        //Subdividing Arrays :
        NSArray *germanMake5 = @[@"Mercedes Benz", @"Volswagon", @"Ferari", @"BMW", @"Porsche", @"Audi"];
        NSArray *lastTwo = [germanMake5 subarrayWithRange:NSMakeRange(4, 2)];
        NSLog(@"%@", lastTwo);
        
        //Combining Arrays :
        NSArray *germanMake6 = @[@"Mercedes Benz", @"Volswagon", @"Ferari", @"BMW", @"Porsche", @"Audi"];
        NSArray *ukMake1 = @[@"Austin Martin", @"Jaguar", @"Lotus", @"Bently"];
        NSArray *allMakes = [germanMake6 arrayByAddingObjectsFromArray:ukMake1];
        NSLog(@"%@", allMakes);
        
        //String Conversion :
        NSArray *ukMake2 = @[@"Austin Martin", @"Jaguar", @"Lotus", @"Bently"];
        NSLog(@"%@", [ukMake2 componentsJoinedByString:@" , "]);
        
        //NSMutableArray :
        NSMutableArray *brokenCars = [NSMutableArray arrayWithObjects:@"Audi A6", @"BMW Z3", @"Audi Quattro", @"Audi TT", nil];
        NSLog(@"%@", brokenCars);
        
        //Adding and Removing Objects :
        NSMutableArray *brokenCars1 = [NSMutableArray arrayWithObjects:@"Audi A6", @"BMW Z3", @"Audi Quattro", @"Audi TT", nil];
        [brokenCars1 addObject:@"BMW F25"];
        NSLog(@"%@", brokenCars1);
        [brokenCars1 removeLastObject];
        NSLog(@"%@", brokenCars1);
        [brokenCars1 insertObject:@"BMW F25" atIndex:0];
        NSLog(@"%@", brokenCars1);
        [brokenCars1 removeObjectAtIndex:0];
        NSLog(@"%@", brokenCars1);
        [brokenCars1 removeObject:@"Audi A6"];
        NSLog(@"%@", brokenCars1);
        [brokenCars1 replaceObjectAtIndex:1 withObject:@"Audi Q5"];
        NSLog(@"%@", brokenCars1);
        
        //Sorting With Descriptors :
        NSDictionary *car1 = @{
                               @"make": @"Volkswagen",
                               @"model": @"Golf",
                               @"price": [NSDecimalNumber decimalNumberWithString:@"18750.00"]
                               };
        NSDictionary *car2 = @{
                               @"make": @"Volkswagen",
                               @"model": @"Eos",
                               @"price": [NSDecimalNumber decimalNumberWithString:@"35820.00"]
                               };
        NSDictionary *car3 = @{
                               @"make": @"Volkswagen",
                               @"model": @"Jetta A5",
                               @"price": [NSDecimalNumber decimalNumberWithString:@"16675.00"]
                               };
        NSDictionary *car4 = @{
                               @"make": @"Volkswagen",
                               @"model": @"Jett A4",
                               @"price": [NSDecimalNumber decimalNumberWithString:@"16675.00"]
                               };
        NSMutableArray *cars = [NSMutableArray arrayWithObjects:car1, car2, car3, car4, nil];
        NSSortDescriptor *priceDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"price" ascending:YES selector:@selector(compare:)];
        NSSortDescriptor *modelDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"model" ascending:YES selector:@selector(caseInsensitiveCompare:)];
        NSArray *descriptors = @[priceDescriptor, modelDescriptor];
        [cars sortUsingDescriptors:descriptors];
        NSLog(@"%@", cars);
        
    }
    return 0;
}
