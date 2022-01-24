<%@ Page Title="" Language="C#" MasterPageFile="~/Intranet.Master" AutoEventWireup="true" CodeBehind="ReservaAtencion.aspx.cs" Inherits="Gestor_Clinico_Colegio.FichaPaciente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="titulo" runat="server">
    Reserva Atencion
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



</asp:Content>
