# Lactalis na Operação · Lactalis × 75 LAB

Apresentação HTML da proposta 75 LAB para a entrada da **Lactalis Brasil em Food Service** (piloto Bidfood São Paulo, outubro de 2026).

- **Proposta comercial (12 telas):** https://agencia75lab.github.io/lactalis-na-operacao/
- **Plano completo (42 telas):** https://agencia75lab.github.io/lactalis-na-operacao/completa/

## Estrutura

```
index.html            proposta comercial (gerado)
completa/index.html   plano completo (gerado)
artifact/             versões para publicar como Artifact claude.ai (geradas)
assets/images/        logos (Lactalis Brasil, 75 LAB) e portfólio 75 LAB
src/
  01-head.html        título, fontes, tokens e CSS principal
  02-chrome.html      header com logos, rodapé, capítulos, lightbox, cursor
  03..06-slides-*.html  telas do plano completo, por capítulo
  07-script.html      ícones animados, navegação, count-ups, lightbox, cursor, fundo
  pitch/slides.html   telas da proposta comercial
  partials/           trechos compartilhados pelas duas versões (mapa competitivo, cronograma)
build.ps1             gera index.html, completa/ e artifact/
serve.ps1             servidor estático local opcional
```

HTML, CSS e JavaScript puros, sem dependências. Fontes via Google Fonts (Archivo, Big Shoulders Display, Space Mono).

## Rebuild

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

## Uso

← → / espaço / PageUp/PageDown / roda do mouse / swipe / clique. `M` abre os capítulos. Deep link: `#s5`. Em telas ≤ 820 px a apresentação vira rolagem vertical.

## Pendências de conteúdo

- Dados institucionais da 75 LAB (razão social, CNPJ, endereço, telefone) e do apresentador: marcados `[preencher]`.
- Investimento do Nível 1: R$ 75.000 (piloto 90 dias), pagamento em 3 parcelas de R$ 25.000. Pendente: validade da proposta.
- Mockups do kit são conceitos ilustrativos; SKUs, claims, fotos e fichas técnicas dependem do time Lactalis.
- Regras de mídia e compartilhamento de dados do MyBidfood a confirmar com a Bidfood.

## Critério de cor (proposta)

- **Azul-noite:** momentos de marca e virada da história: capa, quem somos, a solução (reveal) e encerramento.
- **Branco-leite:** conteúdo de trabalho: agenda, diagnóstico, mercado, concorrência, estratégia, kit, cronograma, rastreamento e investimento.

## Fontes do mapa competitivo

Posições são leitura qualitativa 75 LAB a partir dos sites oficiais (consulta em 06/10/2026):
- https://www.nestleprofessional.com.br/
- https://www.unileverfoodsolutions.com.br/sobre-unilever-food-solutions.html
