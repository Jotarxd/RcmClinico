<%@ Page Title="" Language="C#" MasterPageFile="~/Intranet.Master" AutoEventWireup="true" CodeBehind="Recepcion.aspx.cs" Inherits="Gestor_Clinico_Colegio.FichaPaciente" %>
<asp:Content ID="Content4" ContentPlaceHolderID="titulo" runat="server">
    Recepcion

</asp:Content>
    <asp:Content ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
        <link href="../Img/rcm-80x36px.png" rel="shortcut icon" type="image-icon" />
</asp:Content>

<asp:Content ContentPlaceHolderID="bodycontent" runat="server">
      
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

     <div class="container mt-2" style="left:50px;position:relative;width:fit-content">     
        <div class="row" style="margin-top:1%;margin-bottom:2%">
            <div class=" col-lg-8 col-md-8 col-sm-8">                      
            
                <center>
                    <div class="calendario" >
                        <input class="radio" type="radio" name="cal" value="rbDia" checked="checked">
                        <label class="form-check-label" for="rdDia">Ver día  </label>
                        <input class="radio" type="radio" name="cal" value="rbSemana">
                        <label class="form-check-label" for="rdSemana">Ver Semana</label>
                    </div>
                </center>

                <br />         

                <label >Inicio:</label>
                <input type="date" (change)="cambiaFecha($event.target)" [formControl]="fecha1" style="width:130px"/>&nbsp;&nbsp;&nbsp;
                <label >Termino:</label>
                <input type="date" (change)="cambiaFecha($event.target)" [formControl]="fecha2" style="width:130px"/> 
            </div>
            
            <div class="col-lg-4 col-md-4 col-sm-4 ">
                    
                <label>Profesional <select style="border-radius:5px;height:30px;width:200px"><option selected>Selecione Profesional</option></select></label>
                <br />
                <br />                
                <center>
                    <button type="button" class="btn-primary" style="justify-content:center;border-radius:5px;width:100px"><span class="fa fa-search"> Buscar </span></button>
                </center>
            </div>
        </div>
    </div>
        
    <div class="container-fluid mt-2">
        
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-10">
                
                <div class="card" style="padding:1px;width:300px">
                    <div class="card-header">
                        <h5>Prestacion</h5>
                    </div>
                    <div class="container" >
                        <div class="radio">
                            <label><input type="radio" name="optradio" value="raconsulta" checked="checked" >Consulta</label>
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

                <div class="card" style="padding:1px;margin-top:5px;width:300px">
                    <div class="card-header">
                            <h5>Especialidad</h5>
                    </div>                        
                    <div>
                        <select name="especialidades" class="form-select"><option selected >Seleccione Especialidad</option></select>
                    </div>
                </div>

                
                <div class="card" style="padding:1px;margin-top:5px;width:300px">
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
    
            <div class="col-lg-8 col-md-8 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div  class="col-md-12 col-sm-12 col-lg-12" id="raconsulta" style="overflow-y:scroll;display:none">
                                 <table class="w3-table" style="width:250px">
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

                        <div id="rbSemana"style="overflow-y:scroll;overflow-x:scroll;display:none">
                            <table style="width:1000px">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Lunes</th>
                                        <th>Martes</th>
                                        <th>Miercoles</th>
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

                        <div id="rbDia" style="overflow-y:scroll;overflow-x:hidden">                           
                            <table class="table" style="overflow-y:scroll;width:900px">
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
                <button class="btn-primary mt-3" style="border-radius:5px">Sobre Cupo</button>
                <button class="btn-secondary mt-3" style="border-radius:5px">Volver</button>
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
                 } else if (valor == "rbSemana") {
                     $("#rbDia").hide();
                     $("#rbSemana").show();
                 }

             });
         });
     </script> 

</asp:Content>


