# Aula: Estratégias de Deploy

## Introdução
- Apresentação das estratégias de deploy como a etapa final para colocar um microsserviço em produção.
- Destaque para a importância de garantir um processo de deploy sem downtime.

## Processo de Deploy
1. **Preparação para a Entrega**
   - Revisão da entrega pronta para produção.
   - Aguardo de aprovações ou condições de negócios para a implantação.

2. **Opções de Entrega**
   - Uso de tags no Git, imagens diretas ou outros métodos para disponibilizar a entrega.

3. **Pipeline Independente para Microsserviços**
   - Garantia de que cada microsserviço tenha sua própria pipeline independente.

## Estratégias de Release
1. **Rolling Upgrade**
   - Atualização contínua sem downtime.
   - Substituição gradual de instâncias antigas por novas.

2. **Blue-Green Deployment**
   - Utilização de dois ambientes (blue e green).
   - Redirecionamento gradual de tráfego para o novo ambiente.
   - Facilidade de rollback se houver problemas.

3. **Feature Toggles**
   - Ativação ou desativação de funcionalidades para diferentes clientes.
   - Liberação progressiva de uma nova funcionalidade.

4. **Importância da Compatibilidade**
   - Necessidade de garantir que versões antigas e novas sejam compatíveis para estratégias sem downtime.

## Curso Recomendado
- Sugestão de cursos específicos sobre integração contínua, entrega contínua e práticas DevOps na Alura.
- Enfatiza a importância de aprofundar o conhecimento nessas estratégias.

## Revisão e Referências
- Revisão geral dos conceitos apresentados nas aulas anteriores.
- Destaque para a importância de garantir que cada componente esteja pronto para a produção.

## Próxima Aula: Revisão e Referências
- Última aula do treinamento, focada na revisão geral dos conceitos e fornecimento de referências adicionais.
