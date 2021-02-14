# README

Este repositório foi criado para propor a solução do seguinte desafio: Desafio Nomes Brasil - Ruby Puro.

## <a name="tech_info"></a>Requisitos
* Linguagem: Ruby (v 3.0.0)

## Setup
1) Possuir o Ruby instalado na sua máquina (versão utilizada neste projeto, de preferência), assim como as outras dependências citadas em Informações técnicas;
2) Baixar este repositório com o comando: git clone git@github.com:renanmaringolo/brazil-names.git
3) Executar bundle install em seu terminal para que as dependências do projeto sejam instaladas;

### Testando a aplicação
Atualmente o projeto conta com 100,00% de cobertura de teste, de acordo com o SimpleCov.
* Executar bundle exec rspec em seu terminal para que os testes sejam executados e você veja seu retorno.

## Gems
* RSpec (um dos métodos possíveis dentro do Ruby/Rails para desenvolver as classes de testes. Gosto muito do padrão do RSpec);
* Simplecov (indica o percentual de cobertura de testes do seu projeto;
* Byebug (ferramenta para debuggin, caso preciso identificar alguma falha no meu teste e analisar como estão chegando dados);
* Rest-Client (é responśavel por facilitar as requisições HTTP - obs: tirei as chamadas via API para facilitar o código, mas logo voltarei a utilizar chamadas normalmente).


####
Observações: 
* 1 ) A gem Rest-Client não está sendo usada atualmente, pois no início da aplicação eu estava utilizando-a para fazer mock dos dados;
* 1.1 )  Cada request na API, estou mockando dados manualmente em 'spec/fixtures..' e chamando esse arquivo através de uma Classe responsável por conectar com a API (no caso atual um arquivo).
####
