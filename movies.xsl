<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="5.0" />
  <xsl:template match="/movies">
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Movie Library Utilities</title>
        <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous"
        />
        <script
          src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        ></script>
      </head>
      <body class="text-bg-dark">
        <h1 class="fw-bold p-2 m-2">Movie Library Utilities</h1>
        <h2 class="fw-light p-2 ms-2"><i>by Matej Peričić</i></h2>
        <br />
        <form action="">
          <div class="row mw-25 m-4">
            <label for="searchInput" class="form-label">Search</label>
            <input
              type="search"
              class="form-control"
              id="searchInput"
              placeholder="Title, year, genre, IMDb ID, director..."
            />
          </div>
        </form>
        <div
          class="main mx-auto my-4 row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5"
        >
          <xsl:for-each select="movie">
            <xsl:sort select="title/text()" />
            <div class="col g-4 mx-auto">
              <div class="card bg-dark-subtle text-light p-2 m-2 h-100">
                <h3 class="card-title"><xsl:value-of select="title" /></h3>
                <p class="card-subtitle"><xsl:value-of select="year" /></p>
                <p class="card-subtitle">
                  <xsl:value-of select="director" />
                </p>
                <p class="card-subtitle">
                  Genres:
                  <xsl:for-each select="genres/genre">
                    <xsl:value-of select="concat(text(), '; ')" />
                  </xsl:for-each>
                </p>
                <a class="card-link">
                  <xsl:attribute name="href">
                    <xsl:value-of
                      select="concat('https://www.imdb.com/title/', child::title/@imdb)"
                    />
                  </xsl:attribute>
                  IMDb
                </a>
              </div>
            </div>
          </xsl:for-each>
        </div>
        <script>
          $(document).ready(function () {
            $("#searchInput").on("keyup", function () {
              var value = $(this).val().toLowerCase();
              $(".main *")
                .filter(function () {
                  $(this).toggle($(this).parent().html().toLowerCase().indexOf(value) > -1);
                });
            });
          });
        </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
