<?xml version="1.0" encoding="utf-8"?>

<!--
    Document   : jpkTransformation.xsl
    Created on : 7 lutego 2021, 21:13
    Author     : mateuszecki
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"                     
                xmlns:etd="http://crd.gov.pl/xml/schematy/dziedzinowe/mf/2018/08/24/eD/DefinicjeTypy/"        
                xmlns:tns="http://jpk.mf.gov.pl/wzor/2019/09/27/09271/"     
>
    <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    
    <xsl:template match="/">      
        <xsl:element name="tns:JPK">
            <xsl:apply-templates select="tns:JPK/tns:Naglowek"/>    
            <xsl:apply-templates select="tns:JPK/tns:Podmiot1"/>
            <xsl:apply-templates select="tns:JPK/tns:Faktura"/>    
            <xsl:element name="tns:SprzedazCtrl">
                <xsl:element name="tns:LiczbaWierszySprzedazy">
                    <xsl:value-of select="tns:JPK/tns:FakturaCtrl/tns:LiczbaFaktur"/>
                </xsl:element>                
                <xsl:element name="tns:PodatekNalezny">
                    <xsl:value-of select="format-number(sum(tns:JPK/tns:Faktura/tns:P_14_1), '#.00')"/>
                </xsl:element>
            </xsl:element>            
        </xsl:element>            
    </xsl:template>
    
    <xsl:template match="tns:JPK/tns:Naglowek">
        <xsl:element name="tns:Naglowek">
            <xsl:element name="tns:KodFormularza">
                <xsl:attribute name="kodSystemowy">JPK_VAT (3)</xsl:attribute>
                <xsl:attribute name="wersjaSchemy">1-1</xsl:attribute>
                <xsl:text>JPK_VAT</xsl:text>
            </xsl:element>
            <xsl:element name="tns:WariantFormularza">
                <xsl:value-of select="tns:WariantFormularza"/>
            </xsl:element>  
            <xsl:element name="tns:CelZlozenia">
                <xsl:value-of select="tns:CelZlozenia"/>
            </xsl:element>
            <xsl:element name="tns:DataWytworzeniaJPK">
                <xsl:value-of select="tns:DataWytworzeniaJPK"/>
            </xsl:element> 
            <xsl:element name="tns:DataOd">
                <xsl:value-of select="tns:DataOd"/>
            </xsl:element>   
            <xsl:element name="tns:DataDo">
                <xsl:value-of select="tns:DataDo"/>
            </xsl:element>   
            <xsl:element name="tns:NazwaSystemu">
                <xsl:text>Konwerter JPK_FA do JPK_VAT</xsl:text>
            </xsl:element>  
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tns:JPK/tns:Podmiot1">
        <xsl:element name="tns:Podmiot1">
            <xsl:element name="tns:NIP">
                <xsl:value-of select="tns:IdentyfikatorPodmiotu/etd:NIP"/>
            </xsl:element>
            <xsl:element name="tns:PelnaNazwa">
                <xsl:value-of select="tns:IdentyfikatorPodmiotu/etd:PelnaNazwa"/>
            </xsl:element>
        </xsl:element> 
    </xsl:template>
    
    <xsl:template match="tns:JPK/tns:Faktura">
        <xsl:element name="tns:SprzedazWiersz">
            <xsl:element name="tns:LpSprzedazy">
                <xsl:value-of select="position()"/>
            </xsl:element>
            <xsl:element name="tns:NrKontrahenta">
                <xsl:choose>
                    <xsl:when test="tns:P_5B">
                        <xsl:value-of select="tns:P_5B"/>
                    </xsl:when>
                    <xsl:otherwise>BRAK</xsl:otherwise>
                </xsl:choose>
            </xsl:element>
            <xsl:element name="tns:NazwaKontrahenta">
                <xsl:value-of select="tns:P_3A"/>
            </xsl:element>
            <xsl:element name="tns:AdresKontrahenta">
                <xsl:value-of select="tns:P_3B"/>
            </xsl:element>
            <xsl:element name="tns:DowodSprzedazy">
                <xsl:value-of select="tns:P_2A"/>
            </xsl:element>
            <xsl:element name="tns:DataWystawienia">
                <xsl:value-of select="tns:P_1"/>
            </xsl:element>
            <!-- Jeśli data sprzedaży i wystawienia są takie same niech się nie powtarzają,
            tylko DataWystawienia-->
            <xsl:element name="tns:DataSprzedazy">
                <xsl:value-of select="tns:P_6"/>
            </xsl:element>
            <xsl:element name="tns:K_15">
                <xsl:value-of select="tns:P_13_3"/>
            </xsl:element>
            <xsl:element name="tns:K_16">
                <xsl:value-of select="tns:P_14_3"/>
            </xsl:element>
            <xsl:element name="tns:K_17">
                <xsl:value-of select="tns:P_13_2"/>
            </xsl:element>
            <xsl:element name="tns:K_18">
                <xsl:value-of select="tns:P_14_2"/>
            </xsl:element>
            <xsl:element name="tns:K_19">
                <xsl:value-of select="tns:P_13_1"/>
            </xsl:element>
            <xsl:element name="tns:K_20">
                <xsl:value-of select="tns:P_14_1"/>
            </xsl:element>
        </xsl:element>        
    </xsl:template>
    

</xsl:stylesheet>
