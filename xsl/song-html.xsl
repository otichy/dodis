<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="tei">

   <!-- Produce HTML and strip insignificant whitespace -->
   <xsl:output method="html" indent="yes" />
   <xsl:strip-space elements="*"/>

   <!-- Entry: build the full HTML shell -->
   <xsl:template match="/">
      <html lang="en">
         <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title>
               <xsl:value-of select="normalize-space(//tei:fileDesc/tei:titleStmt/tei:title)"/>
            </title>
            <style>
               :root {
                  --ink: #1a1a1a;
                  --gold: #d4a85f;
                  --cream: #f7f2e8;
                  --shadow: rgba(0,0,0,0.08);
                  --accent: #7e3f98;
               }
               * { box-sizing: border-box; }
               body {
                  margin: 0;
                  font-family: "Georgia", "Palatino", serif;
                  background: radial-gradient(circle at 20% 20%, #fff7ea, #f1e7d7 40%, #ebdfcd);
                  color: var(--ink);
                  line-height: 1.7;
               }
               header.hero {
                  padding: 3rem 1.5rem 2rem;
                  text-align: center;
                  position: relative;
                  overflow: hidden;
               }
               header.hero::after, header.hero::before {
                  content: "";
                  position: absolute;
                  width: 280px;
                  height: 280px;
                  border-radius: 50%;
                  filter: blur(40px);
                  opacity: 0.35;
                  z-index: 0;
               }
               header.hero::before {
                  background: #f3d9a4;
                  top: -80px; left: -60px;
               }
               header.hero::after {
                  background: #c4b3f0;
                  bottom: -100px; right: -80px;
               }
               .hero-content {
                  position: relative;
                  z-index: 1;
                  display: inline-block;
                  padding: 1rem 1.5rem;
                  background: rgba(255,255,255,0.72);
                  border-radius: 18px;
                  box-shadow: 0 20px 60px var(--shadow);
                  backdrop-filter: blur(6px);
                  border: 1px solid rgba(0,0,0,0.03);
               }
               .hero h1 {
                  margin: 0 0 0.25rem;
                  font-size: clamp(2.2rem, 3.5vw, 3.4rem);
                  letter-spacing: 0.08em;
                  text-transform: uppercase;
               }
               .hero .author {
                  font-size: 1.1rem;
                  color: #5b4b39;
                  text-transform: uppercase;
                  letter-spacing: 0.22em;
               }
               main {
                  max-width: 900px;
                  margin: 0 auto;
                  padding: 1rem 1.2rem 3rem;
               }
               section.book {
                  margin-top: 2rem;
                  padding: 1rem 1.25rem 1.5rem;
                  background: #fff;
                  border-radius: 18px;
                  box-shadow: 0 12px 35px var(--shadow);
                  border: 1px solid rgba(0,0,0,0.04);
               }
               .book-title {
                  margin: 0 0 1.4rem;
                  font-size: 1.6rem;
                  letter-spacing: 0.06em;
                  text-transform: uppercase;
                  color: #2d1e0f;
                  border-bottom: 1px solid rgba(0,0,0,0.08);
                  padding-bottom: 0.6rem;
               }
               article.poem {
                  margin: 0 0 2.4rem;
                  padding: 1rem 1rem 1.25rem;
                  border-radius: 14px;
                  background: linear-gradient(135deg, rgba(196,179,240,0.18), rgba(243,217,164,0.22));
                  border: 1px solid rgba(0,0,0,0.04);
               }
               .poem h2 {
                  margin: 0 0 0.8rem;
                  font-size: 1.35rem;
                  letter-spacing: 0.03em;
                  color: #2b1d4f;
               }
               .stanza {
                  margin: 0 0 1.1rem;
                  padding-left: 0.2rem;
               }
               .line {
                  display: block;
                  padding-left: 0.2rem;
               }
               .line.indent {
                  padding-left: 1.5rem;
               }
               .page-break {
                  display: inline-block;
                  margin: 0.25rem 0;
                  padding: 0.2rem 0.5rem;
                  font-size: 0.8rem;
                  color: #5f4b20;
                  background: rgba(212,168,95,0.14);
                  border-radius: 8px;
               }
               footer.meta {
                  margin-top: 2.5rem;
                  text-align: center;
                  color: #6a5a47;
                  font-size: 0.95rem;
               }
               @media (max-width: 640px) {
                  main { padding: 0.5rem 0.7rem 2.4rem; }
                  .hero-content { width: 100%; }
               }
            </style>
         </head>
         <body>
            <header class="hero">
               <div class="hero-content">
                  <!-- Title/author from TEI header -->
                  <h1>
                     <xsl:value-of select="normalize-space(//tei:fileDesc/tei:titleStmt/tei:title)"/>
                  </h1>
                  <div class="author">
                     <xsl:value-of select="normalize-space(//tei:fileDesc/tei:titleStmt/tei:author)"/>
                  </div>
               </div>
            </header>
            <main>
               <!-- Render the main book content -->
               <xsl:apply-templates select="//tei:text/tei:body/tei:div1"/>
            </main>
            <footer class="meta">
               <!-- Source note from TEI sourceDesc -->
               <div>Generated from TEI using XSLT</div>
               <div>
                  <xsl:value-of select="normalize-space(//tei:sourceDesc//tei:p)"/>
               </div>
            </footer>
         </body>
      </html>
   </xsl:template>

   <!-- Book wrapper -->
   <xsl:template match="tei:div1[@type='book']">
      <section class="book">
         <h2 class="book-title">
            <xsl:value-of select="tei:head"/>
         </h2>
         <xsl:apply-templates select="tei:div2"/>
      </section>
   </xsl:template>

   <!-- Individual poem -->
   <xsl:template match="tei:div2[@type='poem']">
      <article class="poem">
         <h2>
            <xsl:value-of select="tei:head"/>
         </h2>
         <xsl:apply-templates select="tei:lg"/>
      </article>
   </xsl:template>

   <!-- Stanza -->
   <xsl:template match="tei:lg[@type='stanza']">
      <div class="stanza">
         <xsl:apply-templates select="node()"/>
      </div>
   </xsl:template>

   <!-- Verse line (handles indent) -->
   <xsl:template match="tei:l">
      <span class="line">
         <xsl:if test="@rend='indent'">
            <xsl:attribute name="class">line indent</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="node()"/>
      </span>
   </xsl:template>

   <!-- Page break marker -->
   <xsl:template match="tei:pb">
      <span class="page-break">Page <xsl:value-of select="@n"/></span>
   </xsl:template>

   <!-- Default text handling -->
   <xsl:template match="text()">
      <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
