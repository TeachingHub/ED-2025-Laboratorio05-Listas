program listas_ej7;

uses uListaEnlazadaCircular;

var
    lista, lista2: tListaCircular;
    primerElemento, ultimoElemento, diferencia: integer;

begin
    // 7.1 Inicialización de la lista
    initialize(lista);
    writeln('7.1 Inicialización de la lista');
    writeln('   Estado esperado: [] ');
    writeln('   Estado actual: ', to_string(lista));
    writeln('');

    // 7.2 Inserción de elementos al final
    writeln('7.2 Inserción de elementos al final');
    insert_at_end(lista, 1);
    insert_at_end(lista, 2);
    insert_at_end(lista, 3);
    insert_at_end(lista, 4);
    insert_at_end(lista, 5);
    writeln('   Insertar en orden: 1, 2, 3, 4, 5 (siempre al final)');
    writeln('   Estado esperado: [1 2 3 4 5 ]');
    writeln('   Estado actual: ', to_string(lista));
    writeln('');

    // 7.3 Cálculo de diferencia entre primer y último elemento
    writeln('7.3 Cálculo de diferencia entre primer y último elemento');
    primerElemento := first(lista);
    writeln('   Primer elemento: ', primerElemento);
    ultimoElemento := last(lista);
    writeln('   Último elemento: ', ultimoElemento);
    diferencia := primerElemento - ultimoElemento;
    writeln('   Diferencia: primerElemento - ultimoElemento = ', diferencia);
    writeln('   Estado esperado: La lista no cambia: [1 2 3 4 5 ]');
    writeln('   Estado actual: ', to_string(lista));
    writeln('');

    // 7.4 Eliminación y limpieza
    writeln('7.4 Eliminación y limpieza');
    writeln('   Número de elementos (debe ser 5): ', num_elems(lista));
    delete(lista, first(lista)); // Eliminar el primer elemento por valor
    writeln('   Eliminar el primer elemento.');
    writeln('   Estado esperado después de eliminar: [2 3 4 5 ] (nuevo tamaño: 4)');
    writeln('   Estado actual: ', to_string(lista));
    writeln('   Nuevo número de elementos: ', num_elems(lista));
    clear(lista);
    writeln('   Limpiar la lista completamente.');
    writeln('   Estado esperado: [] (nuevo tamaño: 0)');
    writeln('   Estado actual: ', to_string(lista));
    writeln('   Nuevo número de elementos: ', num_elems(lista));
    writeln('');

    // 7.5 Copia de lista y verificación de vacío
    writeln('7.5 Copia de lista y verificación de vacío');
    writeln('   Verificar si la lista está vacía (debe ser true): ', is_empty(lista));
    insert_at_end(lista, 1);
    writeln('   Insertar 1 al final.');
    writeln('   Estado esperado: [1 ] (no vacía)');
    writeln('   Estado actual: ', to_string(lista));
    writeln('   Verificar si la lista está vacía (debe ser false): ', is_empty(lista));
    copy(lista, lista2);
    writeln('   Crear una copia de la lista (lista2).');
    delete(lista2, first(lista2)); // Eliminar el primer elemento de lista2 por valor
    writeln('   Eliminar el primer elemento de lista2.');
    writeln('   Estado esperado: ');
    writeln('     lista1: [1 ]');
    writeln('     lista2: []');
    writeln('   Estado actual:');
    writeln('     lista1: ', to_string(lista));
    writeln('     lista2: ', to_string(lista2));
    writeln('');

    // 7.6 Inserción al inicio
    writeln('7.6 Inserción al inicio');
    insert_at_begin(lista, 0);
    writeln('   Insertar 0 al inicio de lista1.');
    writeln('   Estado esperado: [0 1 ]');
    writeln('   Estado actual: ', to_string(lista));
    writeln('');

    // 7.7 Eliminación al final
    writeln('7.7 Eliminación al final');
    if not is_empty(lista) then
        delete(lista, last(lista)); // Eliminar el último elemento por valor
    writeln('   Eliminar el último elemento de lista1.');
    writeln('   Estado esperado: [0 ]');
    writeln('   Estado actual: ', to_string(lista));
    writeln('');
    delete(lista, last(lista)); // Eliminar el último elemento por valor
    writeln('   Eliminar el último elemento de lista1.');
    writeln('   Estado esperado: []');
    writeln('   Estado actual: ', to_string(lista));
    writeln('');

    // 7.8 Eliminación de elemento específico
    writeln('7.8 Eliminación de elemento específico');
    insert_at_end(lista, 3);
    writeln('   Insertar 3 al final.');
    insert_at_begin(lista, 0);
    writeln('   Insertar 0 al inicio.');
    writeln('   Estado antes de eliminar: [0 3 ]');
    writeln('   Estado actual: ', to_string(lista));
    delete(lista, 3);
    writeln('   Eliminar el elemento 3.');
    writeln('   Estado esperado: [0 ]');
    writeln('   Estado actual: ', to_string(lista));
    writeln('');

    // 7.9 Búsqueda de elemento (iterativa)
    writeln('7.9 Búsqueda de elemento (iterativa)');
    writeln('   Verificar si el elemento 2 está en la lista.');
    writeln('   Resultado esperado: El 2 está en la lista');
    if in_list(lista, 2) then
        writeln('   Resultado actual: El 2 está en la lista')
    else
        writeln('   Resultado actual: El 2 no está en la lista');
    writeln('');


    readln;
end.