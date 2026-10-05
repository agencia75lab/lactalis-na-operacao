# Lactalis na Operação · apresentação 75LAB

Apresentação HTML interativa do **plano estratégico de entrada em Food Service da Lactalis Brasil** (piloto Bidfood São Paulo, outubro de 2026), produzida pela 75LAB.

## Estrutura

```
assets/images/   logos (Lactalis Brasil, 75LAB) e portfólio 75LAB
src/             fonte, em partes concatenadas na ordem do nome
  01-head.html     título, fontes, tokens e CSS principal
  02-chrome.html   header com logos, rodapé, menu de capítulos, lightbox, cursor
  03..06-slides    as 42 telas, por capítulo
  07-script.html   ícones animados, motor de navegação, count-ups, lightbox, cursor, fundo
build.ps1        gera index.html (fragmento para Artifact claude.ai) e docs/index.html (GitHub Pages)
serve.ps1        servidor estático local opcional (http://localhost:8765)
docs/            versão publicável no GitHub Pages (Settings → Pages → branch main, pasta /docs)
```

Sem dependências de build: HTML, CSS e JavaScript puros. Fontes via Google Fonts (Archivo, Big Shoulders Display, Space Mono).

## Uso

- Navegação: ← → / espaço / PageUp/PageDown / roda do mouse / swipe / clique (lado esquerdo volta). `M` abre os capítulos. Home/End.
- Deep link: `#s12` abre a tela 12.
- Em telas ≤ 820 px a apresentação vira rolagem vertical com layouts reorganizados.
- `prefers-reduced-motion` desliga animações; máquinas com ≤ 4 núcleos usam modo leve.

## Rebuild

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

## Publicar no GitHub Pages

```bash
git init
git add .
git commit -m "Lactalis na Operação: apresentação 75LAB"
git branch -M main
git remote add origin https://github.com/<org>/lactalis-food-service-75lab.git
git push -u origin main
```

Depois: Settings → Pages → Deploy from a branch → `main` / `/docs`. Atenção: em repositório público o plano estratégico do cliente fica acessível a qualquer pessoa.

## Pendências de conteúdo

- Dados institucionais da 75LAB: razão social, CNPJ, endereço, telefone (marcados `[preencher]` na última tela).
- Apresentador: nome, cargo, e-mail, telefone.
- Mockups do kit são conceitos ilustrativos; SKUs, claims, fotos e fichas técnicas dependem do time Lactalis.
- Regras de mídia e compartilhamento de dados do MyBidfood a confirmar com a Bidfood.
