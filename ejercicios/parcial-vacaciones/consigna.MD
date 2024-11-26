# Vacaciones

¡Ah! ¡Qué lindo es estar de vacaciones! Bueno, mientras viajamos mentalmente, nos pidieron modelar e implementar los siguientes requerimientos utilizando los conceptos del paradigma de objetos.

## Punto 1: Lugares (3 puntos)

Existen diferentes tipos de lugares:

- **Ciudades**:
  - Tienen una cierta cantidad de habitantes.
  - Atracciones turísticas (ej: "Obelisco", "Cabildo", "Rosedal", "Caminito").
  - Sabemos la cantidad de decibeles promedio que tiene.

- **Pueblos**:
  - Nos interesa la extensión en km².
  - Cuándo se fundó.
  - En qué provincia se ubica.

- **Balnearios**:
  - Conocemos los metros de playa promedio que tienen.
  - Si el mar es peligroso.
  - Si tiene peatonal.

Queremos saber qué lugares son divertidos. Para todos los lugares, esto se da si tiene una cantidad par de letras. Además:

- Para las ciudades:
  - Si tienen más de 3 atracciones turísticas.
  - Más de 100.000 habitantes.

- En el caso de los pueblos:
  - Si se fundaron antes de 1800.
  - O si son del Litoral ("Entre Ríos", "Corrientes" o "Misiones").

- En el caso de los balnearios:
  - Si tiene más de 300 metros de playa.
  - Si el mar es peligroso.

## Punto 2: Personas (4 puntos)

Las personas tienen preferencias para irse de vacaciones:

- Algunos quieren tranquilidad, entonces el lugar al que se van debe ser tranquilo:
  - Para una ciudad esto significa que tenga menos de 20 decibeles.
  - Para un pueblo que esté en la provincia de La Pampa.
  - Para un balneario que no tenga peatonal.

- Otros quieren diversión, así que el lugar al que se van debe ser divertido.
- Están los que quieren irse a lugares raros: son aquellos cuyo nombre tiene más de 10 letras (por ejemplo "Saldungaray").
- Y por último aquellos que combinan varios criterios (con que alguno de los criterios acepte entonces decide ir a ese lugar).

Nos interesa que una persona pueda cambiar su preferencia en forma simple, así como agregar nuevas preferencias a futuro.

Queremos saber si una persona se iría de vacaciones a un lugar en base a su preferencia.

## Punto 3: Tour (4 puntos)

Queremos establecer el siguiente flujo para un tour:

1. Inicialmente definimos una fecha de salida, la cantidad de personas requerida, una lista de lugares a recorrer y el monto a pagar por persona.
2. Luego agregamos a una persona, para lo cual:
   - El monto a pagar debe ser adecuado para la persona: cada persona define un presupuesto máximo para irse de vacaciones.
   - Todos los lugares deben ser adecuados para la persona, según lo definido en el punto anterior.
   - En caso contrario, la persona no puede incorporarse al tour.
3. Cuando llegamos a la cantidad de personas requerida, el tour se confirma y no se permite incorporar más gente, a menos de que alguna persona se quiera bajar (ud. debe implementar la forma de lograr esto).

## Punto 4: Reportes (3 puntos)

Queremos saber:

- Qué tours están pendientes de confirmación: son los que tienen menos cantidad de personas anotadas de las que el tour requiere.
- Cuál es el total de los tours que salen este año, considerando el monto por persona * la cantidad de personas.

Se considerará explícitamente la delegación y la implementación de soluciones declarativas.
