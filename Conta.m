//
//  Conta.m
//  AprendendoObjectivec
//
//  Created by Mauricio Linhares de Aragao Junior on 31/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Conta.h"


@implementation Conta

@synthesize agencia, conta, saldo;

- (void) dealloc {
    [ self.agencia release ];
    [ self.conta release ];
    [ super dealloc ];
}

- (Conta *) initWithSaldo:(float)valor {
    
    if ( self = [ self init]) {
        saldo = valor;
    } 
    
    return self;
}

- (BOOL) depositar: (float) valor {
    if ( valor > 0 ) {
        saldo += valor;
        return YES;
    } else {
        return NO;
    }
}

- (BOOL) sacar:(float)valor {
    if ( valor > 0 && valor <= saldo) {
        saldo -= valor;
        return YES;
    } else {
        return NO;
    }

}

- (BOOL) transferir:(float) valor para:(Conta *) destino {
    if ( [self sacar: valor] && [ destino depositar:  valor ] ){
        return YES;
    } else {
        return NO;
    }
}

@end
