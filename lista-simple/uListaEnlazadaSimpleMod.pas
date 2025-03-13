unit uListaEnlazadaSimpleMod;

interface

uses
    SysUtils;

const
    {6.1 Definir las constantes para el rango de valores}
    MIN_RANGE = 0;    // Valor mínimo del rango
    MAX_RANGE = 32767;  // Valor máximo del rango
    RANGE_SIZE = MAX_RANGE - MIN_RANGE + 1;  // Tamaño del array de frecuencias

type
    {6.2 Definir el tipo de array estático para las frecuencias}
    tFrecuencias = array[0..RANGE_SIZE-1] of Integer;

    {6.3 Modificar la estructura de la lista para incluir el array}
    tListaSimpleMod = record
        first, last: ^nodo;     // Punteros al primer y último nodo de la lista
        frequency: tFrecuencias; // Array estático para contar la frecuencia de cada número
    end;

    nodo = record
        info: Integer;  // Información almacenada en el nodo
        sig: ^nodo;     // Puntero al siguiente nodo
    end;

    {Operaciones básicas}
    procedure initialize(var list: tListaSimpleMod);
    function is_empty(list: tListaSimpleMod): boolean;
    function first(list: tListaSimpleMod): integer;
    function last(list: tListaSimpleMod): integer;
    procedure insert_at_end(var list: tListaSimpleMod; x: integer);
    procedure insert_at_begin(var list: tListaSimpleMod; x: integer);
    procedure delete_at_end(var list: tListaSimpleMod);
    procedure delete_at_begin(var list: tListaSimpleMod);
    procedure delete(var list: tListaSimpleMod; x: integer);
    function in_list(list: tListaSimpleMod; x: integer): boolean;
    function rec_in_list(list: tListaSimpleMod; x: integer): boolean;

    {Otras operaciones}
    function to_string(list: tListaSimpleMod): string;
    procedure clear(var list: tListaSimpleMod);
    function num_elems(list: tListaSimpleMod): integer;
    procedure copy(list: tListaSimpleMod; var c2: tListaSimpleMod);
    
    {Nuevas operaciones}
    function get_frequency(list: tListaSimpleMod; x: integer): integer;
    function is_in_range(x: integer): boolean;
    function frequency_to_string(list: tListaSimpleMod): string;

implementation

    {6.4 Modificar la inicialización para inicializar el array estático}
    procedure initialize(var list: tListaSimpleMod);
    var
        i: Integer;
    begin
        list.first := nil; // Inicializa la lista vacía
        list.last := nil; // Inicializa la lista vacía
        
        // Inicializar todas las frecuencias a 0
        for i := 0 to RANGE_SIZE-1 do
            list.frequency[i] := 0;
    end;

    function is_empty(list: tListaSimpleMod): boolean;
    begin
        is_empty := list.first = nil; // Verifica si la lista está vacía
    end;

    function first(list: tListaSimpleMod): integer;
    begin
        if not is_empty(list) then
            first := list.first^.info // Devuelve el primer elemento de la lista
    end;

    function last(list: tListaSimpleMod): integer;
    begin
        if not is_empty(list) then
            last := list.last^.info // Devuelve el último elemento de la lista
    end;

    {6.5 Función para verificar si un valor está dentro del rango}
    function is_in_range(x: integer): boolean;
    begin
        is_in_range := (x >= MIN_RANGE) and (x <= MAX_RANGE);
    end;

    {6.6 Modificar la inserción para actualizar el array de frecuencias}
    procedure insert_at_end(var list: tListaSimpleMod; x: integer);
    var
        newNode: ^nodo;
    begin
        if is_in_range(x) then
        begin
            // Incrementar la frecuencia del número
            Inc(list.frequency[x - MIN_RANGE]);
            
            new(newNode); // Crea un nuevo nodo
            newNode^.info := x; // Asigna el valor al nuevo nodo
            newNode^.sig := nil; // El siguiente nodo es nil porque es el último
            if is_empty(list) then
                list.first := newNode // Si la lista está vacía, el nuevo nodo es el primero
            else
                list.last^.sig := newNode; // Si no, se enlaza al final de la lista
            list.last := newNode; // Actualiza el último nodo de la lista
        end
    end;

    {6.7 Modificar insert_at_begin para actualizar el array de frecuencias}
    procedure insert_at_begin(var list: tListaSimpleMod; x: integer);
    var
        newNode: ^nodo;
    begin
        if is_in_range(x) then
        begin
            // Incrementar la frecuencia del número
            Inc(list.frequency[x - MIN_RANGE]);
            
            new(newNode); // Crea un nuevo nodo
            newNode^.info := x; // Asigna el valor al nuevo nodo
            newNode^.sig := list.first; // El siguiente nodo es el actual primer nodo
            list.first := newNode; // El nuevo nodo es ahora el primer nodo
            if list.last = nil then
                list.last := newNode; // Si la lista estaba vacía, el nuevo nodo es también el último
        end
    end;

    {6.8 Modificar delete_at_end para actualizar el array de frecuencias}
    procedure delete_at_end(var list: tListaSimpleMod);
    var
        current, prev: ^nodo;
        value: Integer;
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
            
            value := current^.info;
            // Decrementar la frecuencia del número si está en el rango
            if is_in_range(value) then
                Dec(list.frequency[value - MIN_RANGE]);
                
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

    {6.9 Modificar delete_at_begin para actualizar el array de frecuencias}
    procedure delete_at_begin(var list: tListaSimpleMod);
    var
        temp: ^nodo;
        value: Integer;
    begin
        if not is_empty(list) then
        begin
            value := list.first^.info;
            // Decrementar la frecuencia del número si está en el rango
            if is_in_range(value) then
                Dec(list.frequency[value - MIN_RANGE]);
                
            temp := list.first; // Guarda el primer nodo
            list.first := list.first^.sig; // El segundo nodo es ahora el primero
            dispose(temp); // Libera el nodo
            if list.first = nil then
                list.last := nil; // Si la lista está vacía, actualiza el último nodo
        end;
    end;

    {6.10 Modificar delete para actualizar el array de frecuencias}
    procedure delete(var list: tListaSimpleMod; x: integer);
    var
        current, prev: ^nodo;
    begin
        if is_in_range(x) and (list.frequency[x - MIN_RANGE] > 0) then
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
                // Decrementar la frecuencia del número
                Dec(list.frequency[x - MIN_RANGE]);
                
                if prev = nil then // Si el nodo a eliminar es el primero
                    list.first := current^.sig
                else // Si el nodo a eliminar no es el primero
                    prev^.sig := current^.sig;
                if current = list.last then // Si el nodo a eliminar es el último
                    list.last := prev;
                dispose(current); // Libera el nodo
            end;
        end;
    end;

    {6.11 Modificar in_list para usar el array de frecuencias (O(1))}
    function in_list(list: tListaSimpleMod; x: integer): boolean;
    begin
        if is_in_range(x) then
            in_list := list.frequency[x - MIN_RANGE] > 0
        else
            in_list := false;
    end;

    {6.12 Función para obtener la frecuencia de un número}
    function get_frequency(list: tListaSimpleMod; x: integer): integer;
    begin
        if is_in_range(x) then
            get_frequency := list.frequency[x - MIN_RANGE]
        else
            get_frequency := 0;
    end;

    function rec_in_list_helper(current: nodo; x: integer): boolean;
    begin
        if @current = nil then
            rec_in_list_helper := false // No se encontró el elemento
        else if current.info = x then  // Se encontró el elemento
            rec_in_list_helper := true
        else
            rec_in_list_helper := rec_in_list_helper(current.sig^, x);
    end;

    {6.13 La función recursiva no se modifica para mostrar la diferencia con la versión O(1)}
    function rec_in_list(list: tListaSimpleMod; x: integer): boolean;
    begin
        rec_in_list := rec_in_list_helper(list.first^, x);
    end;



    function to_string(list: tListaSimpleMod): string;
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

    {6.14 Función para mostrar las frecuencias}
    function frequency_to_string(list: tListaSimpleMod): string;
    var
        i: Integer;
        str: string;
    begin
        str := 'Frecuencias: ';
        for i := 0 to RANGE_SIZE-1 do
        begin
            if list.frequency[i] > 0 then
                str := str + '[' + IntToStr(i + MIN_RANGE) + ': ' + IntToStr(list.frequency[i]) + '] ';
        end;
        frequency_to_string := str;
    end;

    {6.15 Modificar clear para resetear también el array de frecuencias}
    procedure clear(var list: tListaSimpleMod);
    var
        temp: ^nodo;
        i: Integer;
    begin
        while list.first <> nil do
        begin
            temp := list.first;
            list.first := list.first^.sig;
            dispose(temp); // Libera cada nodo
        end;
        list.last := nil; // La lista está vacía
        
        // Resetear todas las frecuencias a 0
        for i := 0 to RANGE_SIZE-1 do
            list.frequency[i] := 0;
    end;

    function num_elems(list: tListaSimpleMod): integer;
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

    {6.16 Modificar copy para copiar también el array de frecuencias}
    procedure copy(list: tListaSimpleMod; var c2: tListaSimpleMod);
    var
        current: ^nodo;
        temp: ^nodo;
        i: Integer;
    begin
        // Inicializa la lista de destino
        initialize(c2);
        
        // Copiar el array de frecuencias
        for i := 0 to RANGE_SIZE-1 do
            c2.frequency[i] := list.frequency[i];
        
        current := list.first;
        while current <> nil do
        begin
            // Creamos los nodos sin alterar el contador de frecuencias
            new(temp);
            temp^.info := current^.info;
            temp^.sig := nil;
            
            if c2.first = nil then
                c2.first := temp
            else
                c2.last^.sig := temp;
            c2.last := temp;
            
            current := current^.sig;
        end;
    end;

end.