///<reference types="cypress" />

describe('crudCliente',()=>{
    
    it('crudClientes',()=>{
        
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoEntrega]').click();
        cy.wait(200);

        cy.get('[data-cy=txtNameDA]').type('Casa de Passeio');
        cy.wait(200);
        cy.get('[data-cy=txtDescriptionDA]').type('Casa Pai');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceTypeDA]').select('Casa');
        cy.wait(200);
        cy.get('[data-cy=txtStreetTypeDA]').select('Rua');
        cy.wait(200);
        cy.get('[data-cy=txtNumberDA]').type('43');
        cy.wait(200);
        cy.get('[data-cy=txtCepDA]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhoodDA]').type('Centro');
        cy.wait(200);
        cy.get('[data-cy=txtCountryDA]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateDA]').type('5');
        cy.wait(200);
        cy.get('[data-cy=txtCityDA]').type('São Paulo');
        cy.wait(200);
        cy.get('[data-cy=txtObservationDA]').type('Casa Arrumada');
        cy.wait(200);
        cy.get('#MudarTabelaEnderecoEntrega').click();
        
        
        cy.wait(600);


        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoEntrega]').click();
        cy.wait(200);

        cy.get('[data-cy=txtDescriptionDA]').type('Casa Pai');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceTypeDA]').select('Casa');
        cy.wait(200);
        cy.get('[data-cy=txtStreetTypeDA]').select('Rua');
        cy.wait(200);
        cy.get('[data-cy=txtStreetNameDA]').type('Rua das Couves');
        cy.wait(200);
        cy.get('[data-cy=txtNumberDA]').type('43');
        cy.wait(200);
        cy.get('[data-cy=txtCepDA]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhoodDA]').type('Centro');
        cy.wait(200);
        cy.get('[data-cy=txtCountryDA]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateDA]').type('5');
        cy.wait(200);
        cy.get('[data-cy=txtCityDA]').type('São Paulo');
        cy.wait(200);
        cy.get('[data-cy=txtObservationDA]').type('Casa Arrumada');
        cy.wait(200);
        cy.get('#MudarTabelaEnderecoEntrega').click();
        
        
        cy.wait(600);

        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoEntrega]').click();
        cy.wait(200);

        cy.get('[data-cy=txtNameDA]').type('Casa Tias distantes');
        cy.wait(200);
        cy.get('[data-cy=txtDescriptionDA]').type('Casa Pai');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceTypeDA]').select('Casa');
        cy.wait(200);
        cy.get('[data-cy=txtStreetTypeDA]').select('Rua');
        cy.wait(200);
        cy.get('[data-cy=txtStreetNameDA]').type('Rua das Couves');
        cy.wait(200);
        cy.get('[data-cy=txtNumberDA]').type('43');
        cy.wait(200);
        cy.get('[data-cy=txtCepDA]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhoodDA]').type('Centro');
        cy.wait(200);
        cy.get('[data-cy=txtCountryDA]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateDA]').type('5');
        cy.wait(200);
        cy.get('[data-cy=txtCityDA]').type('São Paulo');
        cy.wait(200);
        cy.get('[data-cy=txtObservationDA]').type('Casa Arrumada');
        cy.wait(200);
        cy.get('#MudarTabelaEnderecoEntrega').click();
        
        
        cy.wait(600);


        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoEntrega]').click();
        cy.wait(200);

        cy.get('[data-cy=txtNameDA]').type('Casa Primos');
        cy.wait(200);
        cy.get('[data-cy=txtDescriptionDA]').type('Casa Pai');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceTypeDA]').select('Casa');
        cy.wait(200);
        cy.get('[data-cy=txtStreetTypeDA]').select('Rua');
        cy.wait(200);
        cy.get('[data-cy=txtStreetNameDA]').type('Rua das Couves');
        cy.wait(200);
        cy.get('[data-cy=txtNumberDA]').type('43');
        cy.wait(200);
        cy.get('[data-cy=txtCepDA]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhoodDA]').type('Centro');
        cy.wait(200);
        cy.get('[data-cy=txtCountryDA]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateDA]').type('5');
        cy.wait(200);
        cy.get('[data-cy=txtCityDA]').type('Jardim das Flores');
        cy.wait(200);
        cy.get('[data-cy=txtObservationDA]').type('Casa Arrumada');
        cy.wait(200);
        cy.get('#MudarTabelaEnderecoEntrega').click();
        
        cy.wait(600);
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoEntrega]').click();
        cy.wait(200);


       





        


        
        



    });

    

});