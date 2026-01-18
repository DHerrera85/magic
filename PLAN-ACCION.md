# 🚀 PLAN DE ACCIÓN - CORRECCIONES PRIORITARIAS

**Fecha:** 26 de Diciembre, 2025  
**Estado:** 📋 Listo para implementar  
**Duración estimada:** 4-6 horas (ejecución gradual)

---

## 📋 FASE 1: UNIFICACIÓN DE CSS (CRÍTICA)

### Tarea 1.1: Migrar `horarios.html` a Tailwind

**Objetivo**: Reemplazar `style.css` por clases Tailwind en `horarios.html`

**Cambios necesarios:**
- Remover `<link rel="stylesheet" href="./assets/css/style.css">`
- Agregar `<link rel="stylesheet" href="./assets/css/tw.build.css">`
- Reemplazar todas las clases CSS manuales por equivalentes Tailwind

**Impacto:**
- ✅ Una sola fuente de estilos
- ✅ Colores consistentes
- ✅ Reducir 1104 líneas de CSS

**Archivos afectados:**
- [horarios.html](horarios.html) — Cambiar link CSS
- [tailwind.config.js](tailwind.config.js) — Agregar colores faltantes si es necesario

---

### Tarea 1.2: Consolidar colores en `tailwind.config.js`

**Objetivo**: Garantizar que todos los colores usados en Tailwind coincidan con los de CSS manual

**Revisión de colores:**

| CSS Manual | Tailwind | Acción |
|-----------|----------|--------|
| `--bg-purple` | `mkvio` | ✅ Verificar hex match |
| `--bg-dark-purple` | `mkbg` | ⚠️ Revisar valores |
| `--bg-oxford-blue` | `mkcard` | ⚠️ Revisar valores |
| `--text-purple` | `mkvio` | ✅ Usar `text-mkvio` |

**Archivos afectados:**
- [tailwind.config.js](tailwind.config.js) — Actualizar colores

---

### Tarea 1.3: Mover CSS inline de `index.html` a archivo externo

**Objetivo**: Eliminar `<style>` inline y usar clases CSS

**Análisis:**
- 60+ líneas de CSS inline en `index.html`
- Incluye: `.sidebar`, `.shell`, `.main-content`, media queries
- Debería estar en `assets/css/index-specific.css` o como Tailwind

**Opciones:**
A) Crear `assets/css/index-specific.css` para estilos específicos
B) Convertir todo a Tailwind (más limpio)

**Recomendación**: Opción B (Tailwind puro)

**Archivos afectados:**
- [index.html](index.html) — Remover `<style>`
- [tailwind.config.js](tailwind.config.js) — Agregar `extend:` si falta

---

## 📋 FASE 2: UNIFICACIÓN DE JAVASCRIPT

### Tarea 2.1: Unificar `script.js` para ser usado en todas las páginas

**Objetivo**: Un solo archivo JS con toda la lógica

**Funciones a consolidar:**
```javascript
// De index.html (inline)
toggleSidebar()
toggleChat()
toast(msg)

// De script.js (para horarios.html)
addEventOnElements()
toggleNav()
navClose()
```

**Plan:**
1. Mantener `script.js` como archivo principal
2. Remover JavaScript inline de `index.html`
3. Agregar listeners para elementos específicos usando selectores

**Archivos afectados:**
- [assets/js/script.js](assets/js/script.js) — Agregar todas las funciones
- [index.html](index.html) — Remover `<script>`
- [horarios.html](horarios.html) — Ya lo incluye ✅

---

### Tarea 2.2: Estandarizar data attributes

**Objetivo**: Usar convención consistente `data-*` en lugar de `id`

**Cambios:**
- Cambiar `id="sidebar"` → `data-sidebar`
- Cambiar `id="chat"` → `data-chat`
- Cambiar `id="mainContent"` → `data-main-content`
- Cambiar `id="sidebarToggle"` → `data-sidebar-toggle`

**Archivos afectados:**
- [index.html](index.html) — Cambiar IDs a data attributes
- [assets/js/script.js](assets/js/script.js) — Actualizar selectores

---

## 📋 FASE 3: CONFIGURACIÓN Y METADATA

### Tarea 3.1: Actualizar `package.json`

**Problemas actuales:**
```json
{
  "main": "index.js",  // ❌ NO EXISTE
  "description": "<div align=\"center\">",  // ❌ HTML CRUDO
}
```

**Cambios necesarios:**
- Remover o corregir `"main"`
- Fijar descripción correcta
- Agregar build script para Tailwind
- Agregar autor

**Archivos afectados:**
- [package.json](package.json)

---

### Tarea 3.2: Actualizar README.md

**Cambios necesarios:**
- Cambiar "Unigine" → "Magic Kids"
- Actualizar descripción del proyecto
- Actualizar badges (o remover si no aplican)
- Actualizar links de GitHub
- Agregar instrucciones de build para Tailwind CSS

**Archivos afectados:**
- [README.md](README.md)

---

### Tarea 3.3: Agregar favicon y meta tags faltantes

**Cambios necesarios:**

| Página | Falta |
|--------|-------|
| `index.html` | Favicon, meta description |
| `magickids_twitch_demo.html` | Favicon, meta description |
| `horarios.html` | ✅ Completo |

**Archivos afectados:**
- [index.html](index.html)
- [magickids_twitch_demo.html](magickids_twitch_demo.html)

---

### Tarea 3.4: Estandarizar fuentes importadas

**Problema actual:**
```html
<!-- index.html -->
family=Oxanium:wght@400;600;700;800

<!-- horarios.html -->
family=Oxanium:wght@400;500;600;700  <!-- ← 500 EXTRA -->
```

**Solución:**
- Usar pesos consistentes en todas las páginas
- Definir en `tailwind.config.js` cuáles se usan

**Archivos afectados:**
- [index.html](index.html)
- [horarios.html](horarios.html)
- [magickids_twitch_demo.html](magickids_twitch_demo.html)
- [tailwind.config.js](tailwind.config.js) — Documentar pesos

---

## 📋 FASE 4: LIMPIEZA Y OPTIMIZACIÓN

### Tarea 4.1: Documentar imágenes y eliminar duplicados

**Situación actual:**
- 130+ imágenes en `assets/images/`
- Duplicados: `.png`, `.jpg`, `.webp` del mismo contenido

**Plan:**
1. Crear inventario de imágenes (qué se usa vs. qué está obsoleto)
2. Eliminar duplicados innecesarios
3. Documentar convención de nombres

**Archivos afectados:**
- [assets/images/](assets/images/) — Limpieza

---

### Tarea 4.2: Crear `CONTRIBUTING.md`

**Incluir:**
- Cómo configurar el proyecto
- Cómo compilar Tailwind CSS
- Cómo agregar nuevas páginas
- Convenciones de código

**Archivos a crear:**
- `CONTRIBUTING.md` (nuevo)

---

### Tarea 4.3: Validar breakpoints en Tailwind

**Objetivos:**
- Definir breakpoints en `tailwind.config.js`
- Usar los mismos breakpoints en todas las media queries
- Documentar en `style-guide.md`

**Archivos afectados:**
- [tailwind.config.js](tailwind.config.js)
- [style-guide.md](style-guide.md)

---

## 📋 FASE 5: VALIDACIÓN Y TESTING

### Tarea 5.1: Validar HTML en las 3 páginas

**Checklist:**
- [ ] HTML válido (W3C validator)
- [ ] Meta tags presentes en todas las páginas
- [ ] Favicon en todas las páginas
- [ ] Links internos funcionan
- [ ] Sin console errors

**Herramientas:**
- [https://validator.w3.org/](https://validator.w3.org/)
- DevTools de navegador

---

### Tarea 5.2: Validar responsive en móvil y desktop

**Breakpoints a probar:**
- 320px (móvil pequeño)
- 768px (tablet)
- 960px (desktop pequeño)
- 1440px+ (desktop grande)

**Checklist:**
- [ ] Navbar/sidebar responsive
- [ ] Imágenes escalan bien
- [ ] Texto legible
- [ ] Botones accesibles

---

### Tarea 5.3: Validar consistencia visual

**Checklist:**
- [ ] Colores iguales en todas las páginas
- [ ] Tipografía consistente
- [ ] Espaciados uniformes
- [ ] Transiciones suaves

---

## 🗓️ CRONOGRAMA SUGERIDO

| Fase | Tareas | Tiempo | Antes de |
|------|--------|--------|----------|
| 1 | 1.1, 1.2, 1.3 | 1.5h | Subir a producción |
| 2 | 2.1, 2.2 | 1h | Subir a producción |
| 3 | 3.1-3.4 | 0.5h | Subir a producción |
| 4 | 4.1-4.3 | 1h | Nice to have |
| 5 | 5.1-5.3 | 1h | Antes de Fase 1 |

**Total:** 4-6 horas

---

## 💾 ARCHIVOS A CREAR

1. `CONTRIBUTING.md` — Guía de contribución
2. `ANALISIS-DISPARIDADES.md` — Este análisis (ya creado)
3. `PLAN-ACCION.md` — Este plan (ya creado)

---

## 🔄 ARCHIVOS A MODIFICAR

| Archivo | Cambio | Prioridad |
|---------|--------|-----------|
| `horarios.html` | Cambiar CSS a Tailwind | 🔴 CRÍTICA |
| `index.html` | Remover CSS/JS inline | 🔴 CRÍTICA |
| `script.js` | Consolidar todas las funciones | 🔴 CRÍTICA |
| `tailwind.config.js` | Verificar colores | 🔴 CRÍTICA |
| `package.json` | Actualizar metadata | 🔴 CRÍTICA |
| `README.md` | Actualizar documentación | 🟠 ALTA |
| `style.css` | Eliminar (después de Tarea 1.1) | 🟠 ALTA |
| `style-guide.md` | Actualizar guía de estilo | 🟡 MEDIA |

---

## 🛑 ARCHIVOS A ELIMINAR (al final)

- `style.css` — Después de migrar horarios.html
- `assets/images/` — Limpiar duplicados

---

## ✅ CRITERIOS DE ÉXITO

Una vez completadas todas las fases:

- ✅ Una sola fuente de CSS (Tailwind)
- ✅ Una sola fuente de JavaScript
- ✅ Colores consistentes en todas las páginas
- ✅ Meta tags completos en todas las páginas
- ✅ README actualizado y correcto
- ✅ Sin CSS duplicado
- ✅ Sin JavaScript inline
- ✅ Responsive funciona correctamente
- ✅ Validación HTML sin errores
- ✅ Documentación clara (CONTRIBUTING.md)

---

## 🚀 PRÓXIMOS PASOS

1. **Revisar este plan** con stakeholders
2. **Ejecutar Fase 1** (unificación de CSS)
3. **Ejecutar Fase 2** (unificación de JavaScript)
4. **Ejecutar Fase 3** (metadata y config)
5. **Ejecutar Fase 4** (limpieza)
6. **Ejecutar Fase 5** (validación)
7. **Subir a producción** cuando todo esté validado

---

**Plan creado:** 26-12-2025  
**Versión:** 1.0
