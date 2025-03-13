unit uListaEnlazadaDoble;

interface

uses
    SysUtils;

type
    nodo = record
        info: Integer; // Información almacenada en el nodo
        sig: ^nodo; // Puntero al siguiente nodo
        ant: ^nodo; // Puntero al nodo anterior
    end;

    tListaDoble = record
        first, last: ^nodo; // Punteros al primer y último nodo de la lista
    end;



    {Operaciones básicas}
    procedure initialize(var list: tListaDoble);
    function is_empty(list: tListaDoble): boolean;
    function first(list: tListaDoble): integer;
    function last(list: tListaDoble): integer;
    procedure insert_at_end(var list: tListaDoble; x: integer);
    procedure insert_at_begin(var list: tListaDoble; x: integer);
    procedure delete_at_end(var list: tListaDoble);
    procedure delete_at_begin(var list: tListaDoble);
    function in_list(list: tListaDoble; x: integer): boolean;

    {Otras operaciones}
    function to_string(list: tListaDoble): string;
    procedure clear(var list: tListaDoble);
    function num_elems(list: tListaDoble): integer;
    procedure copy(list: tListaDoble; var c2: tListaDoble);

implementation


    procedure initialize(var list: tListaDoble);
    begin
        list.first := nil; // Inicializa la lista vacía
        list.last := nil; // Inicializa la lista vacía
    end;

    function is_empty(list: tListaDoble): boolean;
    begin
        is_empty := list.first = nil; // Verifica si la lista está vacía
    end;

    function first(list: tListaDoble): integer;
    begin
        if not is_empty(list) then
            first := list.first^.info; // Devuelve el primer elemento de la lista
    end;

    function last(list: tListaDoble): integer;
    begin
        if not is_empty(list) then
            last := list.last^.info; // Devuelve el último elemento de la lista
    end;

    procedure insert_at_end(var list: tListaDoble; x: integer);
    var
        aux: ^nodo;
    begin
        new(aux); // Crea un nuevo nodo
        aux^.info := x; // Almacena la información
        aux^.sig := nil; // El siguiente nodo es nulo
        aux^.ant := list.last; // El nodo anterior es el último nodo de la lista
        if is_empty(list) then
            list.first := aux // Si la lista está vacía, el primer nodo es el nuevo nodo
        else
            list.last^.sig := aux; // Si no, el siguiente nodo del último nodo es el nuevo nodo
        list.last := aux; // El último nodo de la lista es el nuevo nodo
    end;

    procedure insert_at_begin(var list: tListaDoble; x: integer);
    var
        aux: ^nodo;
    begin
        new(aux); // Crea un nuevo nodo
        aux^.info := x; // Almacena la información
        aux^.sig := list.first; // El siguiente nodo es el primer nodo de la lista
        aux^.ant := nil; // El nodo anterior es nulo
        if is_empty(list) then
            list.last := aux // Si la lista está vacía, el último nodo es el nuevo nodo
        else
            list.first^.ant := aux; // Si no, el nodo anterior del primer nodo es el nuevo nodo
        list.first := aux; // El primer nodo de la lista es el nuevo nodo
    end;

    procedure delete_at_end(var list: tListaDoble);
    var
        aux: ^nodo;
    begin
        if not is_empty(list) then
        begin
            aux := list.last; // Almacena el último nodo
            list.last := aux^.ant; // El último nodo es el nodo anterior al último nodo
            if list.last <> nil then
                list.last^.sig := nil // Si el último nodo no es nulo, el siguiente nodo es nulo
            else
                list.first := nil; // Si el último nodo es nulo, el primer nodo es nulo
            dispose(aux); // Libera la memoria del nodo eliminado
        end;
    end;    


    procedure delete_at_begin(var list: tListaDoble);
    var
        aux: ^nodo;
    begin
        if not is_empty(list) then
        begin
            aux := list.first; // Almacena el primer nodo
            list.first := aux^.sig; // El primer nodo es el siguiente nodo al primer nodo
            if list.first <> nil then
                list.first^.ant := nil // Si el primer nodo no es nulo, el nodo anterior es nulo
            else
                list.last := nil; // Si el primer nodo es nulo, el último nodo es nulo
            dispose(aux); // Libera la memoria del nodo eliminado
        end;
    end;

    function in_list(list: tListaDoble; x: integer): boolean;
    var
        aux: ^nodo;
        found: boolean;
    begin
        aux := list.first; // Comienza desde el primer nodo
        found := false; // Inicializa la variable de búsqueda
        while (aux <> nil) and not found do
        begin
            if aux^.info = x then
                found := true; // Si encuentra el elemento, cambia la variable de búsqueda
            aux := aux^.sig; // Avanza al siguiente nodo
        end;
        in_list := found; // Devuelve si el elemento está en la lista
    end;

    

    { -- Otras operaciones -- }

    function to_string(list: tListaDoble): string;
    var
        aux: ^nodo;
        s: string;
    begin
        aux := list.first; // Comienza desde el primer nodo
        s := ''; // Inicializa la cadena
        while aux <> nil do
        begin
            s := s + IntToStr(aux^.info) + ' '; // Agrega la información del nodo a la cadena
            aux := aux^.sig; // Avanza al siguiente nodo
        end;
        to_string := s; // Devuelve la cadena
    end;

    procedure clear(var list: tListaDoble);
    begin
        while not is_empty(list) do
            delete_at_begin(list); // Elimina el primer nodo de la lista
    end;

    function num_elems(list: tListaDoble): integer;
    var
        aux: ^nodo;
        count: integer;
    begin
        aux := list.first; // Comienza desde el primer nodo
        count := 0; // Inicializa el contador
        while aux <> nil do
        begin
            count := count + 1; // Incrementa el contador
            aux := aux^.sig; // Avanza al siguiente nodo
        end;
        num_elems := count; // Devuelve el número de elementos en la lista
    end;

    procedure copy(list: tListaDoble; var c2: tListaDoble);
    var
        aux: ^nodo;
        aux2: ^nodo;
    begin
        initialize(c2); // Inicializa la lista de destino
        aux := list.first; // Comienza desde el primer nodo
        while aux <> nil do
        begin
            new(aux2); // Crea un nuevo nodo
            aux2^.info := aux^.info; // Copia la información
            aux2^.sig := nil; // El siguiente nodo es nulo
            aux2^.ant := c2.last; // El nodo anterior es el último nodo de la lista de destino
            if is_empty(c2) then
                c2.first := aux2 // Si la lista de destino está vacía, el primer nodo es el nuevo nodo
            else
                c2.last^.sig := aux2; // Si no, el siguiente nodo del último nodo es el nuevo nodo
            c2.last := aux2; // El último nodo de la lista de destino es el nuevo nodo
            aux := aux^.sig; // Avanza al siguiente nodo
        end;
    end;

end.