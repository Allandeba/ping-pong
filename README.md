# Ping Pong Multiplayer

Um jogo de Ping Pong multiplayer em tempo real, desenvolvido com foco em aprendizado, boas práticas de arquitetura de jogos e colaboração aberta.  
O projeto utiliza **Phaser3** para o front-end (cliente do jogo) e **Node.js + Socket.IO** no back-end para comunicação em tempo real entre os jogadores.

Este repositório foi criado para interações com outros colegas de equipe em momentos de descontração. Com intuito de que outras pessoas possam contribuir para melhorar o jogo, adicionar novas funcionalidades, corrigir bugs ou criar modos de jogo.

---

## 🧩 Descrição do Projeto

O **Ping Pong Multiplayer** é um jogo de Pong para dois jogadores que se conectam via navegador.

Principais características:

- Partidas 1x1 em tempo real via WebSocket (Socket.IO).
- Sincronização de estado do jogo no servidor (servidor authoritative).
- Suporte a reconexão do jogador (quando possível).
- Publicação com Docker.

---

## 🤝 Contribuição

Contribuições são muito bem-vindas!

Você pode ajudar com:

- Novas funcionalidades (ex.: power-ups, novos modos de jogo).
- Correção de bugs.
- Melhoria de desempenho.
- Refatoração de código.
- Documentação e testes automatizados.

### Como contribuir

1. **Faça um fork** do repositório.
2. **Crie uma branch** para sua feature ou correção de bug:
    ```bash
    git checkout -b feature/minha-feature # ou git checkout -b fix/meu-bugfix
    ```
3. **Implemente as suas alterações**, mantendo o código limpo e coeso.
4. **Adicione ou atualize testes**, se aplicável.
5. **Execute os testes localmente**
6. **Faça o commit** com uma mensagem clara:
    ```bash
    git commit -m "feat: adiciona modo hardcore"
    git commit -m "fix: corrige reconexão do player 2"
    git commit -m "style: melhoria de estilos do menu"
    git commit -m "perf: otimização da resposta entre servidor e cliente"
    ```
7. **Envie sua branch para o seu fork**:
    ```bash
    git push origin feature/minha-feature
    ```
8. **Abra um Pull Request (PR)** apontando para este repositório.

### Boas práticas para Pull Requests

- Descreva claramente **o que foi feito** e **por quê**.
- Se possível, adicione **prints**, **gifs** ou descrição de **cenários de teste**.
- Tente manter o PR focado em **uma única mudança** ou em mudanças fortemente relacionadas.
- Evite incluir mudanças irrelevantes (ex.: formatação em arquivos que não fazem parte da sua alteração).

---

## 🚀 Publicação

Um único contêiner serve o site, a API e o Socket.IO.

* Confira o health check da imagem (`GET /api/config` na porta interna). No domínio público, valide o HTTPS, o carregamento do jogo e uma partida 1×1 com dois navegadores via Socket.IO.
* Use apenas uma réplica: as salas ficam em **memória** e reiniciar ou publicar uma nova versão **encerra as partidas em andamento**. A aplicação não precisa de banco de dados nem de volume.

---

## 🛠️ Instalação (Ambiente de Desenvolvimento)

Abaixo um fluxo típico para rodar o projeto localmente.

### Pré-requisitos

- **Node.js 24 LTS** e **npm**
- (Opcional) **Docker**, para rodar via contêiner.

### Clonar o repositório
```bash
git clone https://github.com/Allandeba/ping-pong
cd ping-pong
```

### Instalar dependências
```bash
npm ci
```

### Rodar servidor em modo desenvolvimento
```bash
npm start
```

Por padrão, o servidor deverá estar disponível em:

- `http://localhost:3000`

Abra o navegador nesse endereço para testar o jogo localmente.

### Rodar com Docker (opcional)

```bash
# Build da imagem
docker build -t pingpong-multiplayer .

# Rodar o container
docker run --rm --name pingpong-multiplayer -p 127.0.0.1:3000:3000 pingpong-multiplayer

# Acesse http://localhost:3000
```

---

## 🎮 Uso

### Jogar localmente (desenvolvimento)

1. Inicie o servidor local (`npm start`).
2. Abra o navegador em `http://localhost:3000`.
3. Fluxo típico:
   - **Player 1** acessa a página e cria uma sala.
   - **Player 1** compartilha o link para o Player 2
   - **Player 2** acessa via link ou digita o **código da sala** exemplo: `http://localhost:3000/?room=ABC123`
4. Quando os dois jogadores estiverem conectados, o jogo inicia automaticamente.

### Jogar em uma instância publicada

Abra o domínio configurado na aplicação. Crie uma sala e compartilhe o link ou o código com o outro jogador.

---

## 📦 Estrutura (resumo)

- `server/server.js` – ponto de entrada do servidor Node.js / Socket.IO.
- `client/public/` e `client/src/` – arquivos do cliente servidos pelo Node.js.
- `multiplayerScene.js` – lógica da cena multiplayer no Phaser.
- `singlePlayerScene.js` – lógica da cena single player no Phaser.
- `menuScene.js` – tela inicial / menu do jogo.
- `gameConfig.js` – configuração do jogo (velocidade da bola, tamanho da tela, etc.).
- `Dockerfile` – definição da imagem construída.

---

## 📄 Licença

Este projeto é distribuído sob a licença **MIT**.

Isso significa que você pode:

- Usar o código de forma pessoal ou comercial.
- Modificar, distribuir e criar projetos derivados.

Desde que mantenha o aviso de copyright e o texto da licença.

O texto completo da licença MIT deve estar disponível no arquivo:

- [`LICENSE`](./LICENSE)

---

Se tiver dúvidas, sugestões de melhorias ou quiser discutir novas ideias de features, sinta-se à vontade para abrir uma **Issue** ou iniciar uma discussão no repositório.

Boas contribuições e bom jogo! 🏓
