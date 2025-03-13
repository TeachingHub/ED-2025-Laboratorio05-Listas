program listas_ej14;

uses
  SysUtils,
  uListadeListas, 
  uListaEnlazadaDoble;

var
  listaDeListas: tListaDeListas;
  listaFacturasPersona: tListaDoble;
  personaPrueba: string;
  facturaPersona: integer;

procedure mostrarResultadoBoolean(funcion: string; resultado: boolean);
begin
  if resultado then
    Writeln(funcion + ': Correcto')
  else
    Writeln(funcion + ': Incorrecto');
end;

procedure mostrarResultadoString(funcion: string; resultado: string);
begin
  Writeln(funcion + ' : ' + resultado);
end;

procedure mostrarResultadoInteger(funcion: string; resultado: integer);
begin
  Writeln(funcion + ' : ' + IntToStr(resultado));
end;

begin
  Writeln('Prueba de la unidad uListaDeListas');
  Writeln('-----------------------------------');

  // Inicialización de la lista
  inicializar(listaDeListas);
  Writeln('Lista inicializada.');

  // Prueba de hay_facturas en lista vacía
  mostrarResultadoBoolean('hay_facturas (lista vacía)', not hay_facturas(listaDeListas));

  // Agregar personas y facturas para pruebas
    agregar_factura_a_persona(listaDeListas, 'Juan Perez', 100);
    agregar_factura_a_persona(listaDeListas, 'Juan Perez', 200);
    agregar_factura_a_persona(listaDeListas, 'Sofia Martinez', 300);
    agregar_factura_a_persona(listaDeListas, 'Sofia Martinez', 400);
    agregar_factura_a_persona(listaDeListas, 'Maria Gomez', 50);
    agregar_factura_a_persona(listaDeListas, 'Maria Gomez', 75);
      // Prueba de hay_facturas en lista no vacía
  mostrarResultadoBoolean('hay_facturas (lista no vacía)', hay_facturas(listaDeListas));

    Writeln('Personas y facturas agregadas: to_string (lista con personas y facturas)');
    Writeln(imprimir_facturas(listaDeListas));

    { ----------------------------------- }
    Writeln;
    { ----------------------------------- }


  // Prueba de hay_facturas_de_persona
  personaPrueba := 'Juan Perez';
  mostrarResultadoBoolean('hay_facturas_de_persona (' + personaPrueba + ')', hay_facturas_de_persona(listaDeListas, personaPrueba));
  personaPrueba := 'Carlos Rodriguez';
  mostrarResultadoBoolean('hay_facturas_de_persona (' + personaPrueba + ')', not hay_facturas_de_persona(listaDeListas, personaPrueba));

    { ----------------------------------- }
    Writeln;
    { ----------------------------------- }


  // Prueba de obtener_facturas_de_persona
  personaPrueba := 'Maria Gomez';
  obtener_facturas_de_persona(listaDeListas, personaPrueba, listaFacturasPersona);
  mostrarResultadoString('obtener_facturas_de_persona (' + personaPrueba + ')', to_string(listaFacturasPersona));

    { ----------------------------------- }
    Writeln;
    { ----------------------------------- }


  // Prueba de obtener_factura_de_persona
  personaPrueba := 'Juan Perez';
  facturaPersona := obtener_factura_de_persona(listaDeListas, personaPrueba);
  mostrarResultadoInteger('obtener_factura_de_persona (' + personaPrueba + ')', facturaPersona);
  mostrarResultadoBoolean('   Resultado esperado', facturaPersona = 100);
  personaPrueba := 'Maria Gomez';
  facturaPersona := obtener_factura_de_persona(listaDeListas, personaPrueba);
  mostrarResultadoInteger('obtener_factura_de_persona (' + personaPrueba + ')', facturaPersona);
  mostrarResultadoBoolean('   Resultado esperado', facturaPersona = 50);
  personaPrueba := 'Carlos Rodriguez';
  facturaPersona := obtener_factura_de_persona(listaDeListas, personaPrueba);
  mostrarResultadoInteger('obtener_factura_de_persona (' + personaPrueba + ') - persona sin facturas', facturaPersona);
  mostrarResultadoBoolean('   Resultado esperado', facturaPersona = 0);

    { ----------------------------------- }
    Writeln;
    { ----------------------------------- }


    // Prueba de pagar_factura_de_persona
    personaPrueba := 'Sofia Martinez';
    facturaPersona := obtener_factura_de_persona(listaDeListas, personaPrueba);
    mostrarResultadoInteger('Se va a pagar la primera factura de ' + personaPrueba, facturaPersona);
    pagar_factura_de_persona(listaDeListas, personaPrueba);
    facturaPersona := obtener_factura_de_persona(listaDeListas, personaPrueba);
    mostrarResultadoInteger('Siguiente factura a pagar de ' + personaPrueba, facturaPersona);
  mostrarResultadoBoolean('   Resultado esperado', facturaPersona = 400);

    { ----------------------------------- }
    Writeln;
    { ----------------------------------- }

    // Prueba de pagar factua de persona cuando solo tiene una factura
    personaPrueba := 'Sofia Martinez';
    facturaPersona := obtener_factura_de_persona(listaDeListas, personaPrueba);
    mostrarResultadoInteger('Se va a pagar la primera factura de ' + personaPrueba, facturaPersona);
    pagar_factura_de_persona(listaDeListas, personaPrueba);
    facturaPersona := obtener_factura_de_persona(listaDeListas, personaPrueba);
    mostrarResultadoInteger('Siguiente factura a pagar de ' + personaPrueba, facturaPersona);
    mostrarResultadoBoolean('   Resultado esperado', facturaPersona = 0);

    { ----------------------------------- }
    Writeln;
    { ----------------------------------- }

    // Prueba de pagar_facturas_de_persona
    personaPrueba := 'Juan Perez';
    mostrarResultadoString('Facturas de ' + personaPrueba + ' antes de pagar', to_string(listaFacturasPersona));
    pagar_facturas_de_persona(listaDeListas, personaPrueba);
    obtener_facturas_de_persona(listaDeListas, personaPrueba, listaFacturasPersona);
    mostrarResultadoString('Facturas de ' + personaPrueba + ' después de pagar', to_string(listaFacturasPersona));
    facturaPersona := obtener_factura_de_persona(listaDeListas, personaPrueba);
    Writeln('Factura de ' + personaPrueba + ' después de pagar: ' + IntToStr(facturaPersona));
    mostrarResultadoBoolean('   Resultado esperado', facturaPersona = 0);

    { ----------------------------------- }



  Writeln('-----------------------------------');
  Writeln('Fin de la prueba de la unidad uListaDeListas');
  Readln;
end.