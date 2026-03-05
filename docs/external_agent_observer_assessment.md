## ANÁLISE DA DOCUMENTAÇÃO
A documentação existente está madura, extensa e orientada a validação objetiva. A arquitetura atual está dividida em quatro trilhas principais: (1) reconstrução/rebuild do ROM SNES com WLA-DX no root, (2) runtime de port em C + SDL2 no diretório `port/`, (3) ferramental de extração/conversão/geração de cenas em `tools/`, e (4) harness de validação com Mesen + Lua em `validation/`.

Do ponto de vista de arquitetura de software, a estratégia descrita está correta para um port de alta fidelidade: reimplementação guiada por comportamento verificado, e não tradução literal de assembly para C. O plano define loop fixo de 60 Hz, framebuffer 256x224, renderer por software com apresentação via SDL, e uso de assets extraídos como fonte de verdade para o runtime.

### Componentes já implementados/documentados
- **Renderização:**
  - Viewer de paletas e PPM.
  - Caminho direto de composição SNES BG a partir de `VRAM + CGRAM + PPU state`.
  - Suporte opcional a OAM/OBJ para composição de sprites em cenas extraídas.
  - Suporte a playback por manifest (`image`, `snes_bg`, `indexed_anim`, `ballistic_a39c`).
- **Input:**
  - Input básico no runtime SDL (teclado para navegação/controle de visualização e execução).
  - Input automatizado no ambiente de validação via scripts Lua/Mesen.
- **Áudio:**
  - Pipeline parcial de assets (ex.: `.wav -> .brr`) no Makefile raiz.
  - No runtime PC, áudio/mixer está no plano arquitetural, ainda não caracterizado como subsistema jogável completo.
- **Ferramentas de engenharia reversa e conteúdo:**
  - Extração de paletas, dumps de cenas, geradores de manifest, análise de deltas por frame, análise de filas DMA bootstrap, geração de cenas bridge Mode 7 e conversões auxiliares.
- **Validação/Testes de fidelidade visual:**
  - Capturas automatizadas com Mesen e comparação de frames.
  - Alvos “golden” já estabelecidos para partes do fluxo (inclusive casos com mismatch 0 para cena de referência).

### Dependências e requisitos
- **Build/disassembly ROM:** `wla-65816`, `wla-spc700`, `wlalink`, além de utilitários como `bmp2chr` e `brr` quando aplicável.
- **Runtime PC:** compilador C (C11) + SDL2 (`pkg-config --cflags/--libs sdl2`).
- **Validação/emulação:** Mesen/Mesen2 + scripts Lua.
- **Execução:** ambiente desktop capaz de rodar SDL2; para smoke headless, uso de dummy video driver é documentado.

### Qualidade e completude da documentação
- **Pontos fortes:** documentação detalhada, incremental, com métricas objetivas (mismatch por frame, ranges cobertos, marcos por callback/estado).
- **Pontos de atenção:** algumas áreas ainda dependem de investigação ativa (janela bootstrap `958..977`, deriva em trechos tardios de Mode 7), o que está explicitado com transparência.

## STATUS DO PROJETO
- **Progresso estimado: 44%**
- **Componentes funcionais:**
  - Build de ROM e base de disassembly.
  - Runtime SDL2 com loop fixo e apresentação framebuffer.
  - Renderização de cenas SNES BG a partir de dumps de estado.
  - Composição opcional OBJ/OAM para cenas extraídas.
  - Pipeline robusto de extração/manifest/validação visual.
  - Playback híbrido do loop de intro com trechos nativos + amostrados.
- **Componentes em desenvolvimento:**
  - Fechamento da janela bootstrap (`L00A00C -> 01:9D69 -> 01:9FE5`) com precisão total.
  - Expansão de cobertura nativa além de frame `1093` no attract/Mode 7.
  - Consolidação de documentação executável de callbacks e memória de estado.
  - Fortalecimento da trilha de extração/montagem para reduzir dependência de sequências amostradas.
- **Componentes pendentes:**
  - Gameplay jogável fim-a-fim (física, colisão, IA, HUD completo, progressão).
  - Pipeline completo de áudio runtime (mixer e reprodução integrada de música/SFX do jogo).
  - MVP integrado de corrida (do boot até corrida com input real, checkpoints e regras).

## PRÓXIMOS PASSOS RECOMENDADOS

### PRIORIDADE ALTA (Imediato)
1. **Dar boost na extração e montagem de assets da intro** - Este é o melhor ataque ao gargalo atual: em vez de insistir só em remendos no playback híbrido, aumentar cobertura de extração determinística (VRAM/CGRAM/OAM/estado por callback) e builders de cena para converter janelas problemáticas em assets nativos confiáveis.
2. **Criar um “Live Asset Inspector” para design e engenharia, baseado no código do Mesen** - Usar como referência direta os módulos já existentes no Mesen (debug viewers de PPU/layers/sprites/paletas e trilhas de estado) para construir ferramentas internas de inspeção visual em tempo real, com export de snapshots/tilesets/tilemaps/paletas por frame. Isso acelera diagnóstico, habilita validação visual pelo time de design e prepara base para futuros mods e upscale gráfico.
3. **Fechar deterministicamente a janela `958..977`** - É o principal gargalo de continuidade visual entre estados, e impacta confiança na fidelidade do loop de intro.
4. **Congelar baseline de validação em CI local (golden scenes + tolerâncias por faixa)** - Evita regressões silenciosas enquanto bridge, extractor e runtime evoluem.

### PRIORIDADE MÉDIA (Curto prazo)
1. **Derivar ferramentas de debug visual a partir da arquitetura do Mesen** - Priorizar reaproveitamento conceitual dos fluxos de debug já maduros no emulador (layer viewers, OBJ viewers, palette viewers e dumpers), encapsulando isso em ferramentas do projeto orientadas a produção de assets e revisão artística.
2. **Implementar vertical slice jogável mínimo (boot -> menu/attract -> entrar corrida curta)** - Cria prova de integração dos subsistemas centrais e valida latência/input/frame pacing.
3. **Evoluir subsistema de áudio runtime** - Prioritário para MVP perceptivo; fidelidade sonora é parte central da experiência SNES.
4. **Expandir automação de testes de regressão visual e estado** - Incluir comparação batch por ranges e relatório resumido por PR.

### PRIORIDADE BAIXA (Longo prazo)
1. **Otimizações de performance orientadas por profiling real** - Ex.: hot paths de composição Mode 7/OBJ, layout de memória, cache locality.
2. **Normalizar formatos e versionamento de assets extraídos (schema estável)** - Facilita tooling futuro e reduz acoplamento com detalhes internos de banco SNES.
3. **Ferramentas para modding/conteúdo artístico e portabilidade adicional** - Após MVP desktop estável.

## RISCOS E DESAFIOS
- Complexidade de sincronização entre estado lógico (callbacks) e estado visual (PPU/Mode 7/OAM) em janelas de transição.
- Risco de “overfitting” em validação apenas por screenshot sem contrato de estado interno.
- Dependência de toolchain externo (Mesen/scripts) para ciclos de validação.
- Crescimento da complexidade dos manifests híbridos se a migração para nativo atrasar.
- Potenciais regressões de performance ao aumentar cobertura nativa sem orçamento de profiling.
- Risco técnico de acoplamento excessivo ao runtime do emulador: a integração com o ecossistema Mesen deve focar ferramentas de extração/inspeção e formatos intermediários estáveis para não travar evolução do port.

## RECOMENDAÇÕES ADICIONAIS
- Instituir **matriz de cobertura** por sistema (render/input/audio/gameplay) com status e métricas.
- Definir **error budget** por fase (ex.: 0 mismatch em cenas golden; tolerância temporária só onde documentado).
- Adotar **testes determinísticos de replay/input log** para validar comportamento além de frame visual.
- Formalizar um **pipeline de validação para design**: comparador visual com toggles de layers (BG1/BG2/OBJ), heatmap de diferença, player “live” sincronizado e export de pacote de revisão por faixa de frames.
- Manter documentação de decisões técnicas (ADRs curtos) para registrar escolhas de compositor, política de manifests, “live inspector” e critérios de fidelidade.

- Criar um **asset workbench para mods/upscale** baseado nos dumps visuais (tiles, tilemaps, paletas, OAM) para permitir iteração artística com round-trip controlado.
