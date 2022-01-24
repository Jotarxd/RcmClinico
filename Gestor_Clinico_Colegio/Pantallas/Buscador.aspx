<%@ Page Title="buscador" Language="C#" MasterPageFile="~/Intranet.master" AutoEventWireup="true" CodeBehind="Buscador.aspx.cs" Inherits="Gestor_Clinico_Colegio.FichaPaciente" %>


<asp:Content  ContentPlaceHolderID="titulo" runat="server">
    Buscador
</asp:Content>

<asp:Content ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://www.google.com/recaptcha/api.js?render=6LcY6SoeAAAAAKwvjHX9MK07PTps_b3ZF3Udr4HT"></script>
      <script>           
          grecaptcha.ready(function () {
              grecaptcha.execute('6LcY6SoeAAAAAKwvjHX9MK07PTps_b3ZF3Udr4HT', { action: 'submit' }).then(function (token) {
                  document.getElementById("Gtoken").value = token;
                  console.log(token);
              });
          });
                </script>
    <Script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <link href="Img/rcm-80x36px.png" rel="shortcut icon" type="image/x-icon" />

</asp:Content>

<asp:Content  ContentPlaceHolderID="bodycontent" runat="server">
    
       
    <script>
        function w3_open() {
            document.getElementById("main").style.marginLeft = "15%";
            document.getElementById("mySidebar").style.width = "15%";
            document.getElementById("mySidebar").style.display = "block";
            document.getElementById("openNav").style.display = 'none';
        }
        function w3_close() {
            document.getElementById("main").style.marginLeft = "0%";
            document.getElementById("mySidebar").style.display = "none";
            document.getElementById("openNav").style.display = "inline-block";
        }
    </script>
    <style>
      
        body {
            counter-reset: rows;
        }
            
        table tbody tr {
            counter-increment: rows;
            height:50px;
        }
        table .total:before {
            content: counter(rows);
        }
        .rightbody {
          position:relative;
          border: solid 0.5px gray;
          border-radius: 5px;
          top:40%;
          margin-right:1%;
          padding: 10px;
          float: right;
          width: 72%;
        }
    </style>

    <div class="card container-fluid">    
        <center>
            <div class="row" style="margin-top:1%;margin-bottom:2%">
                <div class=" col-lg-4 col-md-4 col-sm-4">                      
            
                    <label>Prestador</label>
                    <select style="border-radius:5px;height:30px;width:200px">
                        <option selected>Seleciones Prestador</option>
                    </select>

                    <br /><br />  
                    <center>
                        <div class="calendario" >
                            <input class="radio" type="radio" name="cal" checked="checked" value="rbDia">
                            <label class="form-check-label" for="rdDia" >Ver día  </label>
                            <input class="radio" type="radio" name="cal" value="rbSemana">
                            <label class="form-check-label" for="rdSemana">Ver Semana</label>
                        </div>
                    </center>
                    <br />         

                    <label >Inicio:</label>
                    <input type="date" (change)="cambiaFecha($event.target)" [formControl]="fecha1" style="width:130px"/>&nbsp;&nbsp;&nbsp;
                    <label >Termino:</label>
                    <input type="date" (change)="cambiaFecha($event.target)" [formControl]="fecha2" style="width:130px"/>
            
                    <br /> <br />
        
                    <label >Hora Inicio:</label>
                    <input type="time" id="hrinicio" style="width:100px" />&nbsp;&nbsp;&nbsp;
                    <label >Hora Fin:</label>
                    <input type="time" id="hrtermino" style="width:100px" />
                </div>
            
                <div class="col-lg-4 col-md-4 col-sm-4 ">
                    
                        <label>Profesional <select style="border-radius:5px;height:30px;width:200px"><option selected>Selecione Profesional</option></select></label>
                    
                
                    <br /><br />
                
                    <center>
                        <button type="button" class="btn-primary" style="justify-content:center;border-radius:5px;width:100px"><span class="fa fa-search"> Buscar </span></button>
                    </center>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-3">
                    
                        <div class="radio mt-3">
                            <!--<button style="background-color:white;color:Highlight;border-color:Highlight;border-radius:5px"><input type="radio" name="prueba" value="2"/> RUT</button>
                            <button style="background-color:transparent;color:Highlight;border-color:Highlight;border-radius:5px"><input type="radio"  value="1" name="prueba"/> OTRO DOCUMENTO</button>-->
                            
                            <input type="radio" class="btn-check" formcontrolname="tipoDoc" value="1" autocomplete="on" >
                            <label class="btn btn-outline-primary ">RUT</label>
                            <input type="radio" class="btn-check" formcontrolname="tipoDoc" value="2" autocomplete="on">
                            <label class="btn btn-outline-primary ">OTRO DOCUMENTO</label>
                        </div>
            
                        <i class="material-icons"> &#xe02f;</i>
                            <input type="text" class="mt-4" style="width:250px;border:hidden;border-bottom:1px solid black"/>
                        
            
                        <center>
                            
                            <input type="hidden" id="Gtoken" name="G-token" />
                             <button type="button" class="btn btn-primary mt-2" data-bs-toggle="modal" data-bs-target="#myModal">Enviar</button>
                        </center>
                    
                </div>
                 <script>
                     function onSubmit(token) {
                         document.getElementById("#Gcapcha").submit();
                     }
                 </script>

              

            </div>
        </center>
    </div>
        
    


    <div class="container-fluid">

        <div class="row">
            <div class="col-lg-3 col-md-2 col-sm-6">
                
                <div class="card" style="padding:1px;width:300px">
                    <div class="card-header">
                        <h5>Prestacion</h5>
                    </div>
                    <div class="container" >
                        <div class="radio">
                            <label><input type="radio" name="optradio" value="raconsulta">Consulta</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="optradio" value="ratelemedicina" >Telemedicina</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="optradio" value="raimagen" >Imagen</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="optradio" value="ralaboratorio" >Laboratorio Clinico</label>
                        </div>
                    </div>
                </div>

                <div class="card" style="padding:1px;margin-top:5px;width:300px"">
                    <div class="card-header">
                            <h5>Especialidad</h5>
                    </div>                        
                    <div>
                        <select name="especialidades" class="form-select"><option selected >Seleccione Especialidad</option></select>
                    </div>
                </div>

                
                <div class="card" style="padding:1px;margin-top:5px;width:300px"">
                    <div class="card-header">
                        <h5>Georeferenciacion</h5>                            
                    </div>

                    <div>
                        <select name="regiones"  class="form-select" (change)="cambiaRegion($event.target.value)">
                            <option selected >Seleccione Region</option>
                            <option [value]="item.reg_idregion" *ngFor="let item of regiones">{{ item.reg_nombrecorto}}</option>
                        </select>
                    </div>
                    <hr />
                    <div>
                        <select name="comunas"  class="form-select" (change)="cambiaComuna($event.target.value)">
                            <option selected >Seleccione Comuna</option>
                            <option [value]="item.com_idcomuna" *ngFor="let item of comunas">{{ item.com_nombrecorto}}</option>
                        </select>
                    </div>
                </div>

            </div>
       
            <div class="col-lg-9 col-md-4 col-sm-6" style="width:850px" >
                <div class="card">
                    <div class="card-header">
                        <div  class="col-md-12 col-sm-12 col-lg-12" id="raconsulta" style="display:none">
                                 <table class="w3-table">
                                    <thead>
                                    <tr>
                                        <th>Fecha</th>
                                        <th>hora inicio</th>
                                        <th>Hora Fin</th>
                                        <th>Prestacion</th>
                                        <th>Especialidad</th>
                                        <th>Comuna</th>
                                        <th>Seleccion</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                     <tr>
                                        <td>20-01-2022</td>
                                        <td>11:00</td>
                                        <td>15:00</td>
                                        <td>Consulta</td>
                                        <td>Broncopulmonar</td>
                                        <td>Renca</td>
                                        <td><input class="w3-check" type="checkbox" checked="checked"></td>
                                   </tr>
                                     
                                    <tr>
                                        <td>18-01-2022</td>
                                        <td>18:00</td>
                                        <td>19:00</td>
                                        <td>Consulta</td>
                                        <td>Obstetra</td>
                                        <td>San Bernardo</td>
                                        <td><input class="w3-check" type="checkbox" checked="checked" ></td>
                                             </tr>
                                         </tbody>
                                          
                                        <tfoot>
                                            <tr>
                                                <th>Total de servicios registrados: <span class="total"> </span></th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                            </div>

                        <div id="rbSemana" style="display:none;height:370px;overflow-y:scroll;overflow:scroll;overflow-x:scroll">
                              
                            <table style="width:700px">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Lunes</th>
                                        <th>Martes</th>
                                        <th>Miercoles</th>
                                        <th>Jueves</th>
                                        <th>Viernes</th>
                                        <th>Sabado</th>
                                    </tr>
                                </thead>
                                 <tbody>
                                    <tr>
                                        <td>08:00</td>
                                    </tr>
                                    <tr>
                                        <td>09:00</td>
                                    </tr>
                                    <tr>
                                        <td>10:00</td>
                                    </tr>
                                    <tr>
                                        <td>11:00</td>
                                    </tr>
                                    <tr>
                                        <td>12:00</td>
                                    </tr>
                                    <tr>
                                        <td>13:00</td>
                                    </tr>
                                    <tr>
                                        <td>14:00</td>
                                    </tr>
                                    <tr>
                                        <td>15:00</td>
                                    </tr>
                                    <tr>
                                        <td>16:00</td>
                                    </tr>
                                    <tr>
                                        <td>17:00</td>
                                    </tr>
                                    <tr>
                                        <td>18:00</td>
                                    </tr>
                                    <tr>
                                        <td>19:00</td>
                                    </tr>
                                    <tr>
                                        <td>20:00</td>
                                    </tr>
                                    
                                </tbody>        
                            </table>
                        </div>


                        <div id="rbDia" style="height:370px;overflow-y:scroll;overflow:scroll;overflow-x:scroll">                           
                            <table style="width:750px">
                                
                                <thead>
                                    <tr>
                                        <th>Horas Disponibles</th>
                                        <th>24 Enero De 2022</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>08:00</td>
                                    </tr>
                                    <tr>
                                        <td>09:00</td>
                                    </tr>
                                    <tr>
                                        <td>10:00</td>
                                    </tr>
                                    <tr>
                                        <td>11:00</td>
                                    </tr>
                                    <tr>
                                        <td>12:00</td>
                                    </tr>
                                    <tr>
                                        <td>13:00</td>
                                    </tr>
                                    <tr>
                                        <td>14:00</td>
                                    </tr>
                                    <tr>
                                        <td>15:00</td>
                                    </tr>
                                    <tr>
                                        <td>16:00</td>
                                    </tr>
                                    <tr>
                                        <td>17:00</td>
                                    </tr>
                                    <tr>
                                        <td>18:00</td>
                                    </tr>
                                    <tr>
                                        <td>19:00</td>
                                    </tr>
                                    <tr>
                                        <td>20:00</td>
                                    </tr>
                                    
                                </tbody>                                     
                            </table>
                        </div>

                    </div>
                </div>
            </div>

        </div>
   </div>

    
                 <script>
                     $(document).ready(function () {
                         $(".calendario").click(function (event) {
                             var valor = $(event.target).val();
                             if (valor == "rbDia") {
                                 $("#rbDia").show();
                                 $("#rbSemana").hide();
                             }else if (valor == "rbSemana") {
                                 $("#rbDia").hide();
                                 $("#rbSemana").show();
                             }
                 
                         });
                     });
                 </script> 
    
   
    <!--MODAL PREAGENDAMIENTO PARA CONSULTA Y TELEMEDICINA-->

    <div class="modal" data-backdrop="static" data-keyboard="false" id="myModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Pre Agendamiento</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">

                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtRut">Rut</label>
                            <input type="text" class="form-control" id="txtRut" value="{{citasReservadas.run}}" disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtPaciente">Paciente</label>
                            <input type="text" class="form-control" id="txtPaciente" value="{{citasReservadas.beneficiario}}" disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtNivel">Nivel</label>
                            <input type="text" class="form-control" id="txtNivel" value="{{citasReservadas.nivel}} " disabled>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtPrfesional">Profesional</label>
                            <input type="text" class="form-control" id="txtProfesional" value="{{citasReservadas.nombre_profesional}}" disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label" for="slcPrestacion">Prestacion</label>
                            <input type="text" class="form-control" id="txtPrestacion" value="{{ citasReservadas.nombre }}" disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtCodPrestacion">Código Prestación</label>
                            <input type="text" class="form-control" id="txtCodPrestacion" value="{{ citasReservadas.codigo }}" disabled>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtValorT">Valor total</label>
                            <input type="text" class="form-control" id="txtValorT" value="{{ citasReservadas.valortotal }}" disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtBonificacion">Bonificación</label>
                            <input type="text" class="form-control" id="txtBonificacion" value="{{ citasReservadas.bonificacion }}" disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtValorC">Valor Copago</label>
                            <input type="text" class="form-control" id="txtValorC" value="{{ citasReservadas.copago }}" disabled>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtFecha">Fecha</label>
                            <input type="text" class="form-control" id="txtFecha" value="{{ citasReservadas.fecha }}" disabled>
                        </div>
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtHora">Hora</label>
                            <input type="text" class="form-control" id="txtHora" value="{{ citasReservadas.agen_hora }}" disabled>
                        </div>
                        <div class="form-group col-md-2"></div>
                    </div>

                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <a href="CompraBono.aspx" class="w3-bar-item w3-button btn-primary ">Comprar Bono</a> 
                    <button class="btn btn-secondary">Copago</button>
                    <button class="btn btn-danger">Volver</button>
                </div>

            </div>
        </div>
    </div>
     
</asp:Content>