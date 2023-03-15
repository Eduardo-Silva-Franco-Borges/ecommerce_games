///<reference types="cypress" />

describe('crudCliente',()=>{
    
    it('crudClientes',()=>{
        
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioCriacaoLogin')
        cy.viewport(1500, 800)
        cy.wait(200);
        cy.get('[data-cy=txtName]').type('Eduardo');
        cy.wait(200);
        cy.get('[data-cy=txtLastName]').type('Borges');
        cy.wait(200);
        cy.get('[data-cy=txtBirthDate]').type('2021-01-01');
        cy.wait(200);
        cy.get('[data-cy=txtGender]').select('F');
        cy.wait(200);
        cy.get('[data-cy=txtTypeDocument]').select('3');
        cy.wait(200);
        cy.get('[data-cy=txtDocument]').type('48981148813');
        cy.wait(200);
        cy.get('[data-cy=txtValidadeDocument]').type('2021-01-01');
        cy.wait(200);
        cy.get('[data-cy=txtPhoneType]').select('Telefone');
        cy.wait(200);
        cy.get('[data-cy=txtPhone]').type('47383593');
        cy.wait(200);
        cy.get('[data-cy=txtTypeClient]').select('3');
        cy.wait(200);
        cy.get('[data-cy=txtNameEnder]').type('Casa da vó');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceType]').select('Galpão');
        cy.wait(200);
        cy.get('[data-cy=txtStreetType]').select('Avenida');
        cy.wait(200);
        cy.get('[data-cy=txtStreetName]').type('Avenida Faustina');
        cy.wait(200);
        cy.get('[data-cy=txtNumber]').type('4848');
        cy.wait(200);
        cy.get('[data-cy=txtCep]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhood]').type('Jardim das Flores');
        cy.wait(200);
        cy.get('[data-cy=txtCountryHome]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateHome]').select('24');
        cy.wait(200);
        cy.get('[data-cy=txtCity]').type('São miguel Paulista');
        cy.wait(200);
        cy.get('[data-cy=txtObservation]').type('Cadastro sem informações importantes');
        cy.wait(200);
        cy.get('#dados-usuario-botao').click();
        cy.wait(200);
        cy.get('[data-cy=txtEmail]').type('eduborges53@gmail.com');
        cy.wait(200);
        cy.get('[data-cy=txtPassword]').type('1234567');
        cy.wait(200);
        cy.get('[data-cy=txtPasswordConfirmation]').type('123456');
        cy.wait(200);
        cy.get('.col-sm > #operacao').click();
        cy.wait(1000);
        
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioCriacaoLogin')
        cy.viewport(1500, 800)
        cy.wait(200);
        cy.get('[data-cy=txtName]').type('Eduardo');
        cy.wait(200);
        cy.get('[data-cy=txtLastName]').type('Borges');
        cy.wait(200);
        cy.get('[data-cy=txtBirthDate]').type('2021-01-01');
        cy.wait(200);
        cy.get('[data-cy=txtGender]').select('F');
        cy.wait(200);
        cy.get('[data-cy=txtTypeDocument]').select('3');
        cy.wait(200);
        cy.get('[data-cy=txtDocument]').type('48981148813');
        cy.wait(200);
        cy.get('[data-cy=txtValidadeDocument]').type('2021-01-01');
        cy.wait(200);
        cy.get('[data-cy=txtPhoneType]').select('Telefone');
        cy.wait(200);
        cy.get('[data-cy=txtPhone]').type('47383593');
        cy.wait(200);
        cy.get('[data-cy=txtTypeClient]').select('3');
        cy.wait(200);
        cy.get('[data-cy=txtNameEnder]').type('Casa da vó');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceType]').select('Galpão');
        cy.wait(200);
        cy.get('[data-cy=txtStreetType]').select('Avenida');
        cy.wait(200);
        cy.get('[data-cy=txtStreetName]').type('Avenida Faustina');
        cy.wait(200);
        cy.get('[data-cy=txtNumber]').type('4848');
        cy.wait(200);
        cy.get('[data-cy=txtCep]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhood]').type('Jardim das Flores');
        cy.wait(200);
        cy.get('[data-cy=txtCountryHome]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateHome]').select('24');
        cy.wait(200);
        cy.get('[data-cy=txtCity]').type('São miguel Paulista');
        cy.wait(200);
        cy.get('[data-cy=txtObservation]').type('Cadastro sem informações importantes');
        cy.wait(200);
        cy.get('#dados-usuario-botao').click();
        cy.wait(200);
        cy.get('[data-cy=txtEmail]').type('eduborges53@gmail.com');
        cy.wait(200);
        cy.get('[data-cy=txtLogin]').type('eduardo_borges');
        cy.wait(200);
        cy.get('[data-cy=txtPassword]').type('1234567');
        cy.wait(200);
        cy.get('.col-sm > #operacao').click();
        cy.wait(1000);
        
        
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/usuarioCriacaoLogin')
        cy.viewport(1500, 800)
        cy.wait(200);
        cy.get('[data-cy=txtName]').type('Eduardo');
        cy.wait(200);
        cy.get('[data-cy=txtLastName]').type('Borges');
        cy.wait(200);
        cy.get('[data-cy=txtBirthDate]').type('2021-01-01');
        cy.wait(200);
        cy.get('[data-cy=txtGender]').select('F');
        cy.wait(200);
        cy.get('[data-cy=txtTypeDocument]').select('3');
        cy.wait(200);
        cy.get('[data-cy=txtDocument]').type('48981148813');
        cy.wait(200);
        cy.get('[data-cy=txtValidadeDocument]').type('2021-01-01');
        cy.wait(200);
        cy.get('[data-cy=txtPhoneType]').select('Telefone');
        cy.wait(200);
        cy.get('[data-cy=txtPhone]').type('47383593');
        cy.wait(200);
        cy.get('[data-cy=txtTypeClient]').select('3');
        cy.wait(200);
        cy.get('[data-cy=txtNameEnder]').type('Casa da vó');
        cy.wait(200);
        cy.get('[data-cy=txtResidenceType]').select('Galpão');
        cy.wait(200);
        cy.get('[data-cy=txtStreetType]').select('Avenida');
        cy.wait(200);
        cy.get('[data-cy=txtStreetName]').type('Avenida Faustina');
        cy.wait(200);
        cy.get('[data-cy=txtNumber]').type('4848');
        cy.wait(200);
        cy.get('[data-cy=txtCep]').type('08738040');
        cy.wait(200);
        cy.get('[data-cy=txtNeighnorhood]').type('Jardim das Flores');
        cy.wait(200);
        cy.get('[data-cy=txtCountryHome]').select('1');
        cy.wait(200);
        cy.get('[data-cy=txtStateHome]').select('24');
        cy.wait(200);
        cy.get('[data-cy=txtCity]').type('São miguel Paulista');
        cy.wait(200);
        cy.get('[data-cy=txtObservation]').type('Cadastro sem informações importantes');
        cy.wait(200);
        cy.get('#dados-usuario-botao').click();
        cy.wait(200);
        cy.get('[data-cy=txtEmail]').type('eduborges53@gmail.com');
        cy.wait(200);
        cy.get('[data-cy=txtLogin]').type('eduardo_borges');
        cy.wait(200);
        cy.get('[data-cy=txtPassword]').type('1234567');
        cy.wait(200);
        cy.get('[data-cy=txtPasswordConfirmation]').type('123456');
        cy.wait(200);
        cy.get('.col-sm > #operacao').click();
        cy.wait(1000);
        
        






        


        
        



    });

    

});