# Lactalis na Operação · Lactalis × 75 LAB

Apresentação HTML da proposta 75 LAB para a entrada da **Lactalis Brasil em Food Service** (piloto Bidfood São Paulo, outubro de 2026).

- **Proposta comercial (15 telas):** https://agencia75lab.github.io/lactalis-na-operacao/
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
- Investimento do Nível 1 na tela de proposta: `[a preencher]`.
- Mockups do kit são conceitos ilustrativos; SKUs, claims, fotos e fichas técnicas dependem do time Lactalis.
- Regras de mídia e compartilhamento de dados do MyBidfood a confirmar com a Bidfood.
