
xquery version "3.1";

module namespace pm-config="http://www.tei-c.org/tei-simple/pm-config";

import module namespace pm-docx-tei="http://www.tei-c.org/pm/models/docx/tei/module" at "../transform/docx-tei-module.xql";
import module namespace pm-dodis-web="http://www.tei-c.org/pm/models/dodis/web/module" at "../transform/dodis-web-module.xql";
import module namespace pm-dodis-print="http://www.tei-c.org/pm/models/dodis/print/module" at "../transform/dodis-print-module.xql";
import module namespace pm-dodis-latex="http://www.tei-c.org/pm/models/dodis/latex/module" at "../transform/dodis-latex-module.xql";
import module namespace pm-dodis-epub="http://www.tei-c.org/pm/models/dodis/epub/module" at "../transform/dodis-epub-module.xql";
import module namespace pm-dodis-fo="http://www.tei-c.org/pm/models/dodis/fo/module" at "../transform/dodis-fo-module.xql";

declare variable $pm-config:web-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "dodis.odd" return pm-dodis-web:transform($xml, $parameters)
    default return pm-dodis-web:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:print-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "dodis.odd" return pm-dodis-print:transform($xml, $parameters)
    default return pm-dodis-print:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:latex-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "dodis.odd" return pm-dodis-latex:transform($xml, $parameters)
    default return pm-dodis-latex:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:epub-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "dodis.odd" return pm-dodis-epub:transform($xml, $parameters)
    default return pm-dodis-epub:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:fo-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "dodis.odd" return pm-dodis-fo:transform($xml, $parameters)
    default return pm-dodis-fo:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:tei-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "docx.odd" return pm-docx-tei:transform($xml, $parameters)
    default return error(QName("http://www.tei-c.org/tei-simple/pm-config", "error"), "No default ODD found for output mode tei")
            
    
};
            
    