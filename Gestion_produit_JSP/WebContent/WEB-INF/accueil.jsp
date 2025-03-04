<!DOCTYPE html>
<html>
<head>
<title>Gestion des Produits</title>
<link rel="icon" href="WEB-INF/journal.svg" type="image/svg+xml">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body style="font-family: 'Comic Sans MS', 'Arial', cursive;">
<c:set var="montantMax" value="0" />
<c:set var="montantTotal" value="0" />
<c:set var="montantMin" value="${Double.MAX_VALUE}" />
	<button type="button" class="btn btn-lg bg-dark text-white rounded-0" data-toggle="modal" data-target="#exampleModal">Ajouter</button>
	<c:choose>
			    <c:when test="${! empty liste_des_produits}">
			        <h1>Liste des produits</h1>
			        <div class="d-flex justify-content-between">
			       <table class="table table-hover table-responsive table-bordered">
				        <thead class="thead-dark">
				            <tr>
				                <th>ID</th>
				                <th>Designation</th>
				                <th>Prix unitaire</th>
				                <th>Quantite</th>
				                <th>Montant</th>
				                <th colspan="2">Actions</th>
				            </tr>
				        </thead>
				        <tbody>
				        
					        <c:forEach var="tour" items="${liste_des_produits}">
					             <tr>
					                <td>${tour.numProduit}</td>
					                <td>${tour.design}</td>
					                <td><fmt:formatNumber value="${ tour.prix}" type="number" groupingUsed="true" /> Ar</td>
					                <td>${tour.quantite}</td>
					              <td><fmt:formatNumber value="${tour.prix * tour.quantite}" type="number" groupingUsed="true" /> Ar</td>

					                <td>		                	
			                                <button class="btn border-info rounded-0 btn-modifier" type="button" 
											        data-toggle="modal" data-target="#exampleModal"
											        data-id="${tour.numProduit}"
											        data-design="${tour.design}"
											        data-prix="${tour.prix}"
											        data-quantite="${tour.quantite}">
											    <i class="bi bi-pencil text-info"></i>
											</button>

			                        </td>
					                <td>
					                	<form method="POST" action="" onSubmit="return confirm('Voulez-vous vraiment supprimer le produit? Cela pourrait metre irreverssible');">
			                                <button class="btn border-danger rounded-0" type="submit"  name="btn_supp" title="Delete" data-toggle="tooltip" value="${tour.numProduit}">
			                                <i class="bi bi-trash text-danger"></i>
			                                </button>
			                            </form>
			                         </td>
			                         
					            </tr>
					            
					           <!--  CALCUL MIN MAX TOTAL -->
					           
					                <c:set var="montant" value ="${tour.prix * tour.quantite}"/>
					                <c:if test="${montant > montantMax}">
					                	<c:set  var="montantMax" value = "${montant}"/>
					                </c:if>
					                <c:if test="${montant < montantMin}">
					                	<c:set var="montantMin" value = "${montant}" />
					                </c:if>
					                <c:set var="montantTotal" value = "${montantTotal + montant }"  />
					        </c:forEach>
				         </tbody>
			         </table>
			          
			    </c:when>
			<c:otherwise>
					<c:set var="montantMin" value="0"/>
			        <p>Aucun produit n'est enregistré dans la base</p>
			    </c:otherwise>
			</c:choose>
			
			<!-- HISTOGRAMME -->
			 <div id="histogramme" class=""></div>
			    </div>
			    <h3> Montant Total: <fmt:formatNumber value="${montantTotal}" type="number" groupingUsed="true" /> Ar</h3>
			         <h3> Maximum: <fmt:formatNumber value="${montantMax}" type="number" groupingUsed="true" />Ar</h3>
			         <h3> Minimum :<fmt:formatNumber value="${montantMin}" type="number" groupingUsed="true" />Ar</h3>
			      
			      <!-- Modal  POPUP-->
			    
				<div class="modal fade border-0" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			        <div class="modal-dialog" role="document">
			          <div class="modal-content">
			            <div class="modal-header">
			              <h5 class="modal-title" id="exampleModalLabel">Ajout d'un produit</h5>
			              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                <span aria-hidden="true">&times;</span>
			              </button>
			            </div>
			            <div class="modal-body">
					             <form method="POST" id="formProduit">
								    <!-- Champ caché pour stocker l'ID du produit -->
								    <input type="hidden" id="numProduit" name="numProduit">
								
								    <div class="">
								        <label for="Design" class="">Design :</label><br>
								        <div class="col-sm-10">
								            <input type="text" id="design" name="design" required class="form-control">
								        </div>
								    </div>
								
								    <div class="">
								        <label for="prix" class="">Prix unitaire du produit :</label><br>
								        <div class="col-sm-10">
								            <input type="number" id="prix" name="prix" required min="100" class="form-control">
								        </div>
								    </div>
								
								    <div class="">
								        <label for="quantite" class="">Quantité du produit :</label><br>
								        <div class="col-sm-10">
								            <input type="number" id="quantite" name="quantite" required class="form-control" min="1" >
								        </div>
								    </div>
								
								    <div class="modal-footer">
								        <button type="button" class="btn btn-secondary rounded-0" data-dismiss="modal">Fermer</button>
								        <button type="submit" id="btnSubmit" class="btn text-white bg-dark rounded-0">Enregistrer</button>
								    </div>
								</form>

			            </div>
			            
			          </div>
			        </div>
			      </div>


			      
			
</body>
<script>
$(document).ready(function() {
    // Ajouter
    $(".btn.bg-dark").submit(function() {
        $("#formProduit")[0].reset(); // Réinitialiser les champs
        $("#numProduit").val(""); // Vider l'ID pour indiquer un ajout
        $("#btnSubmit").text("Enregistrer"); // Changer le texte du bouton
        $(".modal-title").text("Ajout d'un produit"); // Modifier le titre
    });

    // Modifier
    $(".btn-modifier").click(function() {
        // Récupérer les valeurs de la ligne sélectionnée
        var id = $(this).data("id");
        var design = $(this).data("design");
        var prix = $(this).data("prix");
        var quantite = $(this).data("quantite");

        // Remplir les champs du formulaire
        $("#numProduit").val(id);
        $("#design").val(design);
        $("#prix").val(prix);
        $("#quantite").val(quantite);

        // Modifier l'affichage du bouton et du titre du modal
        $("#btnSubmit").text("Modifier");
        $(".modal-title").text("Modification du produit");
    });
});

/// Load Google Charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  console.log("drawChart() appelé"); // Vérification dans la console

  var data = google.visualization.arrayToDataTable([
    ['Désignation','', { role: 'style' }],
    ['Montant total', ${montantTotal}, 'black'],
    ['Montant maximum', ${montantMax}, 'grey'],
    ['Montant minimum', ${montantMin}, 'blue']
  ]);

  var options = {
    title: 'Flux des tarifs',
    width: 600,
    height: 200,
     // Pas de légende
   
    vAxis: { title: 'Montant en Ar' }
  };

  // Changer 'ColumnChart' en 'BarChart' si vous voulez un histogramme horizontal
  var chart = new google.visualization.ColumnChart(document.getElementById('histogramme'));
  chart.draw(data, options);
}

</script>
</html>