unit uListaEnlazadaSimpleSetAt;

interface

uses
    SysUtils;

type
    nodo = record
        info: Integer; // Información almacenada en el nodo
        sig: ^nodo; // Puntero al siguiente nodo
    end;

    tListaSimple = record
        first, last: ^nodo; // Punteros al primer y último nodo de la lista
    end;

    {Operaciones básicas}
    procedure initialize(var list: tListaSimple);
    function is_empty(list: tListaSimple): boolean;
    function first(list: tListaSimple): integer;
    function last(list: tListaSimple): integer;
    procedure insert_at_end(var list: tListaSimple; x: integer);
    procedure insert_at_begin(var list: tListaSimple; x: integer);
    procedure delete_at_end(var list: tListaSimple);
    procedure delete_at_begin(var list: tListaSimple);
    procedure delete(var list: tListaSimple; x: integer);
    function in_list(list: tListaSimple; x: integer): boolean;
    function rec_in_list(list: tListaSimple; x: integer): boolean;

    {Otras operaciones}
    function to_string(list: tListaSimple): string;
    procedure clear(var list: tListaSimple);
    function num_elems(list: tListaSimple): integer;
    procedure copy(list: tListaSimple; var c2: tListaSimple);
    procedure set_at(var list: tListaSimple; pos: integer; x: integer);

implementation

    procedure initialize(var list: tListaSimple);
    begin
        list.first := nil; // Inicializa la lista vacía
        list.last := nil; // Inicializa la lista vacía
    end;

    function is_empty(list: tListaSimple): boolean;
    begin
        is_empty := list.first = nil; // Verifica si la lista está vacía
    end;

    function first(list: tListaSimple): integer;
    begin
        if not is_empty(list) then
            first := list.first^.info; // Devuelve el primer elemento de la lista
    end;

    function last(list: tListaSimple): integer;
    begin
        if not is_empty(list) then
            last := list.last^.info; // Devuelve el último elemento de la lista
    end;

    procedure insert_at_end(var list: tListaSimple; x: integer);
    var
        newNode: ^nodo;
    begin
        new(newNode); // Crea un nuevo nodo
        newNode^.info := x; // Asigna el valor al nuevo nodo
        newNode^.sig := nil; // El siguiente nodo es nil porque es el último
        if is_empty(list) then
            list.first := newNode // Si la lista está vacía, el nuevo nodo es el primero
        else
            list.last^.sig := newNode; // Si no, se enlaza al final de la lista
        list.last := newNode; // Actualiza el último nodo de la lista
    end;

    procedure insert_at_begin(var list: tListaSimple; x: integer);
    var
        newNode: ^nodo;
    begin
        new(newNode); // Crea un nuevo nodo
        newNode^.info := x; // Asigna el valor al nuevo nodo
        newNode^.sig := list.first; // El siguiente nodo es el actual primer nodo
        list.first := newNode; // El nuevo nodo es ahora el primer nodo
        if list.last = nil then
            list.last := newNode; // Si la lista estaba vacía, el nuevo nodo es también el último
    end;

    procedure delete_at_end(var list: tListaSimple);
    var
        current, prev: ^nodo;
    begin
        if not is_empty(list) then
        begin
            current := list.first;
            prev := nil;
            while current^.sig <> nil do
            begin
                prev := current;
                current := current^.sig;
            end;
            if prev = nil then // Solo hay un elemento en la lista
            begin
                dispose(list.first); // Libera el nodo
                list.first := nil;
                list.last := nil;
            end
            else // Hay más de un elemento en la lista
            begin
                dispose(current); // Libera el nodo
                prev^.sig := nil; // El penúltimo nodo es ahora el último
                list.last := prev; // Actualiza el último nodo de la lista
            end;
        end;
    end;

    procedure delete_at_begin(var list: tListaSimple);
    var
        temp: ^nodo;
    begin
        if not is_empty(list) then
        begin
            temp := list.first; // Guarda el primer nodo
            list.first := list.first^.sig; // El segundo nodo es ahora el primero
            dispose(temp); // Libera el nodo
            if list.first = nil then
                list.last := nil; // Si la lista está vacía, actualiza el último nodo
        end;
    end;

    procedure delete(var list: tListaSimple; x: integer);
    var
        current, prev: ^nodo;
    begin
        current := list.first;
        prev := nil;
        while (current <> nil) and (current^.info <> x) do // Buscar el nodo a eliminar
        begin
            prev := current;
            current := current^.sig;
        end;
        if current <> nil then // Si se encontró el nodo
        begin
            if prev = nil then // Si el nodo a eliminar es el primero
                list.first := current^.sig
            else // Si el nodo a eliminar no es el primero
                prev^.sig := current^.sig;
            if current = list.last then // Si el nodo a eliminar es el último
                list.last := prev;
            dispose(current); // Libera el nodo
        end;
    end;

    function in_list(list: tListaSimple; x: integer): boolean;
    var
        current: ^nodo;
    begin
        current := list.first;
        while (current <> nil) and (current^.info <> x) do
            current := current^.sig;
        in_list := current <> nil; // Devuelve true si se encontró el elemento
    end;

    function rec_in_list(list: tListaSimple; x: integer): boolean;
    var
        resto : tListaSimple;
    begin
        if list.first = nil then
            rec_in_list := false // No se encontró el elemento
        else if list.first^.info = x then  // Se encontró el elemento
            rec_in_list := true
        else
        begin
            resto := list;
            resto.first := list.first^.sig;
            rec_in_list := rec_in_list(resto, x); // Llamada recursiva con el resto de la lista
        end;
    end;

    function to_string(list: tListaSimple): string;
    var
        current: ^nodo;
        str: string;
    begin
        str := '';
        current := list.first;
        while current <> nil do
        begin
            str := str + IntToStr(current^.info) + ' '; // Concatenar el valor del nodo a la cadena
            current := current^.sig;
        end;
        to_string := str; // Devuelve la representación en cadena de la lista
    end;

    procedure clear(var list: tListaSimple);
    var
        temp: ^nodo;
    begin
        while list.first <> nil do
        begin
            temp := list.first;
            list.first := list.first^.sig;
            dispose(temp); // Libera cada nodo
        end;
        list.last := nil; // La lista está vacía
    end;

    function num_elems(list: tListaSimple): integer;
    var
        current: ^nodo;
        count: integer;
    begin
        count := 0;
        current := list.first;
        while current <> nil do
        begin
            inc(count); // Incrementa el contador por cada nodo
            current := current^.sig;
        end;
        num_elems := count; // Devuelve el número de elementos en la lista
    end;

    procedure copy(list: tListaSimple; var c2: tListaSimple);
    var
        current: ^nodo;
    begin
        initialize(c2); // Inicializa la lista de destino
        current := list.first;
        while current <> nil do
        begin
            insert_at_end(c2, current^.info); // Inserta cada elemento en la lista de destino
            current := current^.sig;
        end;
    end;

    { Ejercicio 3 }
    procedure set_at(var list: tListaSimple; pos: integer; x: integer);
    var
        current: ^nodo;
        i: integer;
    begin
        if pos > 0 then 
        begin
            current := list.first;
            i := 1;
            while (current <> nil) and (i < pos) do
            begin
                current := current^.sig;
                inc(i);
            end;
            if current <> nil then
                current^.info := x;
        end;
    end;

end.
