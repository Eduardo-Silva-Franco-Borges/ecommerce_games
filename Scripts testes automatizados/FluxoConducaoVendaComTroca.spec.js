///<reference types="cypress" />

describe('fluxoVenda',()=>{
    
    it('fluxoVenda',()=>{
        
        const pedido = '#129';
        
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/home')
        cy.viewport(1800, 900)

        cy.wait(1500);
        cy.get('.login-button').click();

        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Cliente');
        cy.wait(1500);
        cy.get('#password').type('Cliente@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();




        cy.wait(1500);
        cy.get(':nth-child(1) > .inner-product > form > [required=""]').type('5');
        cy.wait(1500);
        cy.get(':nth-child(1) > .inner-product > form > .button').click();
        cy.wait(1500);
        cy.get(':nth-child(2) > .inner-product > form > [required=""]').type('3');
        cy.wait(1500);
        cy.get(':nth-child(2) > .inner-product > form > .button').click();
        cy.wait(1500);
        cy.get(':nth-child(7) > .inner-product > form > [required=""]').type('3');
        cy.wait(1500);
        cy.get(':nth-child(7) > .inner-product > form > .button').click();
        cy.wait(1500);
        cy.get('#valorCarrinho').click();
        cy.wait(1500);
        cy.get('[data-cy=qtd1]').clear()
        cy.get('[data-cy=qtd1]').type('7');
        cy.wait(1500);
        cy.get('[data-cy=qtd1]').type('{enter}');
        cy.wait(1500);
        cy.get('.swal2-confirm').click();
        cy.wait(1500);
        cy.get('[data-cy=qtd2]').clear()
        cy.get('[data-cy=qtd2]').type('9');
        cy.wait(1500);
        cy.get('[data-cy=qtd2]').type('{enter}');
        cy.wait(1500);
        cy.get('.swal2-confirm').click();
        cy.wait(1500);
        cy.get(':nth-child(3) > .action > a > .fa').click();
        cy.wait(1500);
        cy.get('.swal2-confirm').click();
        cy.wait(1500);
        cy.get(':nth-child(6) > .button').click();

        //tentativa de finalizacao de pedido
        cy.wait(1500);
        cy.get('[data-cy=btnFinalizarPedido]').click();
        cy.wait(1500);
        cy.get('.swal2-confirm').click();
        cy.wait(1500);


        

        //setagem do endereco de entrega
        cy.get('#tableDeliveryAddresses > tbody > :nth-child(1) > :nth-child(1) > input').click();
        cy.wait(1500);
        cy.get('.swal2-confirm').click();
        cy.wait(1500);
        cy.get('[data-cy=btnFinalizarPedido]').click();
        cy.wait(1500);
        cy.get('.swal2-confirm').click();
        
        


        // setando primeira forma de pagamento
        cy.wait(1500);
        cy.get(':nth-child(16) > tbody > :nth-child(1) > :nth-child(1) > input').click();
        cy.wait(1500);
        cy.get('#valorEscolhidoPrestacao').type('2000');
        cy.wait(1500);
        cy.get('#quantidadePrestacao').select('2');
        cy.wait(1500);
        cy.get('.col-md-6 > .btn').click();
        cy.wait(1500);
        cy.get('.swal2-confirm').click();


        //tentativa de finalizacao de pedido
        cy.wait(1500);
        cy.get('[data-cy=btnFinalizarPedido]').click();
        cy.wait(1500);
        cy.get('.swal2-confirm').click();
        cy.wait(1500);
        
        // setando segunda forma de pagamento
        cy.wait(1500);
        cy.get(':nth-child(16) > tbody > :nth-child(2) > :nth-child(1) > input').click();
        cy.wait(1500);
        cy.get('#valorEscolhidoPrestacao').type('100');
        cy.wait(1500);
        cy.get('#quantidadePrestacao').select('3');
        cy.wait(1500);
        cy.get('.col-md-6 > .btn').click();
        cy.wait(1500);
        cy.get('.swal2-confirm').click();


        //tentativa de finalizacao
        cy.wait(1500);
        cy.get('[data-cy=btnFinalizarPedido]').click();
        cy.wait(2000);
        cy.get('.swal2-confirm').click();



        //setando cupom de 50 reais
        cy.wait(1500);
        cy.get(':nth-child(1) > :nth-child(3) > .btn').click();
        cy.wait(1500);
        cy.get('.swal2-confirm').click();

        
        //finalizacao total do pedido
        cy.wait(1500);
        cy.get('[data-cy=btnFinalizarPedido]').click();
        cy.wait(2000);
        cy.get('.swal2-confirm').click();

        
        /*******************************************************************************/ 
        //logando como adm
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Adm');
        cy.wait(1500);
        cy.get('#password').type('Adm@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();

        
        
        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();


        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);


        //acesando visualizar pedido
        cy.wait(1500);
        cy.get('.col-md-2 > .btn').click();
        
        //mudando para status pagamento realizado
        cy.wait(1500);
        cy.get('#valorStatusPedido').select('2');
        cy.wait(2000);
        cy.get('.swal2-confirm').click();
        // /*******************************************************************************/ 





        // /*******************************************************************************/ 
        //logando como cliente
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Cliente');
        cy.wait(1500);
        cy.get('#password').type('Cliente@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();


        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();

        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);
        /*******************************************************************************/ 




        /*******************************************************************************/ 
        //logando como adm
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Adm');
        cy.wait(1500);
        cy.get('#password').type('Adm@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();

        
        
        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();


        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);


        //acesando visualizar pedido
        cy.wait(1500);
        cy.get('.col-md-2 > .btn').click();
        
        //mudando para status enviado para transportadora
        cy.wait(1500);
        cy.get('#valorStatusPedido').select('3');
        cy.wait(2000);
        cy.get('.swal2-confirm').click();
        /*******************************************************************************/ 



        /*******************************************************************************/ 
        //logando como cliente
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Cliente');
        cy.wait(1500);
        cy.get('#password').type('Cliente@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();


        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();

        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);
        /*******************************************************************************/
        
        



        /*******************************************************************************/ 
        //logando como adm
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Adm');
        cy.wait(1500);
        cy.get('#password').type('Adm@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();

        
        
        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();

        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);


        //acesando visualizar pedido
        cy.wait(1500);
        cy.get('.col-md-2 > .btn').click();
        
        //mudando para status em transporte
        cy.wait(1500);
        cy.get('#valorStatusPedido').select('4');
        cy.wait(2000);
        cy.get('.swal2-confirm').click();
        /*******************************************************************************/ 



        /*******************************************************************************/ 
        //logando como cliente
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Cliente');
        cy.wait(1500);
        cy.get('#password').type('Cliente@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();


        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();


        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);
        /*******************************************************************************/


        /*******************************************************************************/ 
        //logando como adm
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Adm');
        cy.wait(1500);
        cy.get('#password').type('Adm@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();

        
        
        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();


        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);

        //acesando visualizar pedido
        cy.wait(1500);
        cy.get('.col-md-2 > .btn').click();
        
        //mudando para status entregue
        cy.wait(1500);
        cy.get('#valorStatusPedido').select('5');
        cy.wait(2000);
        cy.get('.swal2-confirm').click();
        /*******************************************************************************/ 



        /*******************************************************************************/ 
        //logando como cliente
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Cliente');
        cy.wait(1500);
        cy.get('#password').type('Cliente@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();


        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();

        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);
        /*******************************************************************************/




        // solicitando uma troca
        cy.wait(1500);
        cy.get('form > .btn').click();


        // clicando no primeiro item da troca
        cy.wait(1500);
        cy.get(':nth-child(1) > :nth-child(1) > #flexCheckDefault').click();
        
        cy.wait(1500);
        cy.get('#qtdParaTrocaProduto').type('2');
        cy.get('.col-md-3 > .btn').click();
        

        cy.wait(2000);
        cy.get('.swal2-confirm').click();



        // clicando no primeiro item da troca
        cy.wait(1500);
        cy.get('#btnTroca').click();
        cy.wait(2000);
        cy.get('.swal2-confirm').click();
        cy.wait(2000);
        cy.get('.swal2-confirm').click();




        /*******************************************************************************/ 
        //logando como adm
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Adm');
        cy.wait(1500);
        cy.get('#password').type('Adm@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();

        
        
        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();

        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);


        //acesando visualizar pedido
        cy.wait(1500);
        cy.get('.col-md-2 > .btn').click();
        
        //mudando para troca aceita
        cy.wait(1500);
        cy.get('#valorStatusPedido').select('8');
        cy.wait(2000);
        cy.get('.swal2-confirm').click();
        /*******************************************************************************/


        /*******************************************************************************/ 
        //logando como cliente
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Cliente');
        cy.wait(1500);
        cy.get('#password').type('Cliente@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();


        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();

        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);
        /*******************************************************************************/


        /*******************************************************************************/ 
        //logando como adm
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Adm');
        cy.wait(1500);
        cy.get('#password').type('Adm@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();

        
        
        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();


        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);

        //acesando visualizar pedido
        cy.wait(1500);
        cy.get('.col-md-2 > .btn').click();
        
        //mudando para produto enviado para troca cancelamento
        cy.wait(1500);
        cy.get('#valorStatusPedido').select('9');
        cy.wait(2000);
        cy.get('.swal2-confirm').click();
        /*******************************************************************************/



        /*******************************************************************************/ 
        //logando como cliente
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Cliente');
        cy.wait(1500);
        cy.get('#password').type('Cliente@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();


        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();

        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);
        /*******************************************************************************/



        /*******************************************************************************/ 
        //logando como adm
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Adm');
        cy.wait(1500);
        cy.get('#password').type('Adm@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();

        
        
        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();



        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);


        //acesando visualizar pedido
        cy.wait(1500);
        cy.get('.col-md-2 > .btn').click();
        
        //mudando para produto recebido para troca cancelamento
        cy.wait(1500);
        cy.get('#valorStatusPedido').select('10');
        cy.wait(2000);
        cy.get('.swal2-confirm').click();
        /*******************************************************************************/


        /*******************************************************************************/ 
        //logando como cliente
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Cliente');
        cy.wait(1500);
        cy.get('#password').type('Cliente@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();


        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();

        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);


        cy.wait(1500);
        cy.get(':nth-child(5) > .row > :nth-child(1) > .btn').click();
        cy.wait(1500);
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/pedidos');


        //acessando a tela de cupons
        cy.wait(1500);
        cy.get('[href="cupom"]').click();
        cy.wait(2500);
        cy.visit('http://localhost:8080/ecommerce-video-game-projeto-less/home');
        /*******************************************************************************/



        /*******************************************************************************/ 
        //logando como adm
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Adm');
        cy.wait(1500);
        cy.get('#password').type('Adm@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();

        
        
        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();


        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);

        //acesando visualizar pedido
        cy.wait(1500);
        cy.get('.col-md-2 > .btn').click();
        
        //mudando para troca cancelamento realizado
        cy.wait(1500);
        cy.get('#valorStatusPedido').select('11');
        cy.wait(2000);
        cy.get('.swal2-confirm').click();
        /*******************************************************************************/


        /*******************************************************************************/ 
        //logando como cliente
        cy.wait(1500);
        cy.get('.login-button').click();
        
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #username').type('Cliente');
        cy.wait(1500);
        cy.get('#password').type('Cliente@12345');
        cy.wait(1500);
        cy.get(':nth-child(1) > form > #operacao').click();


        //acessando a tela de pedidos adm
        cy.wait(1500);
        cy.get('[href="pedidos"]').click();

        //filtrando o pedido corrente
        cy.wait(1500);
        cy.get('#example_filter > label > .form-control').type(pedido);
        /*******************************************************************************/









    });

    

});