# __SOLID__

## __O que é?__

### SOLID é um acrônimo que representa cinco princípios de design orientado a objetos que foram descritos por Robert C. Martin, também conhecido como Uncle Bob, em 2000.

___

## __SOLID significa:__ 

* __S__ - Single-responsibility Principle (Princípio da responsabilidade única)

* __O__ - Open-closed Principle (Princípio do aberto-fechado)

* __L__ - Liskov Substitution Principle (Princípio da substituição de Liskov)

* __I__ - Interface Segregation Principle (Princípio da segregação de interfaces)

* __D__ - Dependency Inversion Principle (Princípio da inversão de dependência)

___

__Single-responsibility Principle__: uma classe deve ter apenas uma responsabilidade única. Isso significa que uma classe deve ter apenas um motivo para ser modificada e deve ser coesa em relação às suas responsabilidades.

__Open-closed Principle__: entidades de software (classes, módulos, funções etc.) devem estar abertas para extensão, mas fechadas para modificação.

__Liskov Substitution Principle__: entidades de software (classes, módulos, funções etc.) devem estar abertas para extensão, mas fechadas para modificação.

__Interface Segregation Principle__: uma classe derivada deve ser substituível por sua classe base sem afetar a corretude do programa. Em outras palavras, uma classe derivada não deve alterar o comportamento da classe base.

__Dependency Inversion Principle__: classes de alto nível devem depender de interfaces abstratas em vez de depender de classes concretas de baixo nível.

___

A aplicação desses princípios pode ajudar a tornar o software mais fácil de entender, manter, testar e evoluir ao longo do tempo.

___

## __Utilização do SOLID__

__S do Solid:__ cada classe: Agendamento, Cliente.... tem uma única responsabilidade.

__O do Solid:__ As classes Cliente, Veiculo, Pagamento, Servico... estão fechadas para modificação, mas abertas para extensão.
Isso significa que, se novos comportamentos ou propriedades precisarem ser adicionados, eles podem ser adicionados por meio de herança ou composição, sem alterar o código existente.

__L do Solid:__ as subclasses (se houver) podem ser substituídas pelas classes base, sem afetar o comportamento do programa.
As classes derivadas estão sendo usadas para os testes, fornecendo outros valores para testar o erro.

__I do Solid:__ as classes têm apenas os métodos que precisam ser implementados, sem métodos desnecessários, cada classe com sua interface devidamente.

__D do Solid:__ as classes dependem de abstrações e não de implementações concretas. Cada classe é abstrata, porém se relacionam uma com as outras.


