# README

Este repositório foi criado para propor a solução do seguinte desafio: Desafio Nomes Brasil - Ruby Puro.

## <a name="tech_info"></a>Requisitos
* Linguagem: Ruby (v 3.0.0)

## Setup
1) Possuir o Ruby instalado na sua máquina (versão utilizada neste projeto de preferência)
2) Baixar este repositório com o comando: git clone git@github.com:renanmaringolo/brazil-names.git
3) Executar bundle install em seu terminal para que as dependências do projeto sejam instaladas;

### Testando a aplicação
Atualmente o projeto conta com 95,94% de cobertura de teste, de acordo com o SimpleCov.
* Executar bundle exec rspec em seu terminal para que os testes sejam executados e você veja seu retorno.

## Rodando o projeto localmente
Após fazer o mencionado acima, deve entrar na raiz do projeto e executar o seguinte comando: `./bin/app.rb` - Se solicitado, executar o seguinte comando para permissão do arquivo `chmod +x ./bin/app.rb `

## Gems
* RSpec (um dos métodos possíveis dentro do Ruby/Rails para desenvolver as classes de testes. Gosto muito do padrão do RSpec);
* Simplecov (indica o percentual de cobertura de testes do seu projeto;
* Byebug (ferramenta para debuggin, caso preciso identificar alguma falha no meu teste e analisar como estão chegando dados);
* Rest-Client (é responśavel por facilitar as requisições HTTP);
* Rubocop (responsável por checar se o desenvolvedor está seguindo boas práticas de desenvolvimento em identação, atribuição de variáveis, definição de métodos, entre outros. Possui um arquivo onde o desenvolvedor pode escolher o que será checado pela gem, no meu caso configurei para que não visualizasse em aluns pontos de todo o projeto);
* TerminalTable (responsável por renderizar um template em modo de tabelas no terminal)
