API de Viagens Interplanetárias Rick and Morty
Esta API foi desenvolvida com base no universo de Rick and Morty e tem como objetivo facilitar o planejamento de viagens interplanetárias, permitindo aos usuários criar itinerários com base em diferentes planetas e universos da série. É possível selecionar paradas desejadas e encontrar a melhor rota para completar o trajeto.

Instruções de Uso
Clone este repositório para a sua máquina local.
Instale as dependências utilizando o Yarn ou NPM:
Copy code
yarn install
ou
Copy code
npm install
Execute o comando abaixo para iniciar a aplicação utilizando Docker Compose:
Copy code
docker-compose up


Endpoints
POST: /travel_plans
Cria um novo plano de viagem.

Corpo da Requisição:

json
Copy code
{
  "travel": {
    "travel_stops": [50, 80, 100]
  }
}
Resposta (200):

json
Copy code
{
  "id": 1,
  "travel_stops": [1, 7]
}
GET: /travel_plans
Recupera todos os planos de viagem.

Corpo da Requisição:
Nenhum

Resposta (200):

json
Copy code
[
  {
    "id": 1,
    "travel_stops": [1, 7]
  }
]
Resposta com consulta "expand" (200):

json
Copy code
{
  "id": 1,
  "travel_stops": [
    {
      "id": 1,
      "name": "Terra (C-137)",
      "type": "Planeta",
      "dimension": "Dimensão C-137"
    },
    {
      "id": 7,
      "name": "Resort Campo da Imortalidade",
      "type": "Resort",
      "dimension": "desconhecida"
    }
  ]
}
Resposta com consulta "optimize" (200):

json
Copy code
[
  {
    "id": 1,
    "travel_stops": [1, 7]
  }
]
GET: /travel_plans/:id
Recupera um plano de viagem específico.

Corpo da Requisição:
Nenhum

Resposta (200):

json
Copy code
{
  "id": 1,
  "travel_stops": [1, 7]
}
Resposta com consulta "expand" (200):

json
Copy code
{
  "id": 1,
  "travel_stops": [
    {
      "id": 1,
      "name": "Terra (C-137)",
      "type": "Planeta",
      "dimension": "Dimensão C-137"
    },
    {
      "id": 7,
      "name": "Resort Campo da Imortalidade",
      "type": "Resort",
      "dimension": "desconhecida"
    }
  ]
}
Resposta com consulta "optimize" (200):

json
Copy code
[
  {
    "id": 1,
    "travel_stops": [1, 7]
  }
]
PUT: /travel_plans/:id
Atualiza um plano de viagem existente.

Corpo da Requisição:

json
Copy code
{
  "travel": {
    "travel_stops": [11, 19]
  }
}
Resposta (200):

json
Copy code
{
  "id": 1,
  "travel_stops": [11, 19]
}
DELETE: /travel_plans/:id
Exclui um plano de viagem.

Corpo da Requisição:
Nenhum

Resposta (204):
Sem conteúdo
