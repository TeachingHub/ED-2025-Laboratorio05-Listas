program listas_ej2;

uses uListaEnlazadaSimple;

var
    lista, lista2: tListaSimple;
    primerElemento, ultimoElemento, diferencia: integer;

begin
    // 2.1 Inicializar lista
    initialize(lista);

    // 2.2 Insertar elementos al final y mostrar lista
    insert_at_end(lista, 1);
    insert_at_end(lista, 2);
    insert_at_end(lista, 3);
    insert_at_end(lista, 4);
    insert_at_end(lista, 5);
    writeln(to_string(lista));

    // 2.3 Obtener primer y último elemento, calcular diferencia
    primerElemento := first(lista);
    writeln('Primer elemento: ', primerElemento);
    ultimoElemento := last(lista);
    writeln('Último elemento: ', ultimoElemento);
    diferencia := primerElemento - ultimoElemento;
    writeln('Diferencia: ', diferencia);

    // 2.4 Número de elementos, eliminar al inicio, limpiar lista
    writeln('Número de elementos de la lista: ', num_elems(lista));
    delete_at_begin(lista);
    writeln(to_string(lista));
    writeln('Número de elementos de la lista: ', num_elems(lista));
    clear(lista);
    writeln(to_string(lista));
    writeln('Número de elementos de la lista: ', num_elems(lista));

    // 2.5 Verificar si la lista está vacía, copiar lista, eliminar al inicio
    if is_empty(lista) then
        writeln('La lista está vacía')
    else
        writeln('La lista no está vacía');
    insert_at_end(lista, 1);
    if is_empty(lista) then
        writeln('La lista está vacía')
    else
        writeln('La lista no está vacía');
    copy(lista, lista2);
    delete_at_begin(lista2);
    writeln('Lista 1: ', to_string(lista));
    writeln('Lista 2: ', to_string(lista2));

    // 2.6 Insertar al inicio
    insert_at_begin(lista, 0);
    writeln('Después de insertar al inicio: ', to_string(lista));

    // 2.7 Eliminar al final
    delete_at_end(lista);
    writeln('Después de eliminar al final: ', to_string(lista));

    // 2.8 Eliminar un elemento específico
    insert_at_end(lista, 3);
    writeln('Lista antes de eliminar el 3: ', to_string(lista));
    delete(lista, 3);
    writeln('Lista después de eliminar el 3: ', to_string(lista));

    // 2.9 Verificar si un elemento está en la lista
    if in_list(lista, 2) then
        writeln('El 2 está en la lista')
    else
        writeln('El 2 no está en la lista');

    // 2.10 Verificar recursivamente si un elemento está en la lista
    if rec_in_list(lista, 1) then
        writeln('El 1 está en la lista (recursivo)')
    else
        writeln('El 1 no está en la lista (recursivo)');

    readln;
end.
