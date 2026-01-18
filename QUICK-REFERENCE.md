# ⚡ QUICK REFERENCE - GUÍA RÁPIDA

**Usa este documento como referencia rápida mientras trabajas en las correcciones.**

---

## 🎯 LO MÁS IMPORTANTE EN 60 SEGUNDOS

### El Problema
- 3 páginas con 3 estilos diferentes ❌
- CSS en 3 lugares (Tailwind, Manual, Inline) ❌
- JavaScript en 2 lugares (script.js, inline) ❌
- Documentación obsoleta ❌

### La Solución
- 1 CSS (Tailwind) para todo ✅
- 1 JavaScript (script.js) para todo ✅
- 1 Documentación actualizada ✅

### El Tiempo
- 4-6 horas de trabajo
- Mejor hacerlo antes de subir a producción

---

## 📂 ARCHIVOS PRINCIPALES A MODIFICAR

```
CRÍTICA (hacer primero):
├─ horarios.html           → Cambiar style.css por tw.build.css
├─ index.html              → Remover <style> inline, mover a archivo
├─ assets/js/script.js     → Consolidar ALL funciones
├─ tailwind.config.js      → Verificar colores
└─ package.json            → Actualizar metadata

ALTA (después):
├─ README.md               → Actualizar documentación
├─ magickids_twitch_demo.html → Agregar favicon + meta tags
└─ style-guide.md          → Actualizar breakpoints

ELIMINAR (al final):
└─ assets/css/style.css    → Después de Paso 1
```

---

## 🎨 MAPEO DE COLORES (Para verificar)

### Tailwind (CORRECTO)
```javascript
mkbg:    '#060312'  // Fondo principal (negro muy oscuro)
mkcard:  '#0B0720'  // Fondo de cartas
mkvio:   '#6E2CFF'  // Violeta principal
mkvio2:  '#9B5CFF'  // Violeta secundario
mkpink:  '#FF39C8'  // Rosa/Magenta
mkcyan:  '#38F4F2'  // Cyan
mkyel:   '#FFC857'  // Amarillo
```

### CSS Manual (A REVISAR)
```css
--bg-purple:          hsla(267, 100%, 63%, 1);     // ¿= mkvio?
--bg-dark-purple:     hsla(279, 42%, 9%, 1);      // ¿= mkbg?
--bg-oxford-blue:     hsla(240, 63%, 13%, 1);     // ¿= mkcard?
--text-white:         hsla(0, 0%, 100%, 1);       // = #FFFFFF
--text-purple:        hsla(267, 100%, 63%, 1);    // = mkvio
```

**Acción**: Convertir hsla() a hex y comparar con Tailwind

---

## 📝 CAMBIOS EN index.html

### ANTES (Con problemas)
```html
<head>
  ...
  <link rel="stylesheet" href="./assets/css/tw.build.css">
  <style>
    .shell { max-width: 100%; ... }
    .sidebar { width: 72px; ... }
    /* 60+ LÍNEAS DE CSS INLINE */
  </style>
</head>
<body>
  ...
  <script>
    function toggleSidebar() { ... }
    function toggleChat() { ... }
    function toast(msg) { ... }
    /* 50+ LÍNEAS DE JS INLINE */
  </script>
</body>
```

### DESPUÉS (Limpio)
```html
<head>
  ...
  <link rel="stylesheet" href="./assets/css/tw.build.css">
  <!-- CSS INLINE ELIMINADO ✅ -->
</head>
<body>
  ...
  <script src="./assets/js/script.js"></script>
  <!-- JS INLINE ELIMINADO ✅ -->
</body>
```

---

## 📝 CAMBIOS EN horarios.html

### ANTES (Con problemas)
```html
<head>
  ...
  <link rel="stylesheet" href="./assets/css/style.css">
  <!-- IMPORTA CSS MANUAL -->
</head>
```

### DESPUÉS (Moderno)
```html
<head>
  ...
  <link rel="stylesheet" href="./assets/css/tw.build.css">
  <!-- MISMO CSS QUE index.html ✅ -->
</head>
```

**Cambios adicionales:**
- Cambiar clases manualmente (pero es tedioso)
- O: Generar nuevas clases Tailwind para los estilos que no existan

---

## 🔧 CAMBIOS EN script.js

### AGREGAR (Consolidar funciones)

```javascript
'use strict';

/**
 * Toggle Sidebar (expandir/colapsar)
 */
const toggleSidebar = function() {
  const sidebar = document.querySelector('[data-sidebar]');
  if (!sidebar) return;
  
  const isExpanded = sidebar.classList.contains('expanded');
  
  if (window.innerWidth >= 960) {
    sidebar.classList.toggle('expanded');
  } else {
    sidebar.classList.toggle('mobile-open');
  }
}

/**
 * Toggle Chat (mostrar/ocultar panel de chat)
 */
const toggleChat = function() {
  const chat = document.querySelector('[data-chat]');
  if (!chat) return;
  
  const open = chat.classList.contains('translate-x-0');
  chat.classList.toggle('translate-x-0', !open);
  chat.classList.toggle('translate-x-full', open);
}

/**
 * Toast notification
 */
let toastTimeout;
const toast = function(msg) {
  const t = document.querySelector('[data-toast]');
  if (!t) return;
  
  t.textContent = msg;
  t.style.opacity = '1';
  clearTimeout(toastTimeout);
  toastTimeout = setTimeout(() => t.style.opacity = '0', 1200);
}

/**
 * Initialize on page load
 */
window.addEventListener('DOMContentLoaded', () => {
  const sidebar = document.querySelector('[data-sidebar]');
  if (sidebar && window.innerWidth >= 960) {
    sidebar.classList.remove('expanded');
  }
  
  // Agregar event listeners aquí
  const sidebarToggle = document.querySelector('[data-sidebar-toggle]');
  if (sidebarToggle) {
    sidebarToggle.addEventListener('click', toggleSidebar);
  }
  
  const chatToggle = document.querySelector('[data-chat-toggle]');
  if (chatToggle) {
    chatToggle.addEventListener('click', toggleChat);
  }
});

// Resto del código de script.js (navbar, etc.) aquí...
```

---

## 🏷️ CAMBIOS EN DATA ATTRIBUTES

### ANTES (Usando IDs)
```html
<aside id="sidebar">...</aside>
<button id="sidebarToggle" onclick="toggleSidebar()">
<div id="chat">...</div>
<div id="mainContent">...</div>
```

### DESPUÉS (Usando data-*)
```html
<aside data-sidebar>...</aside>
<button data-sidebar-toggle>
<div data-chat>...</div>
<div data-main-content>...</div>
```

**Ventajas:**
- Separar datos de estilos (id para IDs, data para funcionalidad)
- Más semántico
- Fácil cambiar visualmente sin romper JavaScript

---

## 📋 CAMBIOS EN package.json

### ANTES (Incorrecto)
```json
{
  "name": "magic-kids-site",
  "main": "index.js",
  "description": "<div align=\"center\">",
  "version": "0.1.0",
  "author": "",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "optimize": "node scripts/optimize-images.js"
  }
}
```

### DESPUÉS (Correcto)
```json
{
  "name": "magic-kids-site",
  "version": "1.0.0",
  "description": "Plataforma de entretenimiento infantil con anime, gaming y shows en vivo",
  "type": "module",
  "author": "Magic Kids Team",
  "license": "ISC",
  "scripts": {
    "build:css": "tailwindcss -c tailwind.config.js -i assets/css/tw.css -o assets/css/tw.build.css --minify",
    "optimize": "node scripts/optimize-images.js"
  },
  "devDependencies": {
    "tailwindcss": "^3.4.14",
    "sharp": "^0.34.5"
  },
  "dependencies": {
    "detect-libc": "^2.1.2",
    "semver": "^7.7.3"
  }
}
```

---

## 📋 CAMBIOS EN README.md

### ANTES (Obsoleto)
```markdown
<h2 align="center">Unigine - eSports Gaming Website</h2>

Unigine is a fully responsive esports gaming website...

<a href="https://codewithsadee.github.io/unigine/">
```

### DESPUÉS (Correcto)
```markdown
<h2 align="center">Magic Kids — Plataforma de Entretenimiento Infantil</h2>

Magic Kids es una plataforma de entretenimiento para niños con anime, 
videojuegos, shows en vivo y mucho más. Construida con HTML, CSS (Tailwind) 
y JavaScript puro.

### Features
- ✅ Sidebar navegable
- ✅ Sección de horarios
- ✅ Chat en vivo (demo)
- ✅ Responsive design
- ✅ Accesible (ARIA)

### Setup
1. Clone el repo
2. npm install
3. npm run build:css (para compilar Tailwind)
4. Abrir index.html en navegador

### Estructura
- index.html — Portada principal
- horarios.html — Grilla de programación
- assets/css/ — Estilos (Tailwind)
- assets/js/ — JavaScript
```

---

## ✅ CHECKLIST DE VALIDACIÓN RÁPIDA

Después de cada cambio, verificar:

```
PASO 1: Unificar CSS
[ ] horarios.html apunta a tw.build.css
[ ] Los colores se ven iguales en las 3 páginas
[ ] Sin colores rotos
[ ] tw.build.css recompilado

PASO 2: Unificar JavaScript  
[ ] Sidebar funciona en index.html
[ ] Navbar funciona en horarios.html
[ ] Chat funciona en index.html
[ ] Botones toast muestran mensajes
[ ] Sin console errors

PASO 3: Actualizar metadata
[ ] Favicon aparece en index.html
[ ] Favicon aparece en magickids_twitch_demo.html
[ ] Meta descriptions correctas
[ ] Title tags consistentes

PASO 4: Limpiar y validar
[ ] Sin CSS duplicado
[ ] Sin JS inline
[ ] HTML válido (W3C)
[ ] README actualizado
[ ] package.json correcto
```

---

## 🐛 DEBUGGING RÁPIDO

### "Los colores no coinciden"
```
1. Ver color real en DevTools (Inspector)
2. Comparar con tailwind.config.js
3. Si no es igual: actualizar config
4. Recompilar: npm run build:css
```

### "El JavaScript no funciona"
```
1. Abrir DevTools → Console
2. ¿Hay errores? Buscar en script.js
3. ¿El elemento existe? Verificar data-* attribute
4. ¿El evento se dispara? Agregar console.log()
```

### "El CSS se ve diferente en una página"
```
1. ¿Importa style.css o tw.build.css?
2. Si importa style.css → cambiar a tw.build.css
3. Recompilar Tailwind
4. Limpiar caché del navegador (Ctrl+Shift+Del)
```

---

## 🚀 COMANDOS ÚTILES

### Compilar Tailwind CSS
```powershell
npm run build:css
```

### Validar HTML
```powershell
# Copiar HTML a https://validator.w3.org/
# O usar curl si tienes validador local
```

### Ver colores en DevTools
```javascript
// En console:
getComputedStyle(document.querySelector('.shell')).backgroundColor
```

---

## 📍 DÓNDE ENCONTRAR COSAS

| Qué | Dónde |
|-----|-------|
| Colores Tailwind | `tailwind.config.js` line 19-25 |
| Colores CSS Manual | `assets/css/style.css` line 22-40 |
| CSS inline | `index.html` line 13-74 |
| JS inline | `index.html` line 480-510 |
| Fonts importadas | Todas las páginas `<head>` |
| Favicon | falta en index.html, OK en horarios.html |
| Meta description | falta en index.html, OK en horarios.html |
| script.js | `assets/js/script.js` |
| Configuración | `tailwind.config.js`, `package.json` |

---

## 💡 TIPS RÁPIDOS

1. **Antes de cambiar**: Hacer backup
2. **Después de cambiar**: Recompilar Tailwind (`npm run build:css`)
3. **Al validar**: Probar en mobile + desktop
4. **Si algo se rompe**: Verificar console.log en DevTools
5. **Para colores**: Usar ColorPick eyedropper en DevTools

---

## 📞 REFERENCIA A DOCUMENTOS COMPLETOS

- **Análisis detallado**: [ANALISIS-DISPARIDADES.md](ANALISIS-DISPARIDADES.md)
- **Plan paso a paso**: [PLAN-ACCION.md](PLAN-ACCION.md)
- **Diagramas visuales**: [ARQUITECTURA.md](ARQUITECTURA.md)
- **Resumen ejecutivo**: [RESUMEN-EJECUTIVO.md](RESUMEN-EJECUTIVO.md)

---

**Última actualización:** 26-12-2025  
**Versión:** 1.0  
**Estado:** Listo para implementar
