# Contexto

Este projeto é um Framework GUI open-source baseado no SwiftUI da apple para Windows e Linux.
Abaixo temos listado o que precisamos para o MVP (v0.0.1) do Framework. O objetivo é renderizar elementos primitivos.

## App

- [ ] O protocolo `App` foi criado e ele já chama o `main()` corretamente. Este, por sua vez, chama o `runApp<A>(_:)` passando o body do `App`.
- [ ] É preciso carregar informações relevantes do sistema e adicionar os valores no `EnvironmentValues`
- [ ] Precisamos criar o `AppGraph` com base nas informações do `Scene` e `EnvironmentValues`
- [ ] Precisamos criar um bridge do `Scene` com a `Window` do `OpenGLFW`

## Attribute Graph | Virtual DOM | Graph

- [x] A `struct` `AttribeGraph` foi criada armazena `Attribute`
- [x] O `Attribute` é inicializado com valor estático ou clousure para quando precisa ser recomputado
- [ ] `WeakAttribute` precisa ser criado
- [ ] `OptionalAttribute` precisa ser criado
- [ ] O `Subgraph` precisa ser criado
- [ ] O `GraphHost` é a classe base para `AppGraph` e `ViewGraph`. Foi criado, mas precisa ser melhorado
- [ ] O `AppGraph` precisa ser criado. Ele será o responsável por reter as informações da `Scene`, fazer ponte entre o `Scene` e a `Window` do `GLFW`
- [ ] O `ViewGraph` precisa foi parcealmente criado. Ele será responsável por reter as informações da `View` na hierarquia de views.
- [ ] Precisamos criar o protocolo `BodyAcessor` que será responsável por acessar os nós do Grafo e atualizar os dados
- [ ] Precisamos criar a estrutura/classe `ViewBodyAccessor` que irá acessar os as `View` no Grafo para atualizar os dados
- [ ] Precisamos criar a estrutura/classe `SceneBodyAccessor` que irá acessar os as `Scene` no Grafo para atualizar os dados

## View | Scenes

- [x] `ViewBuilder` está funcioonando
- [x] O Protocolo `View` foi criado com `Body` e função estática `_makeView(view:,inputs:)`
- [ ] A implementação default da função  `_makeView(view:,inputs:)` precisa ser atulizada
- [ ] É preciso implementação a função `_makeView(view:,inputs:)` dos componentes existentes
- [ ] É preciso entender como o `_makeView(view:,inputs:)` interage com o grafo, passa informação para os componentes filhos e recebe as preferências dos filhos além de realizar o layout.
- [x] O Protocolo `Scene` foi criado com `Body` e função estática `_makeScene(scene:,inputs:)`
- [ ] A implementação default da função  `_makeScene(scene:,inputs:)` precisa ser atulizada
- [ ] É preciso implementação a função `_makeView(scene:,inputs:)` dos componentes existentes

## ViewGraph

- [ ] O `ViewGraph` está partialmente criado, precisamos entender como ele vai interagir com a `View`

## AppGraph + OpenGLFW + EnvironmentValues

- [ ] O `AppGraph` precisa ser criado
- [ ] Precisamos entender como ele vai interagir com as `Scene` e com a `Window` do `OpenGLFW`
- [ ] O `AppGraph` precisa pegar a informação da Scene, para criar a `Window` do `OpenGLFW` com base no `EnvironmentValues`.
- [ ] Criar a `Window` do `OpenGLFW` usando o `EnvironmentValues`
- [ ] Analisar se os callbacks da `Window` do `OpenGLFW` estarão no `EnvironmentValues` ou no `AppGraph`

## GraphicsContext + Shape + Style
O `GraficsContext` é o objeto principal que será responsavél pelo sistema de renderização. É responsabilidade dele resolver os Textos, Imagens, Estilos, Shaders, etc.

- [ ] Estrutura base do `GraphicsContext` foi criada
- [x] Os `Shape` basicos (`Rectangle`, `Circle`, `Ellipse`) foram criados
- [x] O `Path` é um custom `Shape`, ele possui a representação dos Shapes
- [ ] O protocolo `ShapeStyle` foi criado. Ele é o protocolo usado pelos estilos primários. É a partir deles que usaremos os `Shader`
- [ ] A estrutura básica para interação com o `Shader` foi criada.
- [ ] É necessário implementar as chamadas do `fill` e `stroke`, para resolver o `Shading` e o `Path` e assim desenhar o componente na `tela` usando o `Shader` do `OpenGL`

## DisplayList

- [ ] Precisamos refinar toda a estrutura do DisplayList e seus derivados (Alterar/Remover o que não fizer sentido)
- [ ] Precisamos entender em que momento o DisplayList é criado. Aparentemente é criado dentro da função _makeView(view:, inputs:)

## UpdateGroup
O `UpdateGroup` contem informações sobre a Thread e chamadas sincronas e assincronas.

- [ ] Precisamos verificar o `UpdateGroup` e ajustar o funcionamento. Ele, provavelmente, é o principal elemento responsavel por atualizar o grafo em threads diferentes de forma sincrona ou não

## ViewRendererHost
O protocolo `ViewRendererHost` possui a definição basica que um RendererHost precisa para Renderizar/Rasterizar um componente.

- [ ] O `ImageRenderer` possui o `ImageRendererHost`, ele é responsavel por criar uma imagem a partir da hierarquia de `View` de forma que possamos exporta-lo para uma imagem
- [ ] O `_HostingLayer` é o responsável pela arvore de elementos renderizados usando o `OpenGL`

---

# Perguntas

O projeto usa `OpenGL` para renderizar os elementos, processo diferente do `macOS`/`iOS` que usa `AppKit`/`UIKit`/`CoreGraphics`. 
O processo de renderização é feito diretamente a partir do `AttributeGraph` e `ViewGraph`.

- Precisamos deste nivel de complexidade do `DisplayList`?
- Podemos simplificar o `DisplayList`?
- Como podemos simplificar a hierarquia de `View` já que não usamos `AppKit`/`UIKit`/`CoreGraphics`/`CoreAnimation`?

O GraphicsContext é o principal elemento do `Immediate Drawing` ele possui o `Path` o `ShapeStyle` (Que é o Shader a ser utilizado).
- Como podemos resolver o `Path` e o `ShapeStyle` no `GraphicsContext`, para ele renderizar o elemento usando o `OpenGL`?
- Podemos atribuir cada ShapeStyle há um arquivo de Shader? Como poderiamos usa-lo neste processo? O `ShaderLibrary` serve para carregar os arquivos de `Shader`