# Relatório de Desobfuscação do Script Luraph

## Resumo Executivo

O arquivo `scripts.txt` no repositório lesada contém um script Lua protegido pelo **Luraph Obfuscator v14.6**, um ofuscador comercial de alto nível.

## O Que Foi Feito

Criei um conjunto completo de ferramentas e documentação para tentar desobfuscar o script:

### 🛠️ Ferramentas Criadas

1. **deobfuscator.lua** - Ferramenta básica de desobfuscação por hooks
2. **advanced_deobfuscator.lua** - Ferramenta avançada com manipulação de ambiente
3. **analyze_luraph.lua** - Ferramenta de análise estrutural do Luraph

### 📚 Documentação

1. **DEOBFUSCATION_GUIDE.md** - Guia completo sobre Luraph e métodos de desobfuscação (em inglês)
2. **README_DEOBFUSCATION.md** - Visão geral do projeto e instruções de uso
3. **analysis_report.txt** - Relatório técnico da análise
4. **deobfuscated.lua** - Arquivo template com notas sobre a ofuscação

## 📊 Resultados da Análise

### Informações Técnicas
- **Ofuscador**: Luraph v14.6 (https://lura.ph/)
- **Tamanho**: 78.736 bytes
- **Nível de Proteção**: Muito Alto (Commercial-grade)
- **Tipo**: Execução baseada em VM (Máquina Virtual)

### Métricas de Complexidade
- Funções: 17
- Variáveis locais: 48
- Loops: 14
- Condicionais: 28
- Arrays de índice zero (estruturas VM)

## ⚠️ Status da Desobfuscação

### ❌ Desobfuscação Automática Completa: NÃO FOI POSSÍVEL

**Por quê?**

O Luraph v14.6 usa técnicas avançadas que impedem a desobfuscação automática:

1. **Máquina Virtual Customizada**: O código não é executado diretamente, mas em uma VM própria
2. **Compressão de Strings**: Todas as strings são comprimidas com algoritmo proprietário
3. **Bytecode Encriptado**: O código é convertido em bytecode customizado e encriptado
4. **Anti-Debug**: Possui mecanismos para detectar e prevenir debugging
5. **Ofuscação de Fluxo**: O fluxo de execução é extremamente ofuscado

### ✅ O Que Foi Conseguido

1. **Análise Estrutural Completa**: Identificação de padrões e técnicas de ofuscação
2. **Ferramentas de Análise**: 3 diferentes abordagens implementadas
3. **Documentação Detalhada**: Guias completos sobre o processo
4. **Relatório Técnico**: Análise profunda da estrutura do script

## 🔍 Alternativas Disponíveis

Como a desobfuscação automática não é viável, existem estas alternativas:

### 1. Análise Dinâmica ⭐ RECOMENDADO
Execute o script em um ambiente controlado e monitore seu comportamento:
- Operações de arquivo
- Requisições de rede
- Chamadas de função
- Modificações de memória

### 2. Contatar o Autor Original
Se você tem acesso legítimo ao script:
- Entre em contato com o desenvolvedor original
- Verifique sistemas de controle de versão (Git)
- Procure por backups do código-fonte

### 3. Engenharia Reversa Manual
Requer conhecimento avançado:
- Estudo do conjunto de instruções da VM
- Mapeamento de opcodes da VM para operações Lua
- Reconstrução do fluxo de controle original
- Descompactação manual das strings

### 4. Serviços Profissionais
Considere contratar:
- Serviços de engenharia reversa profissional
- Especialistas em desobfuscação de Lua
- Empresas de segurança cibernética

### 5. Reescrita do Zero
Se você entende a funcionalidade do script:
- Análise comportamental para entender o que ele faz
- Reescrita limpa do código baseada no comportamento observado

## 🚀 Como Usar as Ferramentas

### Executar Análise Estrutural
```bash
cd /home/runner/work/lesada/lesada
lua5.3 analyze_luraph.lua
```

### Tentar Desobfuscação
```bash
lua5.3 advanced_deobfuscator.lua
```

### Ler Documentação Completa
```bash
cat DEOBFUSCATION_GUIDE.md
cat analysis_report.txt
```

## 📖 Arquivos no Repositório

- `scripts.txt` - Script original ofuscado com Luraph v14.6
- `deobfuscator.lua` - Ferramenta básica de desobfuscação
- `advanced_deobfuscator.lua` - Ferramenta avançada
- `analyze_luraph.lua` - Analisador de estrutura
- `DEOBFUSCATION_GUIDE.md` - Guia completo (inglês)
- `README_DEOBFUSCATION.md` - README do projeto
- `analysis_report.txt` - Relatório técnico
- `deobfuscated.lua` - Template com notas
- `LEIAME_PT.md` - Este arquivo (português)

## ⚖️ Considerações Legais

⚠️ **IMPORTANTE**: A desobfuscação deve ser realizada apenas em:
- Código que você possui
- Código com permissão explícita do autor
- Pesquisa de segurança legítima

O Luraph é projetado para proteger propriedade intelectual. Desrespeitar isso pode violar:
- Direitos autorais
- Acordos de licença
- Leis de proteção de software

## 🎯 Conclusão

### O Que Aprendemos

1. **Luraph v14.6 é Extremamente Eficaz**: Resiste a tentativas de desobfuscação automática
2. **VM-Based Protection é Poderosa**: A execução em VM customizada impede análise estática
3. **Análise Comportamental é Mais Prática**: Para entender o que o script faz, focar no comportamento em runtime

### Próximos Passos Recomendados

1. **Se você precisa do código original**:
   - Entre em contato com o autor
   - Verifique backups e controle de versão
   
2. **Se você precisa entender o comportamento**:
   - Use análise dinâmica
   - Monitore a execução em ambiente controlado
   
3. **Se você precisa desobfuscar completamente**:
   - Considere serviços profissionais
   - Estude engenharia reversa de VM
   - Pode levar semanas ou meses de trabalho

### Status Final

✅ **Análise e Ferramentas**: Completo
❌ **Desobfuscação Automática**: Não viável
📝 **Documentação**: Completa
🔍 **Alternativas**: Fornecidas

---

## 📞 Suporte

Para dúvidas sobre as ferramentas criadas, consulte:
- `DEOBFUSCATION_GUIDE.md` - Guia técnico completo
- `analysis_report.txt` - Relatório de análise
- GitHub Issues - Para reportar problemas

## 🔗 Recursos Adicionais

- **Site Oficial do Luraph**: https://lura.ph/
- **Manual do Lua**: https://www.lua.org/manual/5.3/
- **Biblioteca Debug do Lua**: https://www.lua.org/manual/5.3/manual.html#6.10

---

*Criado em: 04 de Fevereiro de 2026*
*Status do Projeto: Análise Completa, Desobfuscação Completa Não Viável*
*Ferramentas: Disponíveis e Funcionais*
