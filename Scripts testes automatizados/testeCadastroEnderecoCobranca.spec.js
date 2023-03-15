///<reference types="cypress" />

describe('crudCliente',()=>{
    
    it('crudClientes',()=>{
        
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoCobranca]').click();
        cy.wait(200);

        cy.get('[data-cy=txtNameBA]').type('Casa de Passeio');
        cy.wait(200);
        cy.get('[data-cy=txtDescriptionBA]').type('Casa Pai');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceTypeBA]').select('Casa');
        cy.wait(200);
        cy.get('[data-cy=txtStreetTypeBA]').select('Rua');
        cy.wait(200);
        cy.get('[data-cy=txtNumberBA]').type('43');
        cy.wait(200);
        cy.get('[data-cy=txtCepBA]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhoodBA]').type('Centro');
        cy.wait(200);
        cy.get('[data-cy=txtCountryBA]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateBA]').type('5');
        cy.wait(200);
        cy.get('[data-cy=txtCityBA]').type('São Paulo');
        cy.wait(200);
        cy.get('[data-cy=txtObservationBA]').type('Casa Arrumada');
        cy.wait(200);
        cy.get('#MudarTabelaEndereco').click();
        
        
        cy.wait(600);


        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoCobranca]').click();
        cy.wait(200);

        cy.get('[data-cy=txtDescriptionBA]').type('Casa Pai');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceTypeBA]').select('Casa');
        cy.wait(200);
        cy.get('[data-cy=txtStreetTypeBA]').select('Rua');
        cy.wait(200);
        cy.get('[data-cy=txtStreetNameBA]').type('Rua das Couves');
        cy.wait(200);
        cy.get('[data-cy=txtNumberBA]').type('43');
        cy.wait(200);
        cy.get('[data-cy=txtCepBA]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhoodBA]').type('Centro');
        cy.wait(200);
        cy.get('[data-cy=txtCountryBA]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateBA]').type('5');
        cy.wait(200);
        cy.get('[data-cy=txtCityBA]').type('São Paulo');
        cy.wait(200);
        cy.get('[data-cy=txtObservationBA]').type('Casa Arrumada');
        cy.wait(200);
        cy.get('#MudarTabelaEndereco').click();
        
        
        cy.wait(600);

        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoCobranca]').click();
        cy.wait(200);

        cy.get('[data-cy=txtNameBA]').type('Casa de Passeio');
        cy.wait(200);
        cy.get('[data-cy=txtDescriptionBA]').type('Casa Pai');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceTypeBA]').select('Casa');
        cy.wait(200);
        cy.get('[data-cy=txtStreetTypeBA]').select('Rua');
        cy.wait(200);
        cy.get('[data-cy=txtStreetNameBA]').type('Rua das Couves');
        cy.wait(200);
        cy.get('[data-cy=txtNumberBA]').type('43');
        cy.wait(200);
        cy.get('[data-cy=txtCepBA]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhoodBA]').type('Centro');
        cy.wait(200);
        cy.get('[data-cy=txtCountryBA]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateBA]').type('5');
        cy.wait(200);
        cy.get('[data-cy=txtCityBA]').type('São Paulo');
        cy.wait(200);
        cy.get('[data-cy=txtObservationBA]').type('Casa Arrumada');
        cy.wait(200);
        cy.get('#MudarTabelaEndereco').click();
        
        
        cy.wait(600);


        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoCobranca]').click();
        cy.wait(200);

        cy.get('[data-cy=txtNameBA]').type('Casa Veraneio');
        cy.wait(200);
        cy.get('[data-cy=txtDescriptionBA]').type('Casa Pai');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceTypeBA]').select('Casa');
        cy.wait(200);
        cy.get('[data-cy=txtStreetTypeBA]').select('Rua');
        cy.wait(200);
        cy.get('[data-cy=txtStreetNameBA]').type('Rua das Couves');
        cy.wait(200);
        cy.get('[data-cy=txtNumberBA]').type('43');
        cy.wait(200);
        cy.get('[data-cy=txtCepBA]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhoodBA]').type('Centro');
        cy.wait(200);
        cy.get('[data-cy=txtCountryBA]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateBA]').type('5');
        cy.wait(200);
        cy.get('[data-cy=txtCityBA]').type('Jardim das Flores');
        cy.wait(200);
        cy.get('[data-cy=txtObservationBA]').type('Casa Arrumada');
        cy.wait(200);
        cy.get('#MudarTabelaEndereco').click();
        
        cy.wait(600);
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioLeituraLogin')
        cy.viewport(1500, 1000)

        cy.get(':nth-child(1) > :nth-child(4) > .btn-primary > .fa').click();
        cy.wait(200);
        
        cy.get('[data-cy=enderecoCobranca]').click();
        cy.wait(200);


       





        


        
        



    });

    

});