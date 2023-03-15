///<reference types="cypress" />

describe('fluxoVenda',()=>{
    
    it('fluxoVenda',()=>{
        
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/home')
        cy.viewport(1800, 900)

        cy.wait(1500);
        cy.get('.login-button').click();

        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Adm');
        cy.wait(1500);
        cy.get('#password').type('Adm@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();


        //acessando a tela de analise pedidos adm
        cy.wait(1500);
        cy.get('[href="AnalisePedidos"]').click();


        //setando data pesquisa inicio
        cy.wait(1500);
        cy.get('#txtDtInicio').type('2020-10-01');


        //setando data pesquisa fim
        cy.wait(1500);
        cy.get('#txtDtFim').type('2020-10-30');


        //clicando em pesquisar
        cy.wait(1500);
        cy.get('.col-md-4 > #operacao').click();

        cy.scrollTo(0, 500);






        //setando data pesquisa inicio
        cy.wait(1500);
        cy.get('#txtDtInicio').type('2020-10-01');


        //setando data pesquisa fim
        cy.wait(1500);
        cy.get('#txtDtFim').type('2021-03-30');


        //clicando em pesquisar
        cy.wait(1500);
        cy.get('.col-md-4 > #operacao').click();

        cy.scrollTo(0, 500);






        //setando data pesquisa inicio
        cy.wait(1500);
        cy.get('#txtDtInicio').type('2021-10-01');


        //setando data pesquisa fim
        cy.wait(1500);
        cy.get('#txtDtFim').type('2021-10-30');


        //clicando em pesquisar
        cy.wait(1500);
        cy.get('.col-md-4 > #operacao').click();

        cy.scrollTo(0, 500);







        //setando data pesquisa inicio
        cy.wait(1500);
        cy.get('#txtDtInicio').type('2021-09-01');


        //setando data pesquisa fim
        cy.wait(1500);
        cy.get('#txtDtFim').type('2021-12-30');


        //clicando em pesquisar
        cy.wait(1500);
        cy.get('.col-md-4 > #operacao').click();

        cy.scrollTo(0, 500);






    });

    

});