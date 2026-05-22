<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>

    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text><xsl:text>&#xa;</xsl:text>
        <html lang="en" xml:lang="en">
            <head>
                <title>
                    <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab-->
                    Enåkers slöjdskolans dagbok åren 1900-1902: Hem
                </title>
                <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website -->
                <link rel="stylesheet" href="assets/css/main.css"/>
                <link rel="stylesheet" href="assets/css/desktop.css"/>
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                    </h1>
                </header>
                <nav id="sitenav"><a href="index.html">Hem</a> |
                    <a href="transkribering.html">Transkribering</a> |
                    <a href="reading.html">Dagbok</a> |
                    <a href="galleri.html">Galleri</a> |
                    <a href="projekt.html">Projekt</a> |
                    <a href="resurser.html">Elektroniska resurser</a> |
                </nav>
                <main id="manuscript">
                    <!-- bootstrap "container" class makes the columns look pretty -->
                    <div class="container">
                    <!-- define a row layout with bootstrap's css classes (two columns) -->
                        <div class="row">
                            <!-- first column: load the image based on the IIIF link in the graphic above -->
                            <div class="col-sm">
                                <article id="collection">
                                    <xsl:for-each select="//tei:surface">
                                        <img class="thumbnail">
                                         <xsl:attribute name="src">
                                             <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                                         </xsl:attribute>
                                         <xsl:attribute name="title">
                                             <xsl:value-of select="tei:figure/tei:label"/>
                                         </xsl:attribute>
                                         <xsl:attribute name="alt">
                                             <xsl:value-of select="tei:figure/tei:figDesc"/>
                                         </xsl:attribute>
                                     </img>                              
                                    </xsl:for-each>
                                </article>
                            </div>
                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-sm">
                                <article id="description">
                                  <p>
                                      <h5>Om projektet</h5> 
                                      <p>
                                          Detta projekt är utfört i samband med <a href="https://www.hembygd.se/en-kers-hembygdsf-rening">Enåkers hembygdsförening</a> av Alexandra Berghwall och Joana Ribeiro, studenter på delkursen “Digitalisering för bevarande och tillgänglighet” på Masterprogrammet i Biblioteks-och informationsvetenskap vid Högskolan i Borås under vårterminen 2026. Projektet är en digitalisering av en dagbok från Enåkers slöjdskola, Enåker socken, Heby kommun från år 1900-1908 men är i nuläget begränsat till de första tre åren (1900-1902) på grund av tidsbegränsningar. <xsl:apply-templates select="//tei:msContents"/> framtiden, planerar vi att digitalisera dagboken i sin helhet. Hela boken var digitaliserad och transkriberad och transkriberingen var utförd vid hand för bokens helhet.
                                      </p>    
                                  </p>
                                    <p> 
                                        <h5>Om skolan</h5> 
                                        
                                        Enåkers skola började i samband med folkskolans reformer 1844 som en ambulerande folkskola mellan lokaler i närliggande Kroksbo, Pålsbo och Ekedal tills det blev koncentrerat fem år senare till två lokaler i Ekedal och i byns Sockenstugan. En fast folkskola byggdes vid Enåkers kyrka mellan 1872-76 och fick namnet Kyrkskolan. Ett större skolhus byggdes år 1914 och hade plats för 50 elever på folkskolan och 36 vid småskolan vid årskurs 1-6. Skolan fortsätter att ha blandade årskurser i samma undervisningslokal ännu fram till 2001. Kommunal undervisning och ansvar för skolan slutades år 2009 och en lokal ekonomisk förening tog över ansvaret för skolan som en fristående föräldrakooperativ skola tills den  stängdes vårterminen 2011 på grund av elevbrist. (Informationen från O. Nilson, Möt Enåker. En uppländsk socken nära Västmanland, 2018). 
                                    </p> 
                                    <p>
                                        <h5>Om slöjdundervisning </h5> 
                                        
                                        Slöjdundervisning har varit ett ämne i svenska skolor sedan 1700-talet där handarbeten var en del av studier vid kristendom och läsning, men det kan ha varit en del av skoldagar sedan 1500-talet men det uteblev som ett ämne när folkskolan stadgas 1842. Slöjd ingick först som ett skolämne när den första läroplanen kom år 1878 men det var ej obligatoriskt och det var barnens vårdnadshavare som bestämde sig om deras barn skulle delta. Fem år senare blev slöjd ett ämne vid folkskoleseminarier vilket betydde att lärarna ska nu lära sig om hur man undervisar i ämnet. 
                                        Under tiden där Enåkers slöjdskolans dagbok uppstår fanns det en strikt uppdelning mellan flickor och pojkar och deras inriktningar inom ämnet, nämligen att flickor ska lära sig om sömnad och stickning medan pojkarna ska fokusera på trä-och metallslöjd. Det här är tydligt i vår dagbok och det är endast pojkarnas arbete och närvaro som är rapporterade. 
                                        Föremålen som pojkarna skapade är tidstypiskt och skulle ha haft praktiskt användning på ett landsbygd samhälle, till exempel en selpinne som används till häst, en skottkärra, en skaft till en flughåv för att kunna fånga flugor och olika sorter av vinklar. (Information från https://lararstiftelsen.se/slojd-ett-foranderligt-amne/) 
                                        
                                    </p>
                                     <p>
                                         <h5>Tack</h5>
                                         Ett särskilt tack till Britt Marie Blidmo Hedlund för hennes kunskap om Enåkers historia.
                                     </p>  
                                   

                                </article>
                            </div>
                        </div>
                        <div class="row">
                                <div class="col-sm">
                                    <article id="details">
                                      <p>
                                        <strong>Projekt gjorde av:</strong><br/>
                                        <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
                                      </p>
                                      <p>
                                        <strong>Transkriberade av:</strong><br/>
                                        <xsl:apply-templates select="//tei:titleStmt/tei:principal"/>
                                      </p>
                                    </article>
                                </div>
                        </div>
                    </div>
                </main>
                <footer>
                <div class="row" id="footer">
                  <div class="col-sm copyright">
                  		<div class="copyright_logos">
                  			<a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                  			    <img src="assets/img/logos/cc.svg" class="copyright_logo" alt="Creative Commons License"/><img src="assets/img/logos/by.svg" class="copyright_logo" alt="Attribution 4.0 International"/>
                  			</a>
                  		</div>
                  		<div class="copyright_text">
                  		    2026 Alex Berghwall; Joana P.C. Ribeiro
                      </div>
                    </div>
                </div>
                </footer>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
