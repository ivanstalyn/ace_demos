## ACE Demo DFDL — Ejemplo de DFDL en IBM App Connect Enterprise

Proyecto de ejemplo que muestra el uso de esquemas DFDL (XSD/DFDL) en ACE para parsear y serializar mensajes binarios o planos estructurados.

Resumen
-------
Incluye esquemas DFDL organizados por tipo/transacción, descriptor de librería y recursos de proyecto para importar en el Toolkit.

Requisitos
----------
- IBM App Connect Enterprise (Toolkit y/o Runtime) instalado.
- Conocimientos básicos de DFDL/XSD.
- (Opcional) Java/Node.js para scripts auxiliares.

Estructura relevante
--------------------
- `dfdls/` — Carpetas con XSD/DFDL:
  - `Common/` — Tipos y formatos reutilizables.
  - `Transacciones/` — Schemas por transacción (ej. `cliente_consulta_solicitud.xsd`).
  - `REQUEST/` y `RESPONSE/` — Esquemas por dirección.
  - `Cabecera/` — Esquemas de cabecera.
- `library.descriptor` — Descriptor de la librería ACE.
- `.project`, `.settings/` — Metadatos del Toolkit.

Cómo importar y usar (Toolkit)
-----------------------------
1. Abre IBM Integration Toolkit.
2. Importa o copia el proyecto `ace_demo_dfdl` en tu workspace.
3. Asegura que los XSD/DFDL están disponibles en la librería y referenciados por los flows que los consumen.
4. Implementa flows que usen DFDL parser/serializer para convertir datos binarios a árboles de mensaje y viceversa.

Construir y desplegar
---------------------
- Desde el Toolkit exporta un `.bar` o la librería y despliega en tu Integration Server.
- Si usas la CLI de ACE (mqsicreatebar/mqsipackagebar), ajusta rutas y parámetros según tu instalación.

Pruebas rápidas
---------------
1. Prepara un archivo de muestra binario/plan o una muestra en texto plano acorde al XSD.
2. Usa el flow de prueba para inyectar el mensaje en el Integration Server (ej. a través de un input node o REST wrapper).
3. Verifica que el parser DFDL produce la estructura esperada y que los mapeos generan la respuesta correcta.

Ejemplo de creación de .bar (CLI, adapatalo a tu entorno):

```bash
mqsicreatebar -data /ruta/al/workspace -b ace_demo_dfdl.bar -a ace_demo_dfdl
# luego deploy con mqsipackagebar / mqsicapackagebar o las herramientas administrativas de tu versión
```

Notas
-----
- Ajusta los parámetros DFDL (encoding, separators, longFieldLengths, etc.) según el formato real.
- Revisa los ejemplos en `dfdls/` para comprender la estructura esperada de entrada/salida.

Licencia
--------
Uso educativo y de ejemplo.

Contacto
-------
Abre un issue en el repositorio para preguntas o mejoras.
