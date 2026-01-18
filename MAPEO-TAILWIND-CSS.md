# 🔄 Mapeo: Tailwind → CSS Vanilla

**Documento Técnico para FASE 1 (Preparación)**

---

## INSTRUCCIONES DE USO
Este documento es la **guía de conversión específica** para refactorizar index.html de Tailwind a CSS vanilla. Cada clase Tailwind se mapea a su equivalente CSS que será definido en `assets/css/style.css`.

---

## 1. CLASES DE LAYOUT (Estructura)

| Tailwind | CSS Vanilla | Ubicación | Notas |
|----------|------------|-----------|-------|
| `fixed inset-0 -z-10 opacity-60 bg-gradient-to-tr from-fuchsia-600/20 via-violet-600/12 to-cyan-400/10 bg-[length:200%_200%] animate-gradientMove` | `.bg-animated` | body-nivel | Gradiente de fondo fijo, animado |
| `flex` | `.flex` | + todas | Display flex |
| `grid` | `.grid` | + todas | Display grid |
| `place-items-center` | `.place-center` | + botones | Centrado absolute |
| `grid-cols-4` | `.grid-4-cols` | navbar | 4 columnas |
| `grid-cols-[1fr_auto_1fr]` | `.grid-schedule-cols` | schedule items | 3 columnas especiales |
| `space-y-1` | `.space-y-1` | sidebar | Espaciado vertical |
| `space-y-3` | `.space-y-3` | chat messages | Espaciado vertical |
| `space-y-5` | `.space-y-5` | main sections | Espaciado vertical |
| `mx-auto` | `.mx-auto` | shell | Margen horizontal |
| `ml-auto` | `.ml-auto` | header buttons | Margin-left auto |
| `mt-auto` | `.mt-auto` | chat footer | Margin-top auto |
| `flex-1` | `.flex-1` | botones full | flex-grow |
| `overflow-hidden` | `.overflow-hidden` | varios | Overflow hidden |
| `overflow-x-auto` | `.overflow-x-auto` | shorts section | Scroll horizontal |
| `h-screen` | `.h-screen` | sidebar | height 100vh |
| `aspect-[16/9]` | `.aspect-16-9` | video section | aspect ratio |
| `aspect-[9/16]` | `.aspect-9-16` | shorts cards | aspect ratio |
| `min-w-0` | `.min-w-0` | truncate parent | Min width 0 |
| `shrink-0` | `.shrink-0` | button groups | No shrink |
| `w-full` | `.w-full` | botones | width 100% |
| `max-w-[360px]` | `.max-w-360` | chat aside | max-width |
| `max-w-[1400px]` | `.max-w-1400` | shell desktop | max-width |
| `w-[86%]` | `.w-86-pct` | chat width | width 86% |
| `max-h-[360px]` | - | N/A | No usado |

---

## 2. TIPOGRAFÍA

| Tailwind | CSS Vanilla | Descripción |
|----------|------------|-------------|
| `font-display` | `body { font-family: 'Oxanium', cursive; }` | Font principal |
| `text-white` | `.text-white` | Color blanco |
| `text-white/70` | `.text-white-70` | opacity 0.7 |
| `text-white/75` | `.text-white-75` | opacity 0.75 |
| `text-white/60` | `.text-white-60` | opacity 0.6 |
| `text-white/55` | `.text-white-55` | opacity 0.55 |
| `text-white/45` | `.text-white-45` | opacity 0.45 |
| `text-white/80` | `.text-white-80` | opacity 0.8 |
| `text-white/40` | `.text-white-40` | opacity 0.4 |
| `font-bold` | `.font-bold` | font-weight 700 |
| `font-extrabold` | `.font-extrabold` | font-weight 800 |
| `font-[900]` | `.font-900` | font-weight 900 |
| `text-base` | `.text-base` | 1rem |
| `text-lg` | `.text-lg` | 1.125rem |
| `text-sm` | `.text-sm` | 0.875rem |
| `text-xs` | `.text-xs` | 0.75rem |
| `text-[11px]` | `.text-11` | 11px |
| `text-xl` | `.text-xl` | 1.25rem |
| `text-3xl` | `.text-3xl` | 1.875rem |
| `text-[15px]` | `.text-15` | 15px |
| `leading-tight` | `.leading-tight` | line-height 1.25 |
| `tracking-wide` | `.tracking-wide` | letter-spacing 0.025em |
| `tracking-wider` | `.tracking-wider` | letter-spacing 0.05em |
| `tracking-[.25em]` | `.tracking-25` | letter-spacing 0.25em |
| `truncate` | `.truncate` | Truncar texto |
| `uppercase` | `.uppercase` | text-transform |

---

## 3. COLORES (Custom Properties)

| Tailwind | CSS Variable | Valor (de horarios.html) |
|----------|-------------|------------------------|
| `text-mkcyan` | `var(--text-cyan)` | `#38F4F2` |
| `text-mkvio` | `var(--text-violet)` | `#9841FF` |
| `text-mkvio2` | `var(--text-violet-2)` | `#7B2CBF` |
| `text-mkpink` | `var(--text-pink)` | `#FF39C8` |
| `text-mkyel` | `var(--text-yellow)` | `#FFC300` |
| `bg-mkbg` | `var(--bg-primary)` | `#0D1B3D` |
| `bg-mkcard` | `var(--bg-card)` | `#1A0D2E` |
| `bg-red-600/90` | `.bg-red-600-90` | rgba(220, 38, 38, 0.9) |
| `bg-black/20` | `.bg-black-20` | rgba(0, 0, 0, 0.2) |
| `bg-black/30` | `.bg-black-30` | rgba(0, 0, 0, 0.3) |
| `bg-black/40` | `.bg-black-40` | rgba(0, 0, 0, 0.4) |
| `bg-black/45` | `.bg-black-45` | rgba(0, 0, 0, 0.45) |
| `bg-black/50` | `.bg-black-50` | rgba(0, 0, 0, 0.5) |
| `bg-white/5` | `.bg-white-5` | rgba(255, 255, 255, 0.05) |
| `bg-white/10` | `.bg-white-10` | rgba(255, 255, 255, 0.1) |
| `bg-white/15` | `.bg-white-15` | rgba(255, 255, 255, 0.15) |
| `border-white/10` | `.border-white-10` | rgba(255, 255, 255, 0.1) |

**Gradientes Especiales:**
- `from-mkvio to-mkpink` → `linear-gradient(to right, #9841FF, #FF39C8)`
- `from-mkvio2 to-mkcyan` → `linear-gradient(to right, #7B2CBF, #38F4F2)`
- `from-mkyel to-mkpink` → `linear-gradient(to right, #FFC300, #FF39C8)`
- `from-mkcyan to-mkvio` → `linear-gradient(to right, #38F4F2, #9841FF)`
- `from-mkvio2 to-mkpink` → `linear-gradient(to right, #7B2CBF, #FF39C8)`
- `from-mkyel to-mkvio2` → `linear-gradient(to right, #FFC300, #7B2CBF)`

---

## 4. ESPACIADO Y TAMAÑOS

| Tailwind | CSS Vanilla | Valor |
|----------|-------------|-------|
| `p-4` | `.p-4` | padding: 1rem |
| `p-3` | `.p-3` | padding: 0.75rem |
| `p-2` | `.p-2` | padding: 0.5rem |
| `px-4` | `.px-4` | padding-left/right: 1rem |
| `px-3` | `.px-3` | padding-left/right: 0.75rem |
| `px-2` | `.px-2` | padding-left/right: 0.5rem |
| `px-5` | `.px-5` | padding-left/right: 1.25rem |
| `px-3.5` | `.px-3-5` | padding-left/right: 0.875rem |
| `px-2.5` | `.px-2-5` | padding-left/right: 0.625rem |
| `py-2.5` | `.py-2-5` | padding-top/bottom: 0.625rem |
| `py-3` | `.py-3` | padding-top/bottom: 0.75rem |
| `py-2` | `.py-2` | padding-top/bottom: 0.5rem |
| `py-1` | `.py-1` | padding-top/bottom: 0.25rem |
| `pb-24` | `.pb-24` | padding-bottom: 6rem |
| `pb-1` | `.pb-1` | padding-bottom: 0.25rem |
| `pt-4` | `.pt-4` | padding-top: 1rem |
| `my-3` | `.my-3` | margin-top/bottom: 0.75rem |
| `mt-1` | `.mt-1` | margin-top: 0.25rem |
| `mt-2` | `.mt-2` | margin-top: 0.5rem |
| `mt-3` | `.mt-3` | margin-top: 0.75rem |
| `ml-2` | `.ml-2` | margin-left: 0.5rem |
| `ml-auto` | `.ml-auto` | margin-left: auto |
| `mt-auto` | `.mt-auto` | margin-top: auto |
| `gap-4` | `.gap-4` | gap: 1rem |
| `gap-3` | `.gap-3` | gap: 0.75rem |
| `gap-2` | `.gap-2` | gap: 0.5rem |

---

## 5. BORDES Y ESQUINAS

| Tailwind | CSS Vanilla | Valor |
|----------|-------------|-------|
| `rounded-full` | `.rounded-full` | border-radius: 9999px |
| `rounded-3xl` | `.rounded-3xl` | border-radius: 1.5rem |
| `rounded-2xl` | `.rounded-2xl` | border-radius: 1rem |
| `rounded-xl` | `.rounded-xl` | border-radius: 0.75rem |
| `border` | `.border` | border: 1px solid |
| `border-r` | `.border-r` | border-right: 1px solid |
| `border-b` | `.border-b` | border-bottom: 1px solid |
| `border-l` | `.border-l` | border-left: 1px solid |
| `border-t` | `.border-t` | border-top: 1px solid |
| `divide-y` | `.divide-y` | border-bottom: 1px solid |
| `divide-white/10` | `.divide-white-10` | border-color: rgba(255,255,255,0.1) |
| `border-white/10` | `.border-white-10` | border-color: rgba(255,255,255,0.1) |
| `border-white/15` | `.border-white-15` | border-color: rgba(255,255,255,0.15) |
| `border-mkvio/40` | `.border-violet-40` | border-color: rgba(152,65,255,0.4) |

---

## 6. EFECTOS Y ANIMACIONES

| Tailwind | CSS Vanilla | Implementación |
|----------|------------|-----------------|
| `shadow-glow` | `.shadow-glow` | box-shadow custom (efecto brillo) |
| `shadow-[0_20px_70px_rgba(110,44,255,.18)]` | `.shadow-purple-glow` | Shadow especial violeta |
| `shadow-[0_30px_90px_rgba(0,0,0,.55)]` | `.shadow-dark-heavy` | Shadow especial oscuro |
| `shadow-[0_30px_90px_rgba(0,0,0,.6)]` | `.shadow-dark-heavier` | Shadow especial muy oscuro |
| `animate-pingSoft` | `.animate-ping-soft` | Ping suave (1.5s) |
| `animate-gradientMove` | `.animate-gradient` | Gradient shift animation (3s) |
| `transition` | `.transition` | transition: all 250ms |
| `transition-all duration-300` | `.transition-300` | transition: all 300ms |
| `transition-transform duration-200` | `.transition-transform-200` | transition: transform 200ms |
| `transition-opacity` | `.transition-opacity` | transition: opacity 250ms |
| `active:scale-[.98]` | `.active-scale-98` | active { transform: scale(0.98) } |
| `active:scale-[.99]` | `.active-scale-99` | active { transform: scale(0.99) } |
| `hover:bg-white/10` | `.hover-bg-white-10` | hover { background: rgba(255,255,255,0.1) } |
| `hover:bg-white/20` | `.hover-bg-white-20` | hover { background: rgba(255,255,255,0.2) } |
| `hover:bg-black/30` | `.hover-bg-black-30` | hover { background: rgba(0,0,0,0.3) } |
| `hover:text-white/80` | `.hover-text-white-80` | hover { color: rgba(255,255,255,0.8) } |
| `hover:text-white` | `.hover-text-white` | hover { color: white } |
| `group-hover:text-white` | `.group:hover .group-hover-text-white` | Group hover styles |
| `group-hover:text-white/80` | `.group:hover .group-hover-text-white-80` | Group hover with opacity |

---

## 7. POSICIONAMIENTO

| Tailwind | CSS Vanilla | Descripción |
|----------|------------|-------------|
| `fixed` | `position: fixed` | Fixed positioning |
| `absolute` | `position: absolute` | Absolute positioning |
| `sticky` | `position: sticky` | Sticky positioning |
| `inset-0` | `inset: 0` | top, right, bottom, left = 0 |
| `inset-y-0` | `inset: 0 auto` | top/bottom = 0 |
| `top-0` | `top: 0` | Top 0 |
| `left-0` | `left: 0` | Left 0 |
| `right-0` | `right: 0` | Right 0 |
| `bottom-0` | `bottom: 0` | Bottom 0 |
| `bottom-3` | `bottom: 0.75rem` | Bottom position |
| `bottom-24` | `bottom: 6rem` | Bottom position |
| `top-3` | `top: 0.75rem` | Top position |
| `left-3` | `left: 0.75rem` | Left position |
| `right-3` | `right: 0.75rem` | Right position |
| `z-10` | `z-index: 10` | Z-index |
| `z-20` | `z-index: 20` | Z-index |
| `z-30` | `z-index: 30` | Z-index |
| `z-40` | `z-index: 40` | Z-index |
| `z-50` | `z-index: 50` | Z-index |
| `-z-10` | `z-index: -10` | Z-index negativo |
| `-translate-x-1/2` | `transform: translateX(-50%)` | Centrado horizontal |
| `translate-x-0` | `transform: translateX(0)` | No translate |
| `translate-x-full` | `transform: translateX(100%)` | Translate 100% |
| `-translate-x-full` | `transform: translateX(-100%)` | Translate -100% |

---

## 8. RESPONSIVE BREAKPOINTS

**Mobile-First Approach (predeterminado)**

| Tailwind | CSS Vanilla | Min-Width |
|----------|------------|-----------|
| (ninguno) | Base styles | 0px |
| `md:sticky` | `@media (min-width: 768px)` | 768px |
| No existe `lg:` en index.html | `@media (min-width: 1024px)` | 1024px |

**Media Queries en CSS:**
```css
@media (max-width: 959px) {
  /* Mobile styles */
}

@media (min-width: 960px) {
  /* Desktop styles */
}

@media (max-width: 768px) {
  /* Tablet and mobile */
}
```

---

## 9. COMPONENTES COMPLEJOS

### A. HEADER PRINCIPAL
```html
<!-- Tailwind -->
<header class="relative stars">
  <div class="sticky top-0 z-20 backdrop-blur bg-black/20 border-b border-white/10">
```
→ Necesita clase `.header-main` con:
- `position: sticky; top: 0;`
- `z-index: 20;`
- `backdrop-filter: blur(20px);`
- `background: rgba(0,0,0,0.2);`
- `border-bottom: 1px solid rgba(255,255,255,0.1);`

### B. BOTONES ICONOGRÁFICOS
```html
<!-- Tailwind -->
<button class="h-10 w-10 rounded-2xl border border-white/10 bg-white/5 hover:bg-white/10 active:scale-[.98]">
```
→ Necesita clase `.btn-icon` con:
- `width: 40px; height: 40px;`
- `border-radius: 1rem;`
- `border: 1px solid rgba(255,255,255,0.1);`
- `background: rgba(255,255,255,0.05);`
- Hover/Active states

### C. TARJETAS (CARDS)
```html
<!-- Tailwind -->
<section class="rounded-3xl border border-white/10 bg-gradient-to-b from-mkcard/90 to-black/40">
```
→ Necesita clase `.card-primary` con:
- `border-radius: 1.5rem;`
- `border: 1px solid rgba(255,255,255,0.1);`
- Gradientes específicos

### D. SIDEBAR CON EXPANSIÓN
```html
<!-- Tailwind -->
<aside class="sidebar fixed top-0 left-0 h-screen w-72 md:sticky">
```
→ Necesita clases `.sidebar`, `.sidebar.expanded`
Con transiciones CSS (ya está en index.html inline)

### E. CHAT PANEL
```html
<!-- Tailwind -->
<aside class="fixed inset-y-0 right-0 translate-x-full transition-transform duration-200 z-40">
```
→ Necesita clase `.chat-panel`
Con transiciones `translate-x-0` / `translate-x-full`

---

## 10. LISTA DE COMPROBACIÓN - CONVERSIÓN

### Fase 2A: Crear `assets/css/style-nuevo.css`
- [ ] Copiar todas las custom properties de horarios.html
- [ ] Crear utility classes para opacity (`.text-white-70`, etc.)
- [ ] Crear color classes (`.text-cyan`, `.bg-red-600-90`, etc.)
- [ ] Crear spacing classes (`.p-4`, `.gap-3`, etc.)
- [ ] Crear border/rounded classes (`.rounded-2xl`, `.border-white-10`, etc.)
- [ ] Crear effect classes (`.shadow-glow`, `.transition-300`, etc.)
- [ ] Crear component classes (`.btn-icon`, `.card-primary`, etc.)
- [ ] Crear responsive styles (@media queries)
- [ ] Crear animation keyframes (`.animate-ping-soft`, `.animate-gradient`)

### Fase 2B: Verificar conversión
- [ ] Todos los colores Tailwind mapeados
- [ ] Todos los tamaños convertidos
- [ ] Todas las animaciones implementadas
- [ ] Responsive breakpoints verificados

### Fase 3: Refactorizar index.html
- [ ] Quitar `<link rel="stylesheet" href="./assets/css/tw.build.css">`
- [ ] Quitar `<style>` tag (el que tiene .shell, .sidebar, etc.)
- [ ] Agregar `<link rel="stylesheet" href="./assets/css/style.css">`
- [ ] Reemplazar clases Tailwind con clases CSS
- [ ] Quitar inline scripts
- [ ] Agregar `<script src="./assets/js/script.js"></script>`

---

## NOTAS IMPORTANTES

1. **Las clases se definen en un solo lugar**: `assets/css/style.css`
2. **Las custom properties vienen de horarios.html**: Copiar sección `:root`
3. **Los selectores de datos (data-*) NO cambiar**: HTML sigue igual
4. **Las funciones JS se mueven a script.js**: No se pierden, solo se reorganizan
5. **Estructura HTML NO cambia**: Solo se reemplazan atributos class

---

**Documentación Generada:** 26-12-2025
**Estado:** FASE 1 - PREPARACIÓN - ✅ MAPEO COMPLETO