## API de Municípios
---

### Link para collection Postman
[share_collection_link](https://api.postman.com/collections/2741060-0f3d6701-51fd-4035-95cd-6f86982a359d?access_key=PMAT-01HPFE3CK4H6GD7P78S8GC6W9R).

---

### Esta é a API de Municípios, que permite gerenciar informações sobre munícipes.
## Recursos Disponíveis

---

## Retorna informações sobre um munícipe específico.
### Endpoint: GET /api/v1/municipes/:id
*Parâmetros de Requisição: id (obrigatório, Integer)*
*Resposta: Retorna informações detalhadas sobre o munícipe com o ID especificado.*

---

## Listar Municípe*
### Endpoint: GET /api/v1/municipes
*Parâmetros de Requisição: q (opcional, Hash)*
*Resposta: Retorna uma lista de todos os munícipes cadastrados.*

---

## Cria um novo munícipe.
### Endpoint: POST /api/v1/municipes
*Parâmetros de Requisição: Body JSON com os dados do munícipe.*
*Resposta: Retorna os detalhes do munícipe recém-criado.*

---

## Editar um Munícipe
### Endpoint: PUT /api/v1/municipes/:id
*Parâmetros de Requisição: id (obrigatório, Integer) e Body JSON com os dados atualizados do munícipe.*
*Resposta: Retorna os detalhes do munícipe após a edição.*

---

## Atualizar o Status de um Munícipe
### Endpoint: PATCH /api/v1/municipes/:id/update_status
*Parâmetros de Requisição: id (obrigatório, Integer) e status (obrigatório, Boolean) no Body JSON.*
*Resposta: Retorna os detalhes do munícipe após a atualização do status.*

---

## Obter um Endereço de Munícipe
### Endpoint: GET /api/v1/municipe_addresses/:id
*Parâmetros de Requisição: id (obrigatório, Integer)*
*Resposta: Retorna informações detalhadas sobre o endereço de munícipe com o IDespecificado.*

---

## Criar um Endereço de Munícipe
### Endpoint: POST /api/v1/municipe_addresses/:id
*Parâmetros de Requisição: id (obrigatório, Integer) e Body JSON com os dados do endereço de munícipe.*
*Resposta: Retorna os detalhes do endereço de munícipe recém-criado.*

---

## Editar um Endereço de Munícipe
### Endpoint: PUT /api/v1/municipe_addresses/:id
*Parâmetros de Requisição: id (obrigatório, Integer) e Body JSON com os dados atualizados do endereço de munícipe.*
*Resposta: Retorna os detalhes do endereço de munícipe após a edição.*
