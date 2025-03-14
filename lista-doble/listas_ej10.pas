program ej10_doble;

uses
    SysUtils,
    uListaEnlazadaDoble;

var
    listaDoble: tListaDoble; // Variable para la lista doblemente enlazada
    listaCopia: tListaDoble; // Variable para la copia de la lista doblemente enlazada
    elemento: integer;

begin
    // 10.1 Inicialización de la lista doblemente enlazada
    initialize(listaDoble);
    writeln('Lista doble inicializada.');

    // 10.2 Verificar si la lista está vacía
    if is_empty(listaDoble) then
        writeln('La lista doble esta vacia.')
    else
        writeln('La lista doble no esta vacia.');

    // 10.3 Insertar elementos al final de la lista
    insert_at_end(listaDoble, 10);
    insert_at_end(listaDoble, 20);
    insert_at_end(listaDoble, 30);
    writeln('Elementos 10, 20, 30 insertados al final.');
    writeln('Lista doble actual: ', to_string(listaDoble));

    // 10.4 Insertar elementos al inicio de la lista
    insert_at_begin(listaDoble, 5);
    insert_at_begin(listaDoble, 1);
    writeln('Elementos 5, 1 insertados al inicio.');
    writeln('Lista doble actual: ', to_string(listaDoble));

    // 10.5 Obtener el primer y último elemento
    if not is_empty(listaDoble) then
    begin
        writeln('Primer elemento de la lista: ', first(listaDoble));
        writeln('Ultimo elemento de la lista: ', last(listaDoble));
    end;

    // 10.6 Verificar si un elemento está en la lista
    elemento := 20;
    if in_list(listaDoble, elemento) then
        writeln(elemento, ' esta en la lista.')
    else
        writeln(elemento, ' no esta en la lista.');

    elemento := 40;
    if in_list(listaDoble, elemento) then
        writeln(elemento, ' esta en la lista.')
    else
        writeln(elemento, ' no esta en la lista.');

    // 10.7 Eliminar elementos del final de la lista
    delete_at_end(listaDoble);
    writeln('Elemento eliminado del final.');
    writeln('Lista doble actual: ', to_string(listaDoble));

    // 10.8 Eliminar elementos del inicio de la lista
    delete_at_begin(listaDoble);
    writeln('Elemento eliminado del inicio.');
    writeln('Lista doble actual: ', to_string(listaDoble));

    // 10.9 Contar el número de elementos
    writeln('Numero de elementos en la lista doble: ', num_elems(listaDoble));

    // 10.10 Copiar la lista doble
    copy(listaDoble, listaCopia);
    writeln('Lista doble copiada.');
    writeln('Lista copia: ', to_string(listaCopia));

    // 10.11 Limpiar la lista doble original
    clear(listaDoble);
    writeln('Lista doble original limpiada.');
    writeln('Lista doble original actual: ', to_string(listaDoble));

    // 10.12 Verificar si la lista original está vacía después de limpiar
    if is_empty(listaDoble) then
        writeln('La lista doble original esta vacia despues de limpiar.')
    else
        writeln('La lista doble original no esta vacia despues de limpiar.');

    // 10.13 La lista copia debe seguir existiendo
    writeln('Lista copia despues de limpiar la original: ', to_string(listaCopia));

    readln; // Pausa para ver la salida
end.
