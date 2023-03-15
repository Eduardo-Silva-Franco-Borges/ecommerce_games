///<reference types="cypress" />

describe('crudCliente',()=>{
    
    it('crudClientes',()=>{
        
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=Cartoes]').click();
        cy.wait(200);

        cy.get('[data-cy=txtBandeiraCartao]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtNumeroCartao]').type('8774 8888 9999 6666');
        cy.wait(200);
        cy.get('[data-cy=txtcodigoSegurancaCartao]').type('789');
        cy.wait(200);
        
        cy.get('#MudarTabelaCartao').click();
        
        
        cy.wait(600);


        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=Cartoes]').click();
        cy.wait(200);

        cy.get('[data-cy=txtBandeiraCartao]').select('1');
        cy.wait(200);
        
        cy.get('[data-cy=txtNomeCartao]').type('Eduardo Borges');
        cy.wait(200);
        cy.get('[data-cy=txtcodigoSegurancaCartao]').type('789');
        cy.wait(200);
        cy.get('#MudarTabelaCartao').click();
        
        cy.wait(600);

        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=Cartoes]').click();
        cy.wait(200);

        cy.get('[data-cy=txtBandeiraCartao]').select('4');
        cy.wait(200);
        cy.get('[data-cy=txtNumeroCartao]').type('7777 7777 7777 7777');
        cy.wait(200);
        cy.get('[data-cy=txtNomeCartao]').type('Marcia Silva');
        cy.wait(200);
        cy.get('[data-cy=txtcodigoSegurancaCartao]').type('789');
        cy.wait(200);
        cy.get('#MudarTabelaCartao').click();
        
        
        cy.wait(600);


        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=Cartoes]').click();
        cy.wait(200);

        cy.get('[data-cy=txtBandeiraCartao]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtNumeroCartao]').type('8774 8888 9999 6666');
        cy.wait(200);
        cy.get('[data-cy=txtNomeCartao]').type('Eduardo Borges');
        cy.wait(200);
        cy.get('[data-cy=txtcodigoSegurancaCartao]').type('789');
        cy.wait(200);
        cy.get('#MudarTabelaCartao').click();
        
        
        cy.wait(600);
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=Cartoes]').click();
        cy.wait(200);


       





        


        
        



    });

    

});