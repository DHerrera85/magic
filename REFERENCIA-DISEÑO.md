# 🎨 REFERENCIA DE DISEÑO - MAGIC KIDS

**Fuente de verdad para colores, fuentes y estilos**

Guardado: 26 de Diciembre, 2025

---

## 📖 HISTORIA DEL PROYECTO

```
horarios.html (ORIGINAL - CSS VANILLA)
           ↓
magickids_twitch_demo.html (DEMO por ChatGPT - Tomó elementos)
           ↓
index.html (Mi derivado - Intenté Tailwind - ❌ Error)

SOLUCIÓN: Volver a CSS vanilla usando horarios.html como referencia
```

---

## 🎨 PALETA DE COLORES

### De horarios.html (CSS Variables - FUENTE DE VERDAD)

```css
:root {
  /* BACKGROUND COLORS */
  --bg-purple: hsla(267, 100%, 63%, 1);           /* #9841FF - Violeta puro */
  --bg-purple-alpha-30: hsla(267, 100%, 63%, 0.3); /* Violeta con transparencia */
  --bg-dark-purple: hsla(279, 42%, 9%, 1);        /* #1A0D2E - Negro muy oscuro */
  --bg-oxford-blue: hsla(240, 63%, 13%, 1);       /* #0D1B3D - Azul oscuro */
  --bg-oxford-blue-alpha-95: hsla(240, 63%, 13%, 0.95);
  --bg-oxford-blue-alpha-90: hsla(240, 63%, 13%, 0.9);
  --bg-oxford-blue-alpha-80: hsla(240, 63%, 13%, 0.8);

  /* GRADIENT COLORS */
  --gradient-1: linear-gradient(to right bottom, 
    hsl(299, 100%, 52%), 
    hsl(291, 100%, 58%), 
    hsl(283, 100%, 60%), 
    hsl(273, 100%, 62%), 
    hsl(262, 100%, 63%), 
    hsl(242, 100%, 69%), 
    hsl(223, 100%, 62%), 
    hsl(210, 100%, 50%), 
    hsl(203, 100%, 50%), 
    hsl(198, 100%, 50%), 
    hsl(192, 100%, 48%), 
    hsl(185, 90%, 48%));  /* Gradiente multicolor arco iris */
    
  --gradient-2: linear-gradient(90deg, 
    transparent 0%, 
    #9841ff 50%, 
    transparent 100%);    /* Gradiente violeta horizontal */

  /* TEXT COLORS */
  --text-white: hsla(0, 0%, 100%, 1);             /* #FFFFFF */
  --text-gainsboro: hsla(0, 0%, 87%, 1);         /* #D9D9D9 - Gris claro */
  --text-champagne-pink: hsla(23, 61%, 86%, 1);  /* #F3D7C8 - Rosa pastel */
  --text-purple: hsla(267, 100%, 63%, 1);        /* #9841FF - Violeta */

  /* BORDER COLORS */
  --border-space-cadet: hsl(240, 45%, 17%);      /* #1F2B47 - Azul muy oscuro */
  --border-purple-alpha-30: hsla(267, 100%, 63%, 0.3); /* Violeta transparente */
}
```

### Colores por contexto:

```
FONDOS PRINCIPALES:
├─ Fondo oscuro: --bg-dark-purple (#1A0D2E)
├─ Fondo secundario: --bg-oxford-blue (#0D1B3D)
└─ Accento: --bg-purple (#9841FF)

TEXTO:
├─ Principal: --text-white (#FFFFFF)
├─ Secundario: --text-gainsboro (#D9D9D9)
├─ Decorativo: --text-champagne-pink (#F3D7C8)
└─ Acentos: --text-purple (#9841FF)

BORDES:
├─ Bordes oscuros: --border-space-cadet (#1F2B47)
└─ Bordes destacados: --border-purple-alpha-30 (violeta 30%)

GRADIENTES:
├─ Arco iris multicolor: --gradient-1
└─ Fondo violeta: --gradient-2
```

---

## 🔤 TIPOGRAFÍA

### Fuentes importadas:
```html
<link href="https://fonts.googleapis.com/css2?family=Oxanium:wght@400;600;700;800&family=Work+Sans:wght@600&display=swap" rel="stylesheet">
```

### Variables CSS:
```css
/* Font Family */
--fontFamily-oxanium: 'Oxanium', cursive;      /* Display/Headings */
--fontFamily-work-sans: 'Work Sans', sans-serif; /* Body/Small text */

/* Font Sizes */
--fontSize-1: 3.6rem;   /* Títulos muy grandes (h1) */
--fontSize-2: 2.4rem;   /* Títulos grandes (h2) */
--fontSize-3: 2rem;     /* Títulos (h3) */
--fontSize-4: 1.7rem;   /* Subtítulos (h4) */
--fontSize-5: 1.6rem;   /* Normal grande */
--fontSize-6: 1.5rem;   /* Normal */
--fontSize-7: 1.4rem;   /* Normal pequeño */
--fontSize-8: 1.2rem;   /* Pequeño */

/* Font Weights */
--weight-regular: 400;    /* Oxanium normal */
--weight-semiBold: 600;   /* Oxanium semi-bold */
--weight-bold: 700;       /* Oxanium bold */
```

### Uso recomendado:
```css
h1, h2 { 
  font-family: var(--fontFamily-oxanium);
  font-weight: var(--weight-bold);
}

p, body {
  font-family: var(--fontFamily-oxanium);
  font-weight: var(--weight-regular);
}

.small-text {
  font-size: var(--fontSize-7);
  font-weight: var(--weight-semiBold);
}
```

---

## 📐 ESPACIADO Y TAMAÑOS

```css
--section-spacing: 60px;  /* Espaciado entre secciones */

/* Comúnmente usado: */
/* Padding pequeño: 12px - 16px */
/* Padding medio: 24px - 32px */
/* Padding grande: 48px - 60px */
/* Gap/Margin: 8px, 12px, 16px, 24px */
```

---

## 🎨 SOMBRAS Y BORDES

```css
--shadow: 0px 2px 5px 0px hsla(0, 0%, 0%, 0.2);  /* Sombra sutil */

/* Border radius */
--radius-circle: 50%;    /* Círculos */
--radius-5: 5px;         /* Bordes redondeados pequeños */
--radius-3: 3px;         /* Bordes muy redondeados */
```

---

## 🔀 TRANSICIONES

```css
--transition-1: 250ms ease;       /* Transiciones rápidas */
--transition-2: 500ms ease;       /* Transiciones normales */
--cubic-out: cubic-bezier(0.05, 0.83, 0.52, 0.97); /* Easing personalizado */
```

---

## 🌍 FONDO DE PÁGINA

De horarios.html:
```css
body {
  background-color: var(--bg-dark-purple);      /* Color base */
  background-image: url("../images/body-bg.jpg"); /* Imagen de fondo */
  background-repeat: repeat;
}
```

De magickids_twitch_demo (alternativa moderna):
```css
background: radial-gradient(1200px 600px at 10% -10%, #2B0A6B 0%, transparent 60%),
            radial-gradient(1200px 800px at 110% 10%, #12042F 0%, transparent 60%),
            linear-gradient(120deg, #05020E 0%, #07041A 100%);
```

---

## 📱 VIEWPORT Y BREAKPOINTS

De horarios.html (basado en análisis):
```css
/* Mobile first */
/* Tablet: 768px */
/* Desktop: 1024px */
/* Large desktop: 1440px */
```

---

## ✅ ESTRUCTURA RECOMENDADA PARA CSS VANILLA

```
assets/css/
├── style.css (único archivo consolidado)
│   ├── 1. CSS Reset
│   ├── 2. Custom properties (:root)
│   ├── 3. Tipografía base
│   ├── 4. Componentes (navbar, buttons, cards, etc)
│   ├── 5. Páginas específicas (horarios, index, etc)
│   └── 6. Media queries responsive
```

---

## 🎯 CLASES SEMÁNTICAS A USAR

```html
<!-- En lugar de Tailwind: -->
<!-- ❌ <div class="flex gap-4 px-3 py-2"> -->
<!-- ✅ <nav class="navbar"> -->

Clases CSS recomendadas:

LAYOUT:
├── .container
├── .navbar
├── .sidebar
├── .header
├── .main-content
├── .footer

COMPONENTES:
├── .btn, .btn-primary, .btn-secondary
├── .card
├── .badge
├── .alert
├── .form-group
├── .input
├── .select

UTILITARIOS SIMPLES:
├── .text-center
├── .text-white
├── .bg-purple
├── .rounded
├── .shadow
├── .hidden
├── .visible
```

---

## 🔗 REFERENCIAS EN PROYECTO

### horarios.html
- Línea 22-50: CSS Variables originales
- Estructura HTML con clases semánticas
- Navbar sticky
- Sistema completo y consolidado

### magickids_twitch_demo.html
- Tomó colores/fuentes de horarios
- Agregó animaciones y efectos modernos
- (Pero usa Tailwind - a eliminar)

### index.html (ACTUAL)
- Mi derivado de magickids_twitch_demo
- Usa Tailwind puro (causa de problemas)
- A reescribir sin Tailwind

---

## 📝 NOTAS IMPORTANTES

1. **horarios.html es la referencia CSS original** - Todos los colores y variables vienen de aquí

2. **Oxanium es la tipografía principal** - Diseño retro/gaming de los 90s-2000s

3. **Paleta oscura con acentos violeta/cian** - Tema cyberpunk/gaming

4. **Los gradientes multicolor son parte del estilo** - No son accidentales

5. **El fondo tiene imagen repetida** - No es solidColor

---

## 🎨 EJEMPLO DE CONVERSIÓN

### De Tailwind (❌):
```html
<button class="px-4 py-2 bg-gradient-to-r from-purple-600 to-pink-600 rounded-2xl font-bold">
  Seguir
</button>
```

### A CSS Vanilla (✅):
```html
<button class="btn btn-primary">Seguir</button>

<style>
.btn {
  padding: 8px 16px;
  border-radius: 16px;
  font-weight: 700;
  border: none;
  cursor: pointer;
  transition: var(--transition-1);
}

.btn-primary {
  background: linear-gradient(135deg, #9841ff 0%, #ff39c8 100%);
  color: white;
  box-shadow: var(--shadow);
}

.btn-primary:hover {
  opacity: 0.9;
  transform: scale(1.05);
}
</style>
```

---

**Documento de referencia guardado:** 26-12-2025  
**Fuente primaria:** horarios.html  
**Referencia visual:** magickids_twitch_demo.html  
**Uso:** Consulta mientras refactorizas el proyecto
