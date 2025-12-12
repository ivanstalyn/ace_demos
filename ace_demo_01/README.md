## ACE Demo 01 — Integración REST/JSON -> tcpip socket para IBM App Connect Enterprise (ACE)

Pequeño proyecto de ejemplo que muestra un flujo REST en IBM ACE que recibe una petición JSON, aplica transformaciones (map files) y devuelve una respuesta desde un servidor tcpip por sockets.

Resumen
-------
Este demo incluye los artefactos necesarios para importar y probar un servicio REST en ACE: mapeos (`.map`), subflows, especificación OpenAPI y descriptor REST.

Requisitos
---------
- IBM App Connect Enterprise (Toolkit/Runtime) compatible con los artefactos.
- (Opcional) Docker si usa imágenes de ACE en contenedores.
- (Opcional) Node.js si vas a ejecutar herramientas auxiliares locales.

Contenido principal
------------------
- `openapi.json` — Especificación OpenAPI del servicio REST.
- `restapi.descriptor` — Descriptor del recurso REST para ACE.
- `cliente_consulta_solicitud.map`, `cliente_consulta_respuesta.map` — Mappings para el ejemplo de cliente.
- `getId.subflow` — Subflow que realiza la petición al servidor tcpserver para obtener los datos del cliente.
- `getNro.subflow` — Subflow que realiza la petición al servidor tcpserver para obtener los datos de una factura.
- `factura_consulta_solicitud.map`, `factura_consulta_respuesta.map` — Mappings para el ejemplo de factura.
- `gen/` — Recursos generados (si aplica).
- `.project` — Metadata del proyecto (Eclipse/Toolkit).

Importar en ACE (Toolkit)
-------------------------
1. Abre IBM ACE Toolkit (Integration Toolkit).
2. Crea un Integration Project nuevo o utiliza uno existente.
3. Copia los archivos listados en este repositorio dentro del Integration Project o importa el proyecto si está empaquetado.
4. Asegura que `openapi.json` y `restapi.descriptor` estén referenciados por el flujo REST.
5. Construye y despliega el proyecto (desde el Toolkit exporta un BAR o despliega directamente al Integration Server).

Generar y desplegar (línea de comandos)
--------------------------------------
Dependiendo de tu versión de ACE puedes usar las herramientas del producto para generar y desplegar un BAR desde la línea de comandos o usar las opciones del Toolkit. Alternativamente, si ejecutas ACE en contenedor, copia el BAR al contenedor y despliega con las herramientas administrativas del runtime.

Pruebas rápidas
---------------
Usa `curl` o Postman contra el endpoint definido en `openapi.json`.

Ejemplo:

```bash
curl -X POST http://localhost:7600/<ruta-del-endpoint> \
  -H "Content-Type: application/json" \
  -d '{"campo":"valor"}'
```

Notas y recomendaciones
----------------------
- Ajusta la URL, puerto y rutas según la configuración de tu Integration Server.
- Revisa los mappings y subflows antes de desplegar en producción; son ejemplos didácticos.

Licencia
--------
Uso educativo y de referencia.

Contacto
-------
Abre un issue en el repositorio para preguntas o mejoras.
