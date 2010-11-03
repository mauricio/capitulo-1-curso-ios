//
//  ContaTest.m
//  AprendendoObjectivec
//
//  Created by Mauricio Linhares de Aragao Junior on 03/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContaTest.h"
#import "Conta.h"


@implementation ContaTest

- (void) setUp {
    conta = [[Conta alloc] initWithSaldo: 200];
}

- (void) tearDown {
    [ conta release ];
}

- (void) testDepositarComSucesso {
    
    [conta depositar:150];
    STAssertTrue( conta.saldo == 350, @"Saldo final deve ser 350" );
    
}

- (void) testDepositarComFalha {
    
    [conta depositar:-150];
    STAssertTrue( conta.saldo == 200, @"Valor do saldo não deve ter se modificado" );
    
}

- (void) testSacarComSucesso {
    [conta sacar:150];
    STAssertTrue( conta.saldo == 50, @"O saldo atual deve ser 50" );
    
}

- (void) testSacarComValorMaior {
    [conta sacar: 250];
    STAssertTrue( conta.saldo == 200, @"O saldo atual não deve ter se modificado" );
    
}

- (void) testSacarComValorNegativo {
    
    [conta sacar: -100];
    STAssertTrue( conta.saldo == 200, @"O saldo atual não deve ter se modificado" );
    
}

- (void) testTransferirComSucesso {
    
    Conta * destino = [[Conta alloc] initWithSaldo: 100 ];
        
    [conta transferir:150 para: destino];
    STAssertTrue( conta.saldo == 50, @"O saldo da conta origem deve ser 50" );
    STAssertTrue( destino.saldo == 250, @"O saldo da conta destino deve ser 250" );
    
    [ destino release ];
    
}

- (void) testTransferirComFalha {
    
    Conta * destino = [[Conta alloc] init];
    
    [ conta transferir:250 para: destino ];
    STAssertTrue( conta.saldo == 200, @"O saldo da conta origem deve ser 50" );
    STAssertTrue( destino.saldo == 0, @"O saldo da conta destino deve ser 250" );    
    
    [ destino release ];
    
}

- (void) testSetContaEAgencia {
    conta.agencia = @"1111-0";
    conta.conta = @"10.000-9";
    
    STAssertEqualObjects( conta.agencia, @"1111-0", @"O valor deve ser igual" );
    STAssertEqualObjects( conta.conta, @"10.000-9", @"O valor deve ser igual" );
}

@end
