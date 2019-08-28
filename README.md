# Antares
### Implementação iOS do The Movie Database API

Versão mínima: iOS 12</br>
Linguagem: Swift</br>

### Sobre:

O projeto foi desenvolvido com a arquitetura **Clean Swift**, camada nativa de networking e as seguintes bibliotecas externas:</br>
- **PromiseKit**: Biblioteca para deixar mais transparente o uso de funções assíncronas.
- **SDWebImage**: Biblioteca para cache de imagens online.
- **R.swift**: Biblioteca para mapeamento de imagens, nibs, strings, etc...
- **Cuckoo**: Biblioteca para gerar mocks das classes que serão testadas.
- **Nimble**: Biblioteca para melhorar a verbosidade das assertivas do teste.

### Funcionalidades
- [x] Listagem de filmes
- [ ] Filtros para listagem
- [x] Detalhes do filme
- [ ] Animação personalizada para transição
- [x] 100% de cobertura de testes unitários para Presenter e Interactor.
- [ ] Testes de UI

### Setup

Para executar o projeto, execute os comandos abaixo no terminal:
```sh
$ cd <diretorio-base>/Antares/
$ pod install
```

### Ambiente de desenvolvimento
- Xcode 10.3
- Swift 5.0.1
- macOS 10.14.6
- iOS 12.3.1
- CocoaPods 1.6.1

### Prévia do app
![](https://media.giphy.com/media/TIY6x4TgAHxB3mTBHY/giphy.gif)