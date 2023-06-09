var usedColors = []; // Tableau pour stocker les couleurs déjà utilisées

    function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';

        do {
            color = '#';
            for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
            }
        } while (isDarkColor(color) || isColorUsed(color));

        usedColors.push(color); // Ajouter la couleur utilisée au tableau

        return color;
    }

    function isDarkColor(color) {
        // Convertir la couleur hexadécimale en RGB
        var rgb = hexToRgb(color);

        // Calculer la luminosité de la couleur
        var brightness = (rgb.r * 299 + rgb.g * 587 + rgb.b * 114) / 1000;

        // Retourner true si la couleur est sombre, sinon false
        return brightness < 128;
        }

        function isColorUsed(color) {
        // Vérifier si la couleur est déjà utilisée
        return usedColors.includes(color);
    }

    function hexToRgb(hex) {
        // Supprimer le caractère '#' s'il est présent
        hex = hex.replace('#', '');

        // Extraire les composantes RGB
        var r = parseInt(hex.substring(0, 2), 16);
        var g = parseInt(hex.substring(2, 4), 16);
        var b = parseInt(hex.substring(4, 6), 16);

        // Retourner un objet contenant les composantes RGB
        return { r: r, g: g, b: b };
    }

    window.addEventListener('DOMContentLoaded', function() {
      var card = document.getElementsByClassName('card');
      var title = document.getElementsByClassName('card-title');
      var moreButton = document.getElementsByClassName('more');
      var joinButton = document.getElementsByClassName('join');
      for (var i = 0; i < card.length; i++) {
        var color = getRandomColor();
        card[i].style.borderColor = color;
        title[i].style.color = color;
        moreButton[i].style.backgroundColor = color;
        joinButton[i].style.borderColor = color;
        joinButton[i].style.color = color;
      }
    });