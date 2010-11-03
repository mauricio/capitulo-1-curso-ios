//
//  Conta.h
//  AprendendoObjectivec
//
//  Created by Mauricio Linhares de Aragao Junior on 31/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Conta : NSObject {
    float saldo;
    NSString * conta;
    NSString * agencia;
}

@property (copy, nonatomic) NSString * conta;
@property (copy, nonatomic) NSString * agencia;
@property (readonly) float saldo;

- (Conta *) initWithSaldo: (float) valor;
- (BOOL) depositar: (float) valor;
- (BOOL) sacar: (float) valor;
- (BOOL) transferir: (float) valor para: (Conta *) destino;

@end
